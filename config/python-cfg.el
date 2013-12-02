(require 'flymake)

;; Ipython integration with fgallina/python.el
(defun python-setup-ipython ()
  "Setup ipython integration with python-mode"
  (interactive)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  )

(defun python-setup-django ()
  (interactive)
  (setq-local python-shell-interpreter "python")
  (setq-local python-shell-interpreter-args "/Users/hakjoon/code/python/webtest/manage.py shell")
)

(defun python-workon (env)
  (interactive "P")
  (virtualenv-workon env)
  (setq-local python-shell-virtualenv-path (concat virtualenv-root "webtest"))
)

(defun flymake-python-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "python" (list (expand-file-name (concat dotfiles-dir "support-apps/py-flymake/pyflymake.py")) local-file))))

(defun flymake-python-load ()
  (interactive)
  (setq flymake-allowed-file-name-masks '(("\\.py\\'" flymake-python-init)))
  (setq flymake-err-line-patterns
	(cons '("^\\([^:]+\\):\\([^:]+\\):\\(.+\\)$" 1 2 nil 3) flymake-err-line-patterns))
  (flymake-mode t))


(add-hook 'python-mode-hook
          (lambda ()
	    ;(setq imenu-create-index-function 'python-imenu-create-index)
	    (imenu-add-to-menubar "Browser")
	    (setq indent-tabs-mode nil)
	    (setq python-indent-offset 4)
	    (flymake-python-load)
))

(provide 'python-cfg)
