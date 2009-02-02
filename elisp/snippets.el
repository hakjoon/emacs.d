(defun set-consolas ()
  "set the font to consolas"
  (interactive)
  (set-default-font
     "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1"))

(defun w32-list-fonts ()
  "List Windows fonts available"
  (interactive)
  (insert (prin1-to-string (w32-select-font))))

(defun list-fonts ()
  "List fonts"
  (interactive)
  (insert (prin1-to-string (x-list-fonts "*"))))

(defun set-bitstream ()
  "set the font to consolas"
  (interactive)
  (set-default-font
     "-outline-Bitstream Vera Sans Mono-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1"))

(defun compile-new (directory)
  "Compile files where .el is newer. Prompts for directory"
  (interactive "D")
  (byte-recompile-directory directory))

(defun compile-all (directory)
  "Compile all files in a directory. Prompts for directory"
  (interactive "D")
  (byte-recompile-directory directory 0))


(defun list-colors-display-htm (&optional list)
  "Create HTML page which lists all the defined colors."
  (interactive)
  (if (and (null list) window-system)
      (progn
        (setq list (x-defined-colors))
        ;; Delete duplicate colors.
        (let ((l list))
          (while (cdr l)
            (if (facemenu-color-equal (car l) (car (cdr l)))
                (setcdr l (cdr (cdr l)))
              (setq l (cdr l)))))))
  (with-output-to-temp-buffer "*Colors*"
    (save-excursion
      (set-buffer standard-output)
      (insert "<html>\n"
              "<head>\n"
              "<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n"
              "<title>Colors</title>\n"
              "</head>\n"
              "<body>\n"
              "<h1>Colors</h1>\n"
              "<p>\n"
              "<pre>\n")
      (let (s)
        (while list
          (insert (format (concat "<span style=\"background-color:%s\">%-20s</span>"
                                  "  "
                                  "<span style=\"color:%s\">%s</span>"
                                  "\n")
                  (html-color (car list)) (car list) 
                  (html-color (car list)) (car list)))
          (setq list (cdr list))))
      (insert "</pre>"
              "</body>"
              "</html>"))))

(defun html-color (string)
  "Convert colors names to rgb(n1,n2,n3) strings."
  (format "rgb(%d,%d,%d)"
          (/ (nth 0 (x-color-values string)) 256)
          (/ (nth 1 (x-color-values string)) 256)
          (/ (nth 2 (x-color-values string)) 256)))

(provide 'snippets)
