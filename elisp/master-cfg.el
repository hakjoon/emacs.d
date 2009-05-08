;; system configuration


;;=Turn off bell
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;;=Turn on auto-revert-mode
(global-auto-revert-mode 1)

;;=Turn off default backups
(setq make-backup-files nil)
(setq auto-save-default nil)


;; custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;=Abbrevs
;;(setq abbrev-file-name          ;; tell emacs where to read abbrev
;;      "~/elisp/abbrev_defs")    ;; definitions from...
;;(setq save-abbrevs t) ;; save abbrevs when files are saved, after prompt


;;= Bindings
;; Make control-z undo
(global-set-key "\C-z" 'undo)

;; Cycle buffers with ctrl-tab
(define-key global-map [C-tab] 'ido-switch-buffer)

;;=Scrolling
(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))



;;=Load config files
(require 'minor-modes-cfg)
(require 'major-modes-cfg)
(require 'macros)
(require 'auto-install-cfg)
;;(require 'dvc-autoloads)

;; load specific files for different systems

(if(string-equal "w32" window-system)
    (require 'win32-cfg))

(if (or (string-equal "ns" window-system)  (string-equal "mac" window-system))
    (require 'mac-cfg))

(provide 'master-cfg)