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

;;=Load config files
(require 'keys-cfg)
(require 'minor-modes-cfg)
(require 'major-modes-cfg)
(require 'macros)
(require 'auto-install-cfg)


;; load specific files for different systems

(if (string-equal "w32" window-system)
    (require 'win32-cfg))

(if (or (string-equal "ns" window-system)  (string-equal "mac" window-system))
    (require 'mac-cfg))

(if (string-equal nil window-system)
    (require 'terminal-cfg))

(provide 'master-cfg)