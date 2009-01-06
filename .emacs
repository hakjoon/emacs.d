;;=Search subdirectories of ~/elisp for .el files
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/elisp/")
	   (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

;;=Turn off default backups
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Full screen toggle
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))

(global-set-key [(meta return)] 'toggle-fullscreen)

(autoload 'textmate-mode "emacs-textmate" "Match braces like textmate" t)
(setq tramp-default-method 'ssh)


;;; This causes files that I'm editing to be saved automatically by the
;;; emacs auto-save functionality, but uses auto-save.el
;;(load "auto-save")
;;(setq auto-save-interval 60) ;; save every n characters typed (20 is the minimum)
;;(setq auto-save-timeout 60) ;; save after n second of idle time (default is 30)


;;=Frame Sizes
(setq initial-frame-alist '((left . 100) (width . 150)  
(height . 45)))
(setq default-frame-alist '((left . 100) (width . 150)  
(height . 45)))

;;=Enable skeleton-pair insert globally
;;(setq skeleton-pair t)
;;(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)

;;=Remap some keys
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map [C-tab] 'ido-switch-buffer)

;;=Desktop session save
(desktop-save-mode nil)

;;=Abbrevs
(setq abbrev-file-name             ;; tell emacs where to read abbrev
      "~/elisp/abbrev_defs")    ;; definitions from...

(setq save-abbrevs t)              ;; save abbrevs when files are saved, after prompt

(require 'mercurial)

;;======= CSS Mode =============
(setq cssm-newline-before-closing-bracket t)

;;======= Recentf =============
(require 'recentf)
(recentf-mode t)

;;====== ido mode ============
;; ido mode
(require 'ido)
(ido-mode t)

;;====== nxhtml/nxml mode =====
;;(load "~/elisp/nxml/autostart.el")

;;====== js2 mode =============
;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;;===== company-mode =========
;;(require 'company-mode)
;;(require 'company-bundled-completions)
;;(company-install-bundled-completions-rules)

;;======= tabbar ==============
;(require 'tabbar)
;(tabbar-mode)

;;======= Color theme stuff ===
(require 'color-theme)

;; Extra Color Themes from mewde
;(load "color-theme-cl-frame")
;(color-theme-cl-frame)
;(load "color-theme-rlx")
;(color-theme-rlx)
;(load "color-theme-colorful-obsolescence")
;(color-theme-colorful-obsolescence)
(load "color-theme-hakjoon")
(color-theme-hakjoon)

;;======= Custom set Variables ==
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(company-idle-delay 0.5)
 '(company-tooltip-delay 0.5)
 '(js2-basic-offset 4)
 '(js2-indent-on-enter-key t)
 '(js2-mode-indent-ignore-first-tab t)
 '(mac-emulate-three-button-mouse (quote reverse))
 '(mac-option-modifier (quote meta))
 '(mac-pass-command-to-system t)
 '(nxhtml-skip-welcome t)
 '(php-basic-offset 8)
 '(php-indent-tabs-mode nil)
 '(php-intelligent-tab nil)
 '(php-mode-force-pear t)
 '(recentf-menu-before "Open Directory...")
 '(recentf-menu-title "Recent Files")
 '(safe-local-variable-values (quote ((prompt-to-byte-compile))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(sql-mysql-program "mysql5")
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) (:background "black1")))))

;; Macros

;; gets rid of 
(fset 'fixms
   [?\M-< ?\M-x ?r ?e ?p ?l ?a ?c ?e ?- ?a ?s backspace backspace ?s ?t ?r ?i ?n ?g return ?\C-q ?\C-m return return])

(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
