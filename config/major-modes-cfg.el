;; Major modes configuration

;;= NXHTML mode 
;;(load "~/.emacs.d/elisp/vendor/nxhtml/autostart.el")

;;= JS2 Mode
(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;= Espresso Mode
(autoload 'espresso-mode "espresso" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))

(require 'flymake-jslint)
(add-hook 'espresso-mode-hook 
	  (function (lambda () 
		      (flymake-jslint-load)
		      (imenu-add-to-menubar "JS-Browser")
		      (textmate-mode 1))))



;; Load starter kit js helpers
(require 'starter-kit-js)

;;=CSS Mode hook
(setq css-imenu-generic-expression
      '((nil "^.==\\(\\b[A-Z]+\\b\\)" 1)))

(add-hook 'css-mode-hook
	  (function (lambda ()
		      (textmate-mode 1)
		      (setq imenu-generic-expression css-imenu-generic-expression)
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


;; Slime
(if (W32)
    (setq inferior-lisp-program "e:/ccl/wx86cl64.exe")
  (setq inferior-lisp-program "/opt/local/ccl/scripts/ccl"))

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