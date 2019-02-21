;;; init -- Where it begins
;;; Commentary:

;;; Code:

;; Bootstrap use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; start server
(require 'server)
(when (and (>= emacs-major-version 23)
           ;;(= emacs-minor-version 1)
		   (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
(server-start)


;; set .emacs.d folder path
(defvar dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(defun add-to-load-path (&rest paths)
  "Add PATHS relative to 'dotfiles-dir' to 'load-path'."
  (dolist (path paths)
    (add-to-list 'load-path (expand-file-name
			     (concat dotfiles-dir path "/")))))

(add-to-load-path  "config" "my")

(defun my/activate-local-virtualenv ()
  "Activate a python virtualenv if project-venv-name is set in .dir-local.el."
  (with-temp-buffer
    (hack-dir-local-variables-non-file-buffer)
    (when (boundp 'project-venv-name)
      (venv-workon project-venv-name))))

;; Packages
(use-package auto-complete
  :ensure t
  :config (global-auto-complete-mode t))
(use-package blackboard-theme
  :ensure t)
(use-package magit
  :ensure t)
(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands))
  :config (smex-initialize))
(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))
(use-package ibuffer
  :init (setq ibuffer-use-other-window t)
  :bind ("C-x C-b" . ibuffer))
(use-package virtualenvwrapper
  :ensure t)
(use-package exec-path-from-shell
  :ensure t
  :config (when (memq window-system '(mac ns))
	    (exec-path-from-shell-initialize)))
(use-package web-mode
  :ensure t
  :preface (progn
	     (defvar electric-pair-inhibit-predicate))
  :init (add-hook 'web-mode-hook
		  (lambda ()
		    (setq-local electric-pair-inhibit-predicate
				`(lambda (c)
				   (if (char-equal c ?{) t (,electric-pair-inhibit-predicate c))))))
  :config (progn
	    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	    (setq web-mode-engines-alist
		  '(("django" . "\\.html?")))))
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))
(use-package jedi
  :ensure t
  :config (progn
	   (add-hook 'python-mode-hook 'jedi:setup)
	   (setq jedi:complete-on-dot t)))
(use-package python
  :config (progn
	    (put 'project-venv-name 'safe-local-variable #'stringp)
	    (add-hook 'python-mode-hook
		    (lambda ()
		      (imenu-add-to-menubar "Browser")
		      (setq indent-tabs-mode nil)
		      (setq python-indent-offset 4)
		      (my/activate-local-virtualenv)))))
(use-package projectile
  :ensure t
  :config (progn
	    (projectile-mode)
	    (setq projectile-switch-project-action
		  '(lambda ()
		     (my/activate-local-virtualenv)
		     (projectile-dired)))))
(use-package drag-stuff
  :ensure t
  :config (progn
	    (drag-stuff-define-keys)
	    (drag-stuff-global-mode t)))
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(use-package ibuffer-vc
  :ensure t
  :config (add-hook 'ibuffer-hook
		    (lambda ()
		      (ibuffer-vc-set-filter-groups-by-vc-root)
		      (unless (eq ibuffer-sorting-mode 'alphabetic)
			(ibuffer-do-sort-by-alphabetic)))))
(use-package perspective
  :ensure t
  :config (progn
	    (persp-mode)
	    (push '(persp-modestring . :never) frameset-filter-alist)
	    (push '(persp-recursive . :never) frameset-filter-alist)
	    (push '(persp-last . :never) frameset-filter-alist)
	    (push '(persp-curr . :never) frameset-filter-alist)
	    (push '(perspectives-hash . :never) frameset-filter-alist)
	    (add-hook 'persp-switch-hook 'my/activate-local-virtualenv)))
(use-package persp-projectile
  :ensure t
  :bind (:map projectile-mode-map
	      ("C-c p P" . projectile-persp-switch-project)))
(use-package wgrep
  :ensure t)

(use-package iedit
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package py-autopep8
  :ensure t
  :config (progn
	    (setq py-autopep8-options '("--ignore=E501"))
	    (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)))

(use-package markdown-mode
  :ensure t
  :defines markdown-command
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc")
  :config (add-hook 'markdown-mode 'turn-on-auto-fill))

(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))
;; configuration stuff
(require 'master-cfg)
;;(put 'downcase-region 'disabled nil)
