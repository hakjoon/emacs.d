;; Windows only functions

;; Am I on a work windows machine?
(defun at-work-p ()
  (equal (getenv "USERDOMAIN") "HQ"))


;; If I'm at work 
(if (at-work-p)
    (progn (set-default-font
	    "-outline-Bitstream Vera Sans Mono-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1")
	   (require 'compress)))


