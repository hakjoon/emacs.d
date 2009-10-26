;; Mac specific options

;; Color-theme
(require 'color-theme)
(load "blackboard")
(color-theme-blackboard)

(setq ns-function-modifier (quote control))

;;Add Macports directory to exec-path
(setq exec-path (append exec-path '("/opt/local/bin")))

;;=Tramp default
(setq tramp-default-method 'ssh)

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
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/w3m")
(require 'w3m-load)

(provide 'mac-cfg)
