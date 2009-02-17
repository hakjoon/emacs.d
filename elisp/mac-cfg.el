;; Mac specific options


;;=Initial Frame Sizes
(setq initial-frame-alist '((left . 100) (width . 150)  
(height . 45)))
(setq default-frame-alist '((left . 100) (width . 150)  
(height . 45)))

;; Full screen toggle
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))

(global-set-key [(meta return)] 'toggle-fullscreen)

(provide 'mac)
