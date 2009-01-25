;; load specific files for different systems

(if(string-equal "w32" window-system)
    (load "win32"))

(provide 'systems)