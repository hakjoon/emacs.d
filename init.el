;; server
(require 'server)
 (when (and (= emacs-major-version 23)
           ;;(= emacs-minor-version 1)
            (equal window-system 'w32))
   (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                  ; ~/.emacs.d/server is unsafe"
                                                  ; on windows.
(server-start)

;; set .emacs.d folder path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq config-dir (expand-file-name 
		  (concat dotfiles-dir "config/")))
(setq my-dir (expand-file-name 
		  (concat dotfiles-dir "my/")))

;; Search subdirectories of dotfiles-dir for .el files
;;(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;    (let* ((default-directory dotfiles-dir))
;;      (setq load-path (cons dotfiles-dir load-path))
;;      (normal-top-level-add-subdirs-to-load-path)))

;; ELPA
;;(require 'package)
;;(package-initialize)
;;(setq package-user-dir (concat dotfiles-dir "elpa"))



(put 'narrow-to-region 'disabled nil)

(put 'upcase-region 'disabled nil)
 
(setq exec-path (append exec-path '("/usr/local/bin")))
(add-to-list 'load-path (expand-file-name (concat dotfiles-dir "el-get/el-get")))
(add-to-list 'load-path config-dir)
(add-to-list 'load-path my-dir)
;; So the idea is that you copy/paste this code into your *scratch* buffer,
;; hit C-j, and you have a working el-get.
(if (require 'el-get nil t)
    (message "el-get is already installed, try M-x el-get-update")
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.rcp"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))


(setq el-get-sources 
      '((:name color-theme
      		       :type git
      		       :url "https://github.com/emacsmirror/color-theme.git"
      		       :load "color-theme.el"
      		       :features "color-theme"
      		       :post-init (lambda ()
      				    (color-theme-initialize)
				    (setq color-theme-is-global t)))
	       (:name color-theme-blackboard
		      :type http
		      :url "https://github.com/hakjoon/emacs-starter-kit/raw/master/elpa-to-submit/blackboard.el"
		      :load "blackboard.el"
		      :after (lambda () (color-theme-blackboard)))
	       (:name ibuffer
		      :type git
		      :url "https://github.com/emacsmirror/ibuffer.git"
		      :features "ibuffer" 
		      :after (lambda () 
			       (setq ibuffer-use-other-window t)
			       (setq ibuffer-shrink-to-minimum-size t)
			       (global-set-key (kbd "C-x C-b") 'ibuffer)))
	       (:name yasnippet
		      :after (lambda ()
			       (require 'yasnippet-cfg)))
	       (:name auto-complete
		      :after (lambda () 
			       (require 'autocomplete-cfg)))
	       (:name autopair
		      :after (lambda ()
			       (add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))
			       (autopair-global-mode)))
	       (:name quack
		      :after (lambda ()
			       (setq quack-global-menu-p nil)
			       (add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))))
		(:name python-mode
		       :type git
		       :url "https://github.com/emacsmirror/python-mode.git"
		       :features (python-mode doctest-mode)
		       :compile nil
		       :post-init (lambda ()
				    (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
				    (add-to-list 'interpreter-mode-alist '("python" . python-mode))
				    (autoload 'python-mode "python-mode" "Python editing mode." t)))
		(:name scss-mode
		       :type git
		       :url "https://github.com/antonj/scss-mode.git"
		       :features "scss-mode"
		       :post-init (lambda ()
				(autoload 'scss-mode "scss-mode")
				(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
				(setq scss-compile-at-save nil)))
		
	       (:name slime-clojure
		      :type git
		      :info "doc"
		      :url "https://github.com/technomancy/slime.git"
		      :load-path ("." "contrib")
		      :compile ("."))
	       (:name smarttabs
		      :type git
		      :url "git://gist.github.com/1095663.git"
		      :features "smarttabs")))

(setq my-packages
      (append
       '(el-get paredit wrap-region clojure-mode nxhtml textile-mode magit) ;slime)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

;; configuration stuff
(require 'master-cfg)
