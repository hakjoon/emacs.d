;; Settings file


(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

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

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


(provide 'settings-cfg)
