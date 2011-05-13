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
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(require 'el-get)
(add-to-list 'el-get-recipe-path  (expand-file-name (concat my-dir "recipes")))

(setq el-get-sources 
      '(el-get 
	paredit 
	wrap-region 
	clojure-mode 
	color-theme 
	color-theme-blackboard 
	ibuffer yasnippet 
	auto-complete 
	autopair 
	quack 
	python-mode 
	slime-clojure))
	       

(el-get 'sync)

;; configuration stuff
(require 'master-cfg)
