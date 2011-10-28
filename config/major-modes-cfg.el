;; Major modes configuration

(require 'js-cfg)
(require 'css-cfg)


 ;; (require 'slime-autoloads)
 ;; (slime-setup '(slime-repl))

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(add-hook 'python-mode-hook (lambda () 
			      (setq indent-tabs-mode nil)))


(provide 'major-modes-cfg)
