;; Minor modes config

;;=Recent Files
(recentf-mode t)

;;=ido mode
(ido-mode t)

;;=Desktop mode
(desktop-save-mode nil)

;;=yasnippet settings
(require 'yasnippet-cfg)

;;=Autocomplete settings
(require 'autocomplete-cfg)

;;=textmate style matching
(autoload 'textmate-mode "emacs-textmate" "Match braces like textmate" t)

;;=nav
(autoload 'nav "nav" "Nav pane" t)

;;=MozRepl
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

;;=Paredit
(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)


;;=DVC
(require 'dvc-autoloads)

;;== CUA Mode
;; Turn on just rectangle functions
(setq cua-enable-cua-keys nil)
(setq cua-toggle-set-mark nil)
(cua-mode t)

;;== Delete selection mode
(delete-selection-mode t)

;;== Multi-select mode
(autoload 'multi-select-mode "multi-select" nil t)
(multi-select-mode t)

(provide 'minor-modes-cfg)
