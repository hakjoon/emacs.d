;; Auto Complete mode config

(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/ac-dict")
(ac-config-default)

;; config
(set-face-background 'ac-selection-face "steelblue")
(set-face-background 'ac-candidate-face "white")


;; ;;Additional modes

(setq ac-modes
      (append ac-modes
	      '(espresso-mode)))

;; Common sources
;;(set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer))

;; CSS Sources
(add-hook 'css-mode-hook
	  (lambda()
	    (setq ac-sources '(ac-source-yasnippet ac-source-words-in-buffer ac-source-dictionary ac-source-words-in-same-mode-buffers))))

;; Elisp sources
(add-hook 'emacs-lisp-mode-hook
  	  (lambda()
 	    (setq ac-sources '(ac-source-symbols ac-source-yasnippet ac-source-words-in-buffer))))

;; lisp interaction sources
(add-hook 'lisp-interaction-mode
  	  (lambda()
 	    (setq ac-sources '(ac-source-symbols ac-emacs-lisp-sources ac-source-yasnippet ac-source-words-in-buffer))))



(provide 'autocomplete-cfg)
