;; Javascript configuration

(require 'flymake)

(defun flymake-jslint-init ()
  (interactive)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
         (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name)))
	 (conf-file (expand-file-name "~/.emacs.d/support-apps/jsl/jsl.conf")))
    (list (expand-file-name "~/.emacs.d/support-apps/jsl/jsl") (list "-conf" conf-file "-process" local-file))))

(defun flymake-jslint-load ()
  (interactive)
  (setq flymake-allowed-file-name-masks '((".+\\.js$" flymake-jslint-init)))
  (setq flymake-err-line-patterns 
	(cons '("^JSL::\\(.+\\)(\\([[:digit:]]+\\)):\\(lint \\)?\\(.+\\)$"
		1 2 nil 4)
	      flymake-err-line-patterns))
  (flymake-mode t))

(add-hook 'js-mode-hook 
	  (function (lambda ()
		      (imenu-add-to-menubar "JS-Browser")
		      (yas/minor-mode t)
		      (flymake-jslint-load))))

(provide 'js-cfg)