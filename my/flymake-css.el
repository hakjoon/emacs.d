(require 'flymake)
(require 'flymake-cursor)

(defun flymake-css-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name)))
	 (jar-file (file-truename 
		    "~/.emacs.d/support-apps/css-validator/css-validator.jar")))
    (list "java" (list "-jar" jar-file "-output" "gnu" (concat "file:" local-file)))))

(defun flymake-css-load ()
  (interactive)
  (setq flymake-allowed-file-name-masks '((".+\\.css$" flymake-css-init)))
  (setq flymake-err-line-patterns
	(cons '("^file:\\([^:]+\\):\\([^:]+\\):\\([^:]+\\):\\(.*\\):" 1 2 nil 4)
	      flymake-err-line-patterns))
  (flymake-mode t))

(provide 'flymake-css)
