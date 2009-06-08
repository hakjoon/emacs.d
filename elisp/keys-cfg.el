;; Keybindings

;; Make control-z undo
(global-set-key (kbd "C-z") 'undo)

;; Cycle buffers with ctrl-tab
(global-set-key [C-tab] 'ido-switch-buffer)


;; Set C-x C-b to open buffer-menu instead of buffer-list
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;;(eval-after-load 'ruby-mode '(define-key ruby-mode-map ... ))


;;=Mouse Scrolling
(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

(provide 'keys-cfg)
