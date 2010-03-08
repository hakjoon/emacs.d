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
(autoload 'moz-minor-mode "moz" 
  "Mozilla Minor and Inferior Mozilla Modes" t)

;;=Paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

;; Wrap region
(autoload 'wrap-region-mode
  "wrap-region" "Region Wrapping Minor Mode" t)

;;=DVC
(require 'dvc-autoloads)

;; window maagemet stuff
(require 'win-mgmt-cfg.el)

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

;;== iedit
(autoload 'iedit-mode "iedit" nil t)
(define-key global-map (kbd "C-;") 'iedit-mode)
(define-key isearch-mode-map (kbd "C-;") 'iedit-mode)

;; multi-occur help
(require 'aok)

(provide 'minor-modes-cfg)
