;; Functions for running files through the YUI compressor

(defun compress ()
  "Run the file the current buffer points to through YUI Compressor"
  (interactive)
  (let* ((has-file (buffer-file-name(current-buffer)))
		  (compress-buffer "*Compress*")
    (if has-file
	(shell-command (concat "cscript C:/Projects/Fool/Scripts/compress.wsf " has-file) compress-buffer)
      (message has-file)))))

(defun compress-p ()
  "Does the current file have a minified version" 
  (let* ((raw-file (buffer-file-name(current-buffer)))
	 (path-and-file (file-name-sans-extension raw-file))
	 (file-extension (file-name-extension raw-file))
	 (min-file (concat path-and-file (concat ".min." file-extension))))
    (file-exists-p min-file)))

(defun compress-on-save-hook ()
  "If has compressed version add after-save compress hook"
  (when (compress-p)
    (add-hook 'after-save-hook 'compress t t)))

;; Add the hooks for JS and CSS files

(add-hook 'css-mode-hook 'compress-on-save-hook)
(add-hook 'js2-mode-hook 'compress-on-save-hook)

(provide 'compress)