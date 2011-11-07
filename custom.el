;;======= Custom set Variables ==

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "gray12"))))
 '(linum ((t (:inherit (shadow default) :background "grey10"))))
 '(moinmoin-code ((t (:foreground "purple2"))))
 '(moinmoin-url ((t (:foreground "green4" :height 0.9))))
 '(moinmoin-url-title ((t (:foreground "green3" :underline t))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) (:background "black1"))))
 '(region ((t (:background "skyblue3" :foreground "white")))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(company-idle-delay 0.5)
 '(company-tooltip-delay 0.5)
 '(desktop-path (quote ("~/.emacs.d")))
 '(dvc-config-directory "~/.emacs.d/.dvc/")
 '(dvc-tips-enabled nil)
 '(eshell-directory-name "~/.emacs.d/.eshell/")
 '(flyspell-use-meta-tab nil)
 '(global-hl-line-mode t)
 '(ido-save-directory-list-file "~/.emacs.d/.ido.last")
 '(js2-basic-offset 4)
 '(js2-highlight-level 3)
 '(js2-indent-on-enter-key t)
 '(js2-mode-indent-ignore-first-tab t)
 '(mac-emulate-three-button-mouse (quote reverse))
 '(mac-pass-command-to-system t)
 '(ns-alternate-modifier (quote control))
 '(ns-command-modifier (quote meta))
 '(nxhtml-skip-welcome t)
 '(nxml-slash-auto-complete-flag t)
 '(php-basic-offset 8)
 '(php-indent-tabs-mode nil)
 '(php-intelligent-tab nil)
 '(php-mode-force-pear t)
 '(quack-default-program "racket")
 '(quack-fontify-style (quote emacs))
 '(quack-smart-open-paren-p nil)
 '(recentf-menu-before "Open Directory...")
 '(recentf-menu-title "Recent Files")
 '(recentf-save-file "~/.emacs.d/.recentf")
 '(safe-local-variable-values (quote ((prompt-to-byte-compile))))
 '(save-place t nil (saveplace))
 '(save-place-file "~/.emacs.d/.emacs-places")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(sql-mysql-program "mysql5")
 '(tool-bar-mode nil)
 '(tramp-persistency-file-name "/Users/hakjoon/.emacs.d/tramp.persist")
 '(transient-mark-mode t))
