;; Mac specific options

(setq ns-function-modifier (quote control))

;; fix exec-path
(exec-path-from-shell-initialize)

;;=Tramp default
(setq tramp-default-method 'ssh)

;;=Initial Frame Sizes
(setq initial-frame-alist '((left . 100) (width . 150)  
(height . 60)))
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
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/w3m")
;;(require 'w3m-load)

(provide 'mac-cfg)
