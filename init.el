;;; init -- Where it begins
;;; Commentary:

;;; Code:

;; Bootstrap use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
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
  "Add PATHS relative to \\='dotfiles-dir\\=' to \\='load-path\\='."
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

(defun my/use-eslint-from-node-modules ()
  "Use node_modules local ESLint."
  (let ((root (locate-dominating-file
               (or (buffer-file-name) default-directory)
               (lambda (dir)
                 (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" dir)))
                  (and eslint (file-executable-p eslint)))))))
    (when root
      (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" root)))
        (setq-local flycheck-javascript-eslint-executable eslint)))))

(defun my/unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single logical line.
BEG to END.
This is useful, e.g., for use with \\='visual-line-mode\\='."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))


;; Packages
(use-package auto-complete
  :ensure t
  :config (global-auto-complete-mode t))
(use-package blackboard-theme
  :ensure t
  :config (load-theme 'blackboard t))
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
  :if (memq window-system '(mac ns))
  :ensure t
  :config (exec-path-from-shell-initialize))
(use-package web-mode
  :ensure t
  :mode ("\\.\\(?:[dx]?html?\\)\\'" . web-mode)
  :functions electric-pair-default-inhibit
  :hook (web-mode . (lambda ()
                      (setq-local electric-pair-inhibit-predicate
                                  (lambda (c)
                                    (if (char-equal c ?{) t (electric-pair-default-inhibit c))))))
  :custom
  ;; Engine association
  (web-mode-engines-alist '(("django" . "\\.\\(?:[dx]?html?\\)\\'")))

  ;; Django-specific settings
  (web-mode-enable-django-keywords t)
  (web-mode-django-control-blocks
   (append web-mode-django-control-blocks
           '("verbatim" "trans" "blocktrans" "load" "if" "for" "empty")))

  ;; Indentation settings
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-comment-style 2)

  ;; Auto-pairing settings
  (web-mode-enable-auto-pairing t)

  ;; CSS settings
  (web-mode-enable-css-colorization t)

  ;; Highlighting and font settings
  (web-mode-enable-block-face t)
  (web-mode-enable-part-face t)
  (web-mode-enable-comment-keywords t)
  (web-mode-enable-heredoc-fontification t)
  (web-mode-enable-current-element-highlight t))
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
	    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
	    (projectile-mode +1)
	    (setq projectile-switch-project-action
		  '(lambda ()
		     (my/activate-local-virtualenv)
		     (projectile-dired)))))
(use-package drag-stuff
  :ensure t
  :bind (("<M-up>" . drag-stuff-up)
         ("<M-down>" . drag-stuff-down)
         ("<M-left>" . drag-stuff-left)
         ("<M-right>" . drag-stuff-right))
  :config
  (drag-stuff-global-mode 1))
(use-package flycheck
  :defines flycheck-javascript-eslint-executable
  :ensure t
  :init (progn
	  (global-flycheck-mode)
	  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
	  (setq-default flycheck-emacs-lisp-load-path 'inherit)))
(use-package ibuffer-vc
  :ensure t
  :config (add-hook 'ibuffer-hook
		    (lambda ()
		      (ibuffer-vc-set-filter-groups-by-vc-root)
		      (unless (eq ibuffer-sorting-mode 'alphabetic)
			(ibuffer-do-sort-by-alphabetic)))))
(use-package perspective
  :ensure t
  :init (persp-mode)
  :custom (persp-state-default-file (concat dotfiles-dir ".perspectives"))
  :config (progn
	    (add-hook 'persp-switch-hook 'my/activate-local-virtualenv)
	    (add-hook 'kill-emacs-hook #'persp-state-save)
	    (persp-state-load persp-state-default-file)
	    ))
;; (use-package persp-projectile
;;   :ensure t
;;   :bind (:map projectile-mode-map
;; 	      ("C-c p P" . projectile-persp-switch-project)))
(use-package wgrep
  :ensure t)

(use-package iedit
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package transient
  :custom (transient-history-file (concat dotfiles-dir ".transient-history.el")))

(use-package py-autopep8
  :ensure t
  :requires python
  :after python
  :hook (python-mode . py-autopep8-enable-on-save)
  :config (setq py-autopep8-options '("--ignore=E501")))

(use-package markdown-mode
  :ensure t
  :defines markdown-command
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc")
  :config (add-hook 'markdown-mode 'turn-on-auto-fill))

(use-package dockerfile-mode
  :ensure t)

(use-package json-mode
  :ensure t)


(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))
;; configuration stuff

(require 'master-cfg)

(provide 'init)

;;; init.el ends here
