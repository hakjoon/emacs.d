(add-hook 'python-mode-hook
          (lambda ()
	    ;(setq imenu-create-index-function 'python-imenu-create-index)
	    (imenu-add-to-menubar "Browser")
	    (setq indent-tabs-mode nil)
	    (setq python-indent-offset 4)
	    (hack-local-variables)
	    (when (boundp 'project-venv-name)
	      (venv-workon project-venv-name))
))

(provide 'python-cfg)
;;; python-cfg.el ends here
