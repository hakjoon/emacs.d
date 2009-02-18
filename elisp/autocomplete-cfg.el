;; Auto Complete mode config

(require 'auto-complete)
(global-auto-complete-mode t)
(set-face-background 'ac-selection-face "steelblue")
(set-face-background 'ac-menu-face "white")
(setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer))


;; css sources
(defvar ac-source-css
  '((candidates
     . (lambda ()
	 (all-completions ac-target css-property-ids))))
  "Source for CSS keywords.")

(provide 'autocomplete-cfg)
