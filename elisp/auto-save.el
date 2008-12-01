;; Auto save file
;; Auto saves using existing file instead of backup file
;;
;; By Bryan Murdock
;; http://bryan-murdock.blogspot.com/2008/03/beat-save-habit.html

(defun save-buffer-if-visiting-file (&optional args)
  "Save the current buffer only if it is visiting a file"
  (interactive)
  (if (buffer-file-name)
      (save-buffer args)))

(add-hook 'auto-save-hook 'save-buffer-if-visiting-file)