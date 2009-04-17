;; Major modes configuration

;;= NXHTML mode 
(load "~/.emacs.d/elisp/vendor/nxhtml/autostart.el")

;;= JS2 Mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;(add-hook 'js2-mode-hook 'js2-hook-setup)

;; (defun js2-hook-setup ()
;;       (moz-minor-mode 1))

; Load starter kit js helpers
(require 'starter-kit-js)

;;=CSS Mode hook
(setq css-imenu-generic-expression
      '((nil "^.==\\(\\b[A-Z]+\\b\\)" 1)))

(add-hook 'css-mode-hook
	  (function (lambda ()
		      (textmate-mode 1)
		      (setq imenu-generic-expression css-imenu-generic-expression)
		      (imenu-add-to-menubar "CSS Sections")
		      (make-local-variable 'ac-sources)
		      (setq ac-sources '(ac-source-yasnippet ac-source-css ac-source-words-in-buffer)))))

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
