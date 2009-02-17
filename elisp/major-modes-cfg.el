;; Major modes configuration

;;=CSS Mode hook
(add-hook 'css-mode-hook
	  (function (lambda ()
		      (textmate-mode 1)
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
