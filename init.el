;; server
(server-start)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Search subdirectories of ~/.emacs.d/elisp for .el files
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir dotfiles-dir)
	   (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

;; ELPA
(require 'package)
(package-initialize)
(setq package-user-dir (concat dotfiles-dir "elpa"))

;; configuration stuff
(require 'master-cfg)


(put 'narrow-to-region 'disabled nil)

(put 'upcase-region 'disabled nil)
