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
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(defun add-to-load-path (&rest paths)
  (dolist (path paths)
	(add-to-list 'load-path (expand-file-name 
							 (concat dotfiles-dir path "/")))))

(add-to-load-path  "config" "my")

(use-package magit)
(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands))
  :config (progn
	    (smex-initialize)))
(use-package undo-tree
  :ensure t
  :config (progn
	    (global-undo-tree-mode)))
(use-package ibuffer
  :init (setq ibuffer-use-other-window t)
  :bind ("C-x C-b" . ibuffer))


;; configuration stuff
(require 'master-cfg)
;;(put 'downcase-region 'disabled nil)
