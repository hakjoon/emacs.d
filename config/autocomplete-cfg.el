;; Auto Complete mode config

;;(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat el-get-dir "auto-complete/ac-dict"))
(setq ac-dwim t)
(ac-config-default)

;; config
(set-face-background 'ac-selection-face "steelblue")
(set-face-background 'ac-candidate-face "white")

(define-key ac-complete-mode-map "\t" 'ac-expand)
(define-key ac-complete-mode-map "\r" 'ac-complete)
(define-key ac-complete-mode-map "\M-n" 'ac-next)
(define-key ac-complete-mode-map "\M-p" 'ac-previous)

(defvar ac-source-etags
  '((candidates . (lambda () 
         (all-completions ac-target (tags-completion-table))))
    (candidate-face . ac-candidate-face)
    (selection-face . ac-selection-face)
    (requires . 3))
  "Source for etags.")

;; ropemacs Integration with auto-completion
(defun ac-ropemacs-candidates ()
  (mapcar (lambda (completion)
      (concat ac-prefix completion))
    (rope-completions)))

(ac-define-source nropemacs
  '((candidates . ac-ropemacs-candidates)
    (symbol     . "p")))

(ac-define-source nropemacs-dot
  '((candidates . ac-ropemacs-candidates)
    (symbol     . "p")
    (prefix     . c-dot)
    (requires   . 0)))

;; extended ropemacs

(defun ac-eropemacs-candidates ()
  (mapcar (lambda (proposal)
          (destructuring-bind (name doc type) proposal
            (list (concat ac-prefix name) doc
                  (if type (substring type 0 1) nil))))
        (rope-extended-completions)))

(defun ac-nropemacs-setup ()
  (setq ac-sources (append '(ac-source-nropemacs
                             ac-source-nropemacs-dot) ac-sources)))

;; extended ropemacs

(defun ac-eropemacs-document (item) (car  item))
(defun ac-eropemacs-symbol   (item) (cadr item))

(ac-define-source extended-ropemacs
  '((candidates . ac-eropemacs-candidates)
    (document   . ac-eropemacs-document)
    (symbol     . ac-eropemacs-symbol)))

(ac-define-source extended-ropemacs-dot
  '((candidates . ac-eropemacs-candidates)
    (document   . ac-eropemacs-document)
    (symbol     . "r")
    (prefix     . c-dot)
    (requires   . 0)))

(defun ac-eropemacs-setup ()
  (setq ac-sources (append '(ac-source-extended-ropemacs
                             ac-source-extended-ropemacs-dot) ac-sources)))

(defun ac-ropemacs-setup ()
  (if (functionp 'rope-extended-completions)
      (add-hook 'python-mode-hook 'ac-eropemacs-setup)
    (add-hook 'python-mode-hook 'ac-nropemacs-setup)))

;; ;;Additional modes

(setq ac-modes
      (append ac-modes
	      '(js-mode nxml-mode scss-mode)))

;; Common sources
(set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-same-mode-buffers ac-source-words-in-buffer))

;; CSS Sources
(add-hook 'css-mode-hook
	  (lambda()
	    (setq ac-sources '(ac-source-yasnippet ac-source-words-in-same-mode-buffers ac-source-words-in-buffer ac-source-dictionary))))

;; Elisp sources
(add-hook 'emacs-lisp-mode-hook
  	  (lambda()
 	    (setq ac-sources '(ac-source-symbols ac-source-yasnippet ac-source-words-in-buffer))))

;; lisp interaction sources
(add-hook 'lisp-interaction-mode
  	  (lambda()
 	    (setq ac-sources '(ac-source-symbols ac-emacs-lisp-sources ac-source-yasnippet ac-source-words-in-buffer))))

;; Python sources 
(add-hook 'rope-open-project-hook
	  (lambda ()
	    (if (functionp 'rope-extended-completions)
		(ac-eropemacs-setup)
	      (ac-nropemacs-setup))))

;; (add-hook 'python-mode-hook
;;           (lambda ()
;; 	    (setq ac-sources (append '(ac-source-etags)))))

(provide 'autocomplete-cfg)
