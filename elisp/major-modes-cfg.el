;; Major modes configuration

;;= NXHTML mode 
(load "~/.emacs.d/elisp/vendor/nxhtml/autostart.el")

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

;;======= Color theme stuff ===
(require 'color-theme)

;; Extra Color Themes from mewde
;(load "color-theme-cl-frame")
;(color-theme-cl-frame)
;(load "color-theme-rlx")
;(color-theme-rlx)
;(load "color-theme-colorful-obsolescence")
;(color-theme-colorful-obsolescence)
;(load "color-theme-hakjoon")
;(color-theme-hakjoon)
(load "blackboard")
(color-theme-blackboard)

(provide 'major-modes-cfg)
