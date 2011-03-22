;; server
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
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq el-get-sources 
      '(el-get color-theme paredit python-mode wrap-region clojure-mode ;slime
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
			       (autopair-global-mode)))
	       (:name quack
		      :after (lambda ()
			       (setq quack-global-menu-p nil)
			       (add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))))
	       (:name slime
		      :type git
		      :info "doc"
		      :url "https://github.com/emacsmirror/slime.git"
		      :load-path ("." "contrib")
		      :compile ("."))))

(el-get 'sync)

;; configuration stuff
(require 'master-cfg)
