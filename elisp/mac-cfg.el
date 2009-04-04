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

;; w3m
(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/w3m")
(require 'w3m-load)

(provide 'mac-cfg)
