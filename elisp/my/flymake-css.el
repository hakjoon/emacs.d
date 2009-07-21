(require 'flymake)
(require 'flymake-cursor)

(defun flymake-css-init ()
  (interactive)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
         (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name)))
	 (conf-file (expand-file-name "~/.emacs.d/support-apps/jsl/jsl.conf")))
    (list "jsl" (list "-conf" conf-file "-process" local-file))))

(defun flymake-css-load ()
  (interactive)
  (setq flymake-allowed-file-name-masks '((".+\\.css$" flymake-css-init)))
  (setq flymake-err-line-patterns 
	(cons "^Line : \\([[:digit:]]+\\).*\n\s+\\(.*.*\n\s+.*\\)"
		nil 1 nil 2)
	      flymake-err-line-patterns)
  (flymake-mode t))

(provide 'flymake-jslint)
