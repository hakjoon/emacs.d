;; Bootstrap use package

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
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
(use-package blackboard-theme
  :ensure t)
(use-package magit)
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
  :ensure t)
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/exapnd-region))
(use-package jedi
  :ensure t
  :config (progn
	   (add-hook 'python-mode-hook 'jedi:setup)
	   (setq jedi:complete-on-dot t)))
(use-package python
  :config (require 'python-cfg))


;; configuration stuff
(require 'master-cfg)
;;(put 'downcase-region 'disabled nil)
