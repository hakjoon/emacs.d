;;=windowing system detection helpers

(defun W32 ()
  "Is this windows"
  (string-equal "w32" window-system))

(defun OSX ()
  "Is this OSX"
  (or (string-equal "ns" window-system)  (string-equal "mac" window-system)))

(defun Terminal ()
  "Is this a terminal session"
  (string-equal nil window-system))

(provide 'window-systems)
