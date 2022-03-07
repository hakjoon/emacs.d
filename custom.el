;;======= Custom set Variables ==

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-infoline ((t (:background "gray29"))))
 '(iedit-occurrence ((t (:background "gray22"))))
 '(linum ((t (:inherit (shadow default) :background "grey10"))) t)
 '(moinmoin-code ((t (:foreground "purple2"))) t)
 '(moinmoin-url ((t (:foreground "green4" :height 0.9))) t)
 '(moinmoin-url-title ((t (:foreground "green3" :underline t))) t)
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)) t)
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) (:background "black1"))) t)
 '(region ((t (:background "skyblue3" :foreground "white")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(company-idle-delay 0.5)
 '(company-tooltip-delay 0.5)
 '(custom-safe-themes
   '("43b219a31db8fddfdc8fdbfdbd97e3d64c09c1c9fdd5dff83f3ffc2ddb8f0ba0" "f641bdb1b534a06baa5e05ffdb5039fb265fde2764fbfd9a90b0d23b75f3936b" default))
 '(desktop-path '("~/.emacs.d"))
 '(dired-dwim-target t)
 '(dvc-config-directory "~/.emacs.d/.dvc/")
 '(dvc-tips-enabled nil)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(eshell-directory-name "~/.emacs.d/.eshell/")
 '(flyspell-use-meta-tab nil)
 '(global-hl-line-mode t)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".tox" "node_modules"))
 '(ido-save-directory-list-file "~/.emacs.d/.ido.last")
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js2-basic-offset 4)
 '(js2-highlight-level 3)
 '(js2-indent-on-enter-key t)
 '(js2-mode-indent-ignore-first-tab t)
 '(mac-emulate-three-button-mouse 'reverse)
 '(mac-pass-command-to-system t)
 '(ns-alternate-modifier 'control)
 '(ns-command-modifier 'meta)
 '(nxhtml-skip-welcome t)
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages
   '(json-mode flycheck-color-mode-line markdown-mode py-autopep8 autopep8 iedit wgrep persp-projectile perspective ibuffer-vc jedi drag-stuff drga-stuff flycheck blackboard-theme blackboard yaml-mode web-mode virtualenvwrapper use-package undo-tree smex projectile org magit less-css-mode expand-region exec-path-from-shell))
 '(php-basic-offset 8)
 '(php-indent-tabs-mode nil)
 '(php-intelligent-tab nil)
 '(php-mode-force-pear t)
 '(quack-default-program "racket")
 '(quack-fontify-style 'emacs)
 '(quack-smart-open-paren-p nil)
 '(recentf-menu-before "Open Directory...")
 '(recentf-menu-title "Recent Files")
 '(recentf-save-file "~/.emacs.d/.recentf")
 '(safe-local-variable-values
   '((projectile-project-test-cmd . "python manage.py test --settings=project.settings.unittests")
     (project-venv-name . "wagtail-hydra-publisher")
     (project-venv-name . wagtail-hydra-publisher)
     (project-venv-name . "dubs")
     (project-venv-name . "hydra")
     (project-venv-path . "tstr")
     (eval setq default-directory
           (locate-dominating-file buffer-file-name ".dir-locals.el"))
     (project-venv-name . "tstr")
     (project-venv-name . "pilbox-client")
     (project-venv-name . "seo-pages")
     (project-venv-name . "cms")
     (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
")
     (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
")
     (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
     (python-shell-interpreter-args . "/Users/hakjoon/code/python/webtest/manage.py shell")
     (python-shell-interpreter . "python")
     (eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook 'write-contents-functions
                     (lambda nil
                       (delete-trailing-whitespace)
                       nil))
           (require 'whitespace)
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face trailing lines-tail)
     (require-final-newline . t)
     (prompt-to-byte-compile)))
 '(save-place t nil (saveplace))
 '(save-place-file "~/.emacs.d/.emacs-places")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(sql-mysql-program "mysql5")
 '(tool-bar-mode nil)
 '(tramp-persistency-file-name "/Users/hakjoon/.emacs.d/tramp.persist")
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style 'post-forward nil (uniquify))
 '(use-dialog-box nil))
