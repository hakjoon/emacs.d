(require 'flymake)

(defun flymake-jslint-init ()
  (interactive)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
         (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "jsl" (list "-conf" "jsl.default.conf" "-process" local-file))))

(defun flymake-jslint-load ()
  (interactive)
  (setq flymake-allowed-file-name-masks '((".+\\.js$" flymake-jslint-init)))
  (setq flymake-err-line-patterns 
;;	(cons '("^\\(.+\\)\:\:\\([[:digit:]]+\\)\:\:\\(.+\\)$"  
	(cons '("^\\(.+\\)$"
		nil nil nil 1)
	      flymake-err-line-patterns))
  (flymake-mode t))

(provide 'flymake-jslint)
