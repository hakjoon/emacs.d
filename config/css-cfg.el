;; CSS Configuration
(require 'flymake)

(setq css-imenu-generic-expression
      '((nil "^.==\\(\\b[A-Z]+\\b\\)" 1)))

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

(add-hook 'css-mode-hook
	  (function (lambda ()
		      ;;(flymake-css-load)
		      (setq imenu-generic-expression css-imenu-generic-expression)
		      (local-set-key (kbd "RET") 'newline-and-indent)
		      (imenu-add-to-menubar "CSS Sections"))))

(provide 'css-cfg)
