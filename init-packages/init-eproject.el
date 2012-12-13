(require 'eproject-extras)

(define-project-type generic-scm (generic) (or (look-for ".hg") (look-for ".git"))
  :irrelevant-files ("^[.]" "^[#]" ".hg/" ".git/" ".*\\.orig$"))

(define-project-type clojure (generic-scm) (look-for "project.clj"))

(defvar helm-c-source-eproject-files
  '((name . "Files in eProject")
    (init . (lambda () (if (buffer-file-name)
                           (setq helm-eproject-root-dir
                                 (eproject-maybe-turn-on))
                         (setq helm-eproject-root-dir 'nil))))
    (candidates . (lambda () (if helm-eproject-root-dir
                                 (sort (eproject-list-project-files
								   helm-eproject-root-dir) 'string-lessp))))
	(real-to-display . (lambda (real)
						 (substring real (length helm-eproject-root-dir))))
    (type . file))
  "Search for files in the current eProject.")

(defvar helm-c-source-eproject-buffers
  '((name . "Buffers in this eProject")
    (init . (lambda () (if (buffer-file-name)
                           (setq helm-eproject-root-dir
                                 (eproject-maybe-turn-on))
                         (setq helm-eproject-root-dir 'nil))))
    (candidates . (lambda () (if helm-eproject-root-dir
                                 (mapcar 'buffer-name
                                         (cdr (assoc
                                               helm-eproject-root-dir
                                               (eproject--project-buffers)))))))
    (volatile)
    (type . buffer))
  "Search for buffers in this project.")

;;;###autoload
(defun helm-project ()
  "Preconfigured `helm' eproject version \(buffers -> files\)."
  (interactive)
  (helm-other-buffer '(helm-c-source-eproject-buffers
					   helm-c-source-eproject-files
                       helm-c-source-buffer-not-found)
                     "*helm project*"))

(provide 'init-eproject)
