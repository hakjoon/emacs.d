;; Auto Complete mode config

(require 'auto-complete)

;; ac-sources
(require 'auto-complete-yasnippet)
(require 'auto-complete-css)
(require 'auto-complete-emacs-lisp)

;; config
(global-auto-complete-mode t)
(setq ac-auto-start t)
(set-face-background 'ac-selection-face "steelblue")
(set-face-background 'ac-candidate-face "white")
(setq ac-dwim t)

;; if you want enable auto-complete at org-mode, uncomment this line
;; (add-to-list 'ac-trigger-commands 'org-self-insert-command)

;; Common sources
(custom-set-variables
 '(ac-sources 
    '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer)))

;; CSS Sources
(add-hook 'css-mode-hook
   	  (lambda()
 	    (setq ac-sources '(ac-source-yasnippet  ac-source-words-in-buffer))))

;; Elisp sources
 (add-hook 'emacs-lisp-mode-hook
  	  (lambda()
 	    (setq ac-sources '(ac-source-symbols ac-source-yasnippet ac-source-words-in-buffer))))

;; lisp interaction sources
(add-hook 'lisp-interaction-mode
  	  (lambda()
 	    (setq ac-sources '(ac-source-symbols ac-emacs-lisp-sources ac-source-yasnippet ac-source-words-in-buffer))))


(provide 'autocomplete-cfg)
