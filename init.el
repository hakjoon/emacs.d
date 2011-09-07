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

(add-to-list 'el-get-recipe-path (expand-file-name (concat my-dir "recipes")))

(setq el-get-sources 
      '((:name color-theme
      		       :type git
      		       :url "https://github.com/emacsmirror/color-theme.git"
      		       :load "color-theme.el"
      		       :features "color-theme"
      		       :post-init (lambda ()
      				    (color-theme-initialize)
				    (setq color-theme-is-global t)))
	       (:name yasnippet
		      :after (lambda ()
			       (require 'yasnippet-cfg)))
	       (:name auto-complete
		      :after (lambda () 
			       (require 'autocomplete-cfg)))
	       (:name autopair
		      :after (lambda ()
			       (add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))
			       (autopair-global-mode t)))
	       (:name color-theme-blackboard
		      :after (lambda () (color-theme-blackboard)))
	       (:name quack
		      :after (lambda ()
			       (setq quack-global-menu-p nil)
			       (add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))))))

(setq my-packages
      (append
       '(el-get 
	 paredit 
	 wrap-region 
	 clojure-mode 
	 nxhtml 
	 textile-mode 
	 magit 
	 smarttabs 
	 python-mode 
	 ibuffer 
	 flymake-cursor 
	 scss-mode 
	 slime-clojure)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

;; configuration stuff
(require 'master-cfg)
