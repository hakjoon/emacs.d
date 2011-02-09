;; set .emacs.d folder path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Search subdirectories of dotfiles-dir for .el files
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((default-directory dotfiles-dir))
      (setq load-path (cons dotfiles-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

;; ELPA
(require 'package)
(package-initialize)
(setq package-user-dir (concat dotfiles-dir "elpa"))

;; configuration stuff
(require 'master-cfg)


(put 'narrow-to-region 'disabled nil)

(put 'upcase-region 'disabled nil)

;;; EmacsClient

(require 'server)
(when (and (= emacs-major-version 23)
           (= emacs-minor-version 1)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
(server-start 1)
