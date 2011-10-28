;; Minor modes config

;;=Recent Files
(recentf-mode t)

;;=ido mode
(ido-mode t)

;;=Desktop mode
(desktop-save-mode nil)

;; windmove bindings on
(windmove-default-keybindings 'meta)

;;== CUA Mode
;; Turn on just rectangle functions
(setq cua-enable-cua-keys nil)
(setq cua-toggle-set-mark nil)
;;(cua-mode t)

;;== Delete selection mode
(delete-selection-mode t)

(setq ibuffer-use-other-window t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'minor-modes-cfg)
