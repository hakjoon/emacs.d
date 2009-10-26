(defun color-theme-colorful-obsolescence ()
  "Color theme Colorful Obsolescence by Scott Jaderholm, created 2007-01-05."
  (interactive)
  (let ((color-theme-is-cumulative t))
    (color-theme-install
     '(color-theme-colorful-obsolescence
;;; General
       ((background-color . "#000")
	(background-mode . dark)
	(background-toolbar-color . "#000")
	(border-color . "#000")
	(bottom-toolbar-shadow-color . "#000")
	(cursor-color	. "#FFF")
	(foreground-color . "#bbb")
	(top-toolbar-shadow-color . "#111"))
       (default ((t (nil))))
       (bold ((t (:bold t))))
       (button ((t (:bold t))))
       (fringe ((t (:background "#000" :foreground "#444"))))
;;       (highlight ((t (:background "#008ed1" :foreground "white"))))
       (highlight ((t (:background "#555" :foreground "white"))))
       (lazy-highlight-face ((t (:foreground "#bbb" :background "#5555ff"))))
;;        (isearch ((t (:foreground "white" :background "#008ed1"))))
;;        (isearch-lazy-highlight-face ((t (:foreground "#bbb" :background "#5555ff"))))
       (isearch ((t (:foreground "white" :background "#555"))))
       (isearch-lazy-highlight-face ((t (:foreground "#ddd" :background "#333"))))

       (isearch-fail ((t (:foreground "#ee3c3c"))))
       (menu ((t (:background "#111" :foreground "#444"))))
       (minibuffer-prompt ((t (:foreground "#777"))))
       (minibuffer-noticeable-prompt ((t (:foreground "#777"))))
       (modeline ((t (:background "#000" :foreground "#bbb"))))
       (mode-line ((t (:background "black"))))
       (mode-line-inactive ((t (:background "#000" :foreground "#444"))))
       (modeline-buffer-id ((t (:foreground "#FFF"))))
       (modeline-mousable ((t (:background "#000" :foreground "#555"))))
       (modeline-mousable-minor-mode ((t (:background "#000" :foreground "#555"))))
       (mode-line-highlight ((t (:foreground "#b9FC6D"))))
       (region ((t (:background "#333"))));5ff
       (secondary-selection ((t (:background "#333" ))))
       (show-paren-match-face ((t (:foreground "white" :bold t))))
       (show-paren-mismatch-face ((t (:foreground "white" :background "#ee3c3c"))))
       (calendar-today ((t (:foreground "white"))))
;; Haven't seen these faces so I haven't bothered themeing them
;       (custom-button-face ((t (:bold t :foreground "#999"))))
;       (header-line ((t (:background "#333" :foreground "#000"))))
;       (holiday-face ((t (:background "#000" :foreground "#777"))))
;       (italic ((t (:bold t))))
;       (underline ((t (:bold t))))
;       (variable-pitch ((t (nil))))
;       (widget-button-face ((t (:bold t :foreground "#888"))))
;       (widget-field-face ((t (:bold t :foreground "#999"))))
;       (tool-bar ((t (:background "#111" :foreground "#777"))))
;       (tooltip ((t (:background "#333" :foreground "#777"))))
     (highline-face ((t (:background "#222"))))
     (highline-vertical-face ((t (:background "#111"))))
;;; Info
     (info-xref-face ((t (:foreground "#ddd"))))


;;; Font-lock
;; Haven't seen these faces so I haven't bothered themeing them
;     (font-lock-doc-face ((t (:foreground "#777"))))
;     (font-lock-preprocessor-face ((t (:foreground "#777"))))
;     (font-lock-reference-face ((t (:foreground "#777"))))
     (font-lock-type-face ((t (:foreground "#b9FC6D"))))
;     (font-lock-warning-face ((t (:bold t :foreground "#999"))))
     (font-lock-builtin-face ((t (:foreground "#5555ff"))))


     (font-lock-doc-string-face ((t (:foreground "yellow" :bold t))))

     (font-lock-function-name-face ((t (:foreground "#ff55ff")))) ;; month
     (font-lock-constant-face ((t (:foreground "#9651cc")))) ;; days
     (font-lock-comment-face ((t (:foreground "#008ed1")))) ;; sat/sun

     (font-lock-keyword-face ((t (:foreground "#ff5555"))))
     (font-lock-string-face ((t (:foreground "#ffff55"))))
     (font-lock-variable-name-face ((t (:foreground "#ff55ff"))))

;;; Eshell
     (eshell-ls-directory ((t (:foreground "#008ed1"))))
     (eshell-ls-archive ((t (:foreground "#ee3c3c"))))
     (eshell-prompt ((t (:foreground "white"))))

;;; Org-mode
     (org-level-1 ((t (:foreground "#5555ff"))))
     (org-level-2 ((t (:foreground "#ffff55"))))
     (org-level-3 ((t (:foreground "#008ed1"))))
     (org-level-4 ((t (:foreground "#ff55ff"))))
     (org-level-5 ((t (:foreground "#00bb00"))))
     (org-level-6 ((t (:foreground "#9651cc"))))
     (org-link ((t (:foreground "#ffffff"))))
     (org-scheduled ((t (:foreground "#00bb00"))))
     (org-scheduled-today ((t (:foreground "#55ff55"))))
     (org-scheduled-previously ((t (:foreground "#00bb00"))))
     (org-special-keyword ((((class color) (background dark)) (:foreground "#55ff55"))))
     (org-special-keyword ((t (:foreground "#00bb00"))))
     (org-warning ((t (:foreground "#ee3c3c"))))
     (org-table ((t (:foreground "#555555"))))
     (org-tag ((t (:foreground "#55ff55"))))
     (org-time-grid ((t (:foreground "#555"))))
     (org-todo ((t (:foreground "#ff5555"))))
     (org-upcoming-deadline ((t (:foreground "#ff5555"))))
     (org-date ((t (:foreground "#999" )))) ;; "#00ffff"
     (org-done ((t (:foreground "#55ff55"))))

;;; Ido
     (ido-first-match-face ((t (:foreground "white"))))
;;     (ido-only-match-face ((t (:foreground "#55ff55"))))
     (ido-only-match-face ((t (:foreground "#b9FC6D"))))
     (ido-subdir-face ((t (:foreground "#008ed1"))))
))))

(provide 'color-theme-colorful-obsolescence)