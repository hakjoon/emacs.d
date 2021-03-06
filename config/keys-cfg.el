
;; Keybindings

;; Make control-z undo
(global-set-key (kbd "C-z") 'undo)

;; Cycle buffers with ctrl-tab
;;(global-set-key [C-tab] 'ido-switch-buffer)

;;(eval-after-load 'ruby-mode '(define-key ruby-mode-map ... ))

;;(windmove-default-keybindings 'ctrl)

;;=Mouse Scrolling
;; (defun smooth-scroll (increment)
;;   (scroll-up increment) (sit-for 0.05)
;;   (scroll-up increment) (sit-for 0.02)
;;   (scroll-up increment) (sit-for 0.02)
;;   (scroll-up increment) (sit-for 0.05)
;;   (scroll-up increment) (sit-for 0.06)
;;   (scroll-up increment))

;;(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
;;(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

;; (autoload 'dired-jump "dired-x"
;;   "Jump to Dired buffer corresponding to current buffer." t)

;; (autoload 'dired-jump-other-window "dired-x"
;;   "Like \\[dired-jump] (dired-jump) but in other window." t)

;; (global-set-key (kbd "C-x C-j") 'dired-jump)
;; (global-set-key (kbd "C-x 4 C-j") 'dired-jump-other-window)

(global-set-key (kbd "M-g c") 'compile)
(global-set-key (kbd "M-g r") 'recompile)

(provide 'keys-cfg)
