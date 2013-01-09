;;=windowing system detection helpers

(defun W32 ()
  "Is this windows"
  (string-equal "w32" window-system))

(defun OSX ()
  "Is this OSX"
  (or (string-equal "ns" window-system)  (string-equal "mac" window-system)))

(defun X ()
  "Is this X"
  (string-equal "x" window-system)
)

(defun Terminal ()
  "Is this a terminal session"
  (string-equal nil window-system))


(defun setup-window-system-frame-colours (&rest frame)
  (if window-system
      (let ((f (if (car frame)
		   (car frame)
		 (selected-frame))))
	(progn
	  (set-frame-font "Bera Sans Mono-11")
	  (set-face-background 'default "#232F2F" f)
	  (set-face-foreground 'default "#FFFFFF" f)
	  (set-face-background 'fringe  "#000000" f)
	  (set-face-background 'cursor "#2F4F4F" f)
	  (set-face-background 'mode-line "#2F4F4F" f)
	  (set-face-foreground 'mode-line "#BCBf91" f)))))

(require 'server)
(defadvice server-create-window-system-frame
  (after set-window-system-frame-colours ())
  "Set custom frame colours when creating the first frame on a display"
  (message "Running after frame-initialize")
  (setup-window-system-frame-colours))
(ad-activate 'server-create-window-system-frame)
(add-hook 'after-make-frame-functions 'setup-window-system-frame-colours t)

(provide 'window-systems)
