; -*- mode: emacs-lisp -*-
;;
;; Load DVC easily ...
;;
;; Manually, you can run
;;
;;   M-x load-file RET /path/to/dvc-load.el RET
;;
;; (usefull when you want to load DVC after starting "emacs -q"!), or
;; add
;;
;;   (load-file "/path/to/this/file/in/installdir/dvc-load.el")
;;
;; to your ~/.emacs.el

(add-to-list 'load-path "/Users/hakjoon/.emacs.d/elisp/vendor/dvc/")
(add-to-list 'Info-default-directory-list "/Applications/Emacs.app/Contents/Resources/info")

(if (featurep 'dvc-core)
    (dvc-reload)
  (if (featurep 'xemacs)
      (require 'auto-autoloads)
    (require 'dvc-autoloads)))

