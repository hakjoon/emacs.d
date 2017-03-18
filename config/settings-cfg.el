;; Settings file


(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq inhibit-startup-screen t)

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

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(setq new-mode-line '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position (vc-mode vc-mode) "  " (venv-current-name (:eval (concat "[" "workon:" venv-current-name "]"))) " " mode-line-modes mode-line-misc-info mode-line-end-spaces))


(provide 'settings-cfg)
