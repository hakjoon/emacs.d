(defun set-consolas ()
  "set the font to consolas"
  (interactive)
  (set-default-font
     "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1"))

(defun list-fonts ()
  "List fonts available"
  
  (interactive)
  (insert (prin1-to-string (w32-select-font))))

(defun set-bitstream ()
  "set the font to consolas"
  (interactive)
  (set-default-font
     "-outline-Bitstream Vera Sans Mono-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1"))


(defun compress ()
  "Run the file the current buffer points to through YUI Compressor"
  (interactive)
  (setq has-file (buffer-file-name(current-buffer)))
  (setq compress-buffer "*Compress*")
  (if has-file
      (progn
	(shell-command (concat "cscript C:/Projects/Fool/Scripts/compress.wsf " has-file) compress-buffer)
	(switch-to-buffer compress-buffer))
	(message has-file)))
