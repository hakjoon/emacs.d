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

(require 'window-systems)

(if (OSX) 
    (setq exec-path (cons "/usr/local/bin" exec-path)))

(setq
 package-archives
 '(("marmalade" . "http://marmalade-repo.org/packages/")
   ("gnu" . "http://elpa.gnu.org/packages/")
   ("ELPA" . "http://tromey.com/elpa/")))

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
      '((:name yasnippet
	       :after (lambda ()
			(require 'yasnippet-cfg)))
	(:name auto-complete
	       :after (lambda () 
			(require 'autocomplete-cfg)))
	(:name autopair
	       :after (lambda ()
			(add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))
			(autopair-global-mode t)))
	(:name smex
	       :after (lambda ()
			(smex-initialize)
			(global-set-key (kbd "M-x") 'smex)
			(global-set-key (kbd "M-X") 'smex-major-mode-commands)
			;; This is your old M-x.
			(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))
	(:name ropemacs
	       :after (lambda ()
			(require 'ropemacs-cfg)))
	(:name python
	       :after (lambda ()
			(require 'python-cfg)))
	;; (:name color-theme-blackboard
	;; 	      :after (lambda () (color-theme-blackboard)))
	
	;; (:name quack
	;; 	      :after (lambda ()
	;; 		       (setq quack-global-menu-p nil)
	;; 		       (add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))))
	(:name anything
	       :after (lambda () 
			(require 'anything-match-plugin)
			(require 'anything-config)
			(require 'anything-complete)
			(require 'anything-show-completion)))
	))

(setq my-packages
      (append
       '(el-get 
	 paredit 
	 wrap-region 
	 clojure-mode 
	 ;;nxhtml 
	 textile-mode 
	 ;;magit 
	 smarttabs
;;	 python
;;	 pony-mode
;;	 ibuffer 
	 flymake-cursor 
	 scss-mode
;;	 python
;;	 slime-clojure
;;	 ipython
;;	 anything-ipython
	 color-theme
	 color-theme-blackboard
;;	 slime
	 virtualenv)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

;; configuration stuff
(require 'master-cfg)
