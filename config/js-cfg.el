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

(setq flymake-node-jshint-config "~/.emacs.d/support-apps/jshintrc.json") 

(defun flymake-jshint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name)))
         (arglist (list local-file)))
    (if flymake-node-jshint-config
        (setq arglist (append arglist (list "--config" (expand-file-name flymake-node-jshint-config)))))
    (list flymake-node-jshint-program arglist)))

(defun flymake-jshint-load ()
  (interactive)
  (setq flymake-err-line-patterns
		(cons '(".*: line \\([[:digit:]]+\\), col \\([[:digit:]]+\\), \\(.*\\)$"
				nil 1 2 3)
			  flymake-err-line-patterns))
  (add-to-list 'flymake-allowed-file-name-masks
			   '("\\.js\\'" flymake-jshint-init)
			   '("\\.json\\'" flymake-jshint-init))
  (setq flymake-node-jshint-config nil)
  (setq flymake-node-jshint-program "jshint")
  (flymake-mode t))

(add-hook 'js-mode-hook 
	  (function (lambda ()
		      (imenu-add-to-menubar "JS-Browser")
		      (yas/minor-mode t)
		      (flymake-jshint-load))))

(provide 'js-cfg)
