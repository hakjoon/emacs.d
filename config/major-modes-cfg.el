;; Major modes configuration

;;= NXHTML mode 
;;(load "~/.emacs.d/elisp/vendor/nxhtml/autostart.el")

;;= JS2 Mode
;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;= Espresso Mode
;;(autoload 'espresso-mode "espresso" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))

(require 'flymake-jslint)
(require 'js-comint)
(setq inferior-js-program-command "/usr/bin/java org.mozilla.javascript.tools.shell.Main")
(add-hook 'js-mode-hook 
	  (function (lambda ()
		      (imenu-add-to-menubar "JS-Browser")
		      (yas/minor-mode t)
		      (local-set-key "\C-x\C-e" 'js-send-last-sexp)
		      (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
		      (local-set-key "\C-cb" 'js-send-buffer)
		      (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
		      (local-set-key "\C-cl" 'js-load-file-and-go)
		      ;(textmate-mode 1)	
		      (flymake-jslint-load))))



;; Load starter kit js helpers
(require 'starter-kit-js)

;;=CSS Mode hook
(setq css-imenu-generic-expression
      '((nil "^.==\\(\\b[A-Z]+\\b\\)" 1)))
(require 'flymake-css)
(add-hook 'css-mode-hook
	  (function (lambda ()
		      (flymake-css-load)
		      (setq imenu-generic-expression css-imenu-generic-expression)
		      (local-set-key (kbd "RET") 'newline-and-indent)
		      (imenu-add-to-menubar "CSS Sections"))))

;; Python Mode 

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
				   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

;; PHP Mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-hook 'php-mode-hook
	  (function (lambda ()
		      (imenu-add-to-menubar "PHP-Browser"))))


;; Slime Clojure only for now
(setq inferior-lisp-program "~/code/programming-clojure/bin/repl-il.sh")



(require 'slime-autoloads)
(slime-setup '(slime-repl slime-editing-commands))



;;======= Color theme stuff ===


;; Extra Color Themes from mewde
;(load "color-theme-cl-frame")
;(color-theme-cl-frame)
;(load "color-theme-rlx")
;(color-theme-rlx)
;(load "color-theme-colorful-obsolescence")
;(color-theme-colorful-obsolescence)
;(load "color-theme-hakjoon")
;(color-theme-hakjoon)

(provide 'major-modes-cfg)
