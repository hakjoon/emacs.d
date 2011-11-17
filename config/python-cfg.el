(require 'flymake)

;; Ipython integration with fgallina/python.el
(defun epy-setup-ipython ()
  "Setup ipython integration with python-mode"
  (interactive)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \[[0-9]+\]: "
   python-shell-prompt-output-regexp "Out\[[0-9]+\]: "
   python-shell-completion-setup-code ""
   python-shell-completion-string-code "';'.join(__IP.complete('''%s'''))\n")
  )

(defun flymake-python-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name)))
	 (py-flymake-dir (expand-file-name (concat dotfiles-dir "support-apps/py-flymake/")))
	 (py-flymake-command (concat py-flymake-dir "bin/python"))
	 (py-flymake-script (concat py-flymake-dir "pyflymake.py")))
    (list py-flymake-command (list py-flymake-script local-file))))

(defun flymake-python-load ()
  (interactive)
  (setq flymake-allowed-file-name-masks '(("\\.py\\'" flymake-python-init)))
  (setq flymake-err-line-patterns
	(cons '("^\\([^:]+\\):\\([^:]+\\):\\(.+\\)$" 1 2 nil 3) flymake-err-line-patterns))
  (flymake-mode t))


(add-hook 'python-mode-hook
          (lambda ()
	    (setq imenu-create-index-function 'python-imenu-create-index)
	    (imenu-add-to-menubar "Browser")
	    (setq indent-tabs-mode nil)
	    (setq python-indent-offset 4)
	    (flymake-python-load)))

(message "locading python-cfg")
(provide 'python-cfg)
