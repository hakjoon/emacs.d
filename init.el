;; server
(require 'server)
 (when (and (>= emacs-major-version 23)
           ;;(= emacs-minor-version 1)
            (equal window-system 'w32))
   (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                  ; ~/.emacs.d/server is unsafe"
                                                  ; on windows.
(server-start)

;; set .emacs.d folder path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(defun add-to-load-path (&rest paths)
  (dolist (path paths)
	(add-to-list 'load-path (expand-file-name 
							 (concat dotfiles-dir path "/")))))

(add-to-load-path "el-get/el-get" "config" "my")

(require 'window-systems)

(if (OSX) 
    (setq exec-path (cons "/usr/local/bin" exec-path)))

(setq
 package-archives
 '(("marmalade" . "http://marmalade-repo.org/packages/")
   ("gnu" . "http://elpa.gnu.org/packages/")
   ("ELPA" . "http://tromey.com/elpa/")))

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path (expand-file-name (concat dotfiles-dir "my/" "recipes")))

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
	(:name drag-stuff
	       :features drag-stuff
	       :after (lambda ()
			(drag-stuff-global-mode t)))
	
	(:name smex
	       :after (lambda ()
			(smex-initialize)
			(global-set-key (kbd "M-x") 'smex)
			(global-set-key (kbd "M-X") 'smex-major-mode-commands)
			;; This is your old M-x.
			(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))
	(:name python
	       :after (lambda ()
			(require 'python-cfg)))
	(:name ropemacs
	       :after (lambda ()
			(require 'ropemacs-cfg)))
	(:name expand-region
		   :type elpa
		   :after (lambda ()
					(global-set-key (kbd "C-=") 'er/expand-region)))
	(:name less-css-mode
		   :type elpa)
 	;; (:name enclose
	;;        :features enclose
	;;        :after (lambda ()
	;; 		(add-to-list 'enclose-except-modes 'sldb-mode)
	;; 		(enclose-global-mode t)))
	;; (:name wrap-region
	;;        :features wrap-region
	;;        :after (lambda ()
	;; 		(wrap-region-global-mode t)))
	;; (:name color-theme-blackboard
	;; 	      :after (lambda () (color-theme-blackboard)))
	
	;; (:name quack
	;; 	      :after (lambda ()
	;; 		       (setq quack-global-menu-p nil)
	;; 		       (add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))))
	;; (:name python-mode
	;; 	   :after (lambda ()
	;; 				(add-hook 'python-mode-hook 
	;; 						  #'(lambda () (setq indent-tabs-mode nil)))))
	;; (:name anything
	;;        :after (lambda () 
	;; 		(require 'anything-match-plugin)
	;; 		(require 'anything-config)
	;; 		(require 'anything-complete)
	;; 		(require 'anything-show-completion)))
	 ))

(setq my-packages
      (append
       '(el-get 
	 paredit 
;;	 wrap-region 
;;	 clojure-mode 
	 ;;nxhtml 
	 textile-mode 
	 ;;magit 
	 smarttabs
	 flymake-info
;;	 ecb
;;	 python
;;	 pony-mode
;;	 ibuffer 
	 flymake-cursor 
	 scss-mode
;;	 python
;;	 slime-clojure
;;	 ipython
;;	 anything-ipython
;;	 color-theme
;;	 color-theme-blackboard
;;	 slime
	 puppet-mode
	 blackboard-theme
	 virtualenv)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

;; configuration stuff
(require 'master-cfg)
