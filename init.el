(server-start)
(setq visible-bell t)
;;=Search subdirectories of ~/.emacs.d/elisp for .el files
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/elisp")
	   (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'systems)



(global-auto-revert-mode 1)

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
;; Make control-z undo
(global-set-key "\C-z" 'undo)

(autoload 'textmate-mode "emacs-textmate" "Match braces like textmate" t)
(setq tramp-default-method 'ssh)

;;=Frame Sizes
(setq initial-frame-alist '((left . 100) (width . 150)  
(height . 45)))
(setq default-frame-alist '((left . 100) (width . 150)  
(height . 45)))

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

;;====== AutoComplete ==========
(require 'auto-complete)
(global-auto-complete-mode t)
(set-face-background 'ac-selection-face "steelblue")
(set-face-background 'ac-menu-face "white")
(setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer))

;;======= CSS Mode =============
(defvar ac-source-css
  '((candidates
     . (lambda ()
	 (all-completions ac-target css-property-ids))))
  "Source for CSS keywords.")

(add-hook 'css-mode-hook
	  (function (lambda ()
		      (textmate-mode 1)
		      (make-local-variable 'ac-sources)
		      (setq ac-sources '(ac-source-yasnippet ac-source-css ac-source-words-in-buffer)))))

;;======= Recentf =============
(require 'recentf)
(recentf-mode t)

;;====== ido mode ============
;; ido mode
(require 'ido)
(ido-mode t)

;;===== yas ==================
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elisp/snippets/")


;;======= Color theme stuff ===
(require 'color-theme)

;; Extra Color Themes from mewde
;(load "color-theme-cl-frame")
;(color-theme-cl-frame)
;(load "color-theme-rlx")
;(color-theme-rlx)
;(load "color-theme-colorful-obsolescence")
;(color-theme-colorful-obsolescence)
;(load "color-theme-hakjoon")
;(color-theme-hakjoon)
(load "blackboard")
(color-theme-blackboard)


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