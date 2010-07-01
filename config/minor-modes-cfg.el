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

;;=textmate style elemen pairing
(autoload 'autopair-global-mode "autopair" 
  "Automatic pairing of quotes, parenthesis etc" t)
(autopair-global-mode)

;;=nav
(autoload 'nav "nav" "Nav pane" t)

;;=MozRepl
(autoload 'moz-minor-mode "moz" 
  "Mozilla Minor and Inferior Mozilla Modes" t)

;;=Paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

;; Wrap region
(autoload 'wrap-region-mode "wrap-region" 
  "Region Wrapping Minor Mode" t)
(autoload 'wrap-region-mode-insert-twice "wrap-region" 
  "wrap region with stuff" t)
(setq wrap-region-insert-twice t)

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
(autoload 'multi-select-mode "multi-select" "Multi selection mode" t)
(multi-select-mode t)

;;== iedit
(autoload 'iedit-mode "iedit" "Interactive editing mode" t)
(define-key global-map (kbd "C-;") 'iedit-mode)
(define-key isearch-mode-map (kbd "C-;") 'iedit-mode)

;;== Drag stuff
(autoload 'drag-stuff-global-mode "drag-stuff" "Interactive keyboard draging global mode" t)
(drag-stuff-global-mode t)

;; IBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; multi-occur help
(require 'aok)

(provide 'minor-modes-cfg)
