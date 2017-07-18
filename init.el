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
  :config (add-hook 'python-mode-hook
		    (lambda ()
		      (imenu-add-to-menubar "Browser")
		      (setq indent-tabs-mode nil)
		      (setq python-indent-offset 4)
		      (hack-local-variables)
		      (when (boundp 'project-venv-name)
			(venv-workon project-venv-name)))))
(use-package projectile
  :ensure t
  :config (progn
	    (projectile-mode)
	    (setq projectile-switch-project-action #'projectile-dired)))
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
  :config (persp-mode))
(use-package persp-projectile
  :ensure t)

(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))
;; configuration stuff
(require 'master-cfg)
;;(put 'downcase-region 'disabled nil)
