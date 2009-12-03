;; Yasnippet Config

(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory '("~/.emacs.d/my/snippets"
			  "~/.emacs.d/vendor/yasnippet-0.6.1c/snippets"))

(mapc 'yas/load-directory yas/root-directory)


(provide 'yasnippet-cfg)
