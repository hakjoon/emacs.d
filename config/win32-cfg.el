;; Windows only functions

;; Color-theme
(require 'color-theme)
(load "blackboard")
(color-theme-blackboard)

;;=Tramp default
(setq tramp-default-method 'plink)

;; Am I on a work windows machine?
(defun at-work-p ()
  (equal (getenv "USERDOMAIN") "HQ"))


;; If I'm at work 
(if (at-work-p)
    (progn (set-default-font
	    "-outline-Bitstream Vera Sans Mono-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1")
	   ;;=Initial Frame Sizes
	   (setq initial-frame-alist '((top . 10 ) (left . 20) 
				       (width . 150) (height . 60)))
	   (cd "c:/Projects/Fool/")
	   ;;(setq default-frame-alist initial-frame-alist)
	   (require 'compress)))

(provide 'win32-cfg)

