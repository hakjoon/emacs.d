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
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (let (el-get-install-skip-emacswiki-recipes)
	(goto-char (point-max))
	(eval-print-last-sexp))))

(eval-after-load "el-get"
'(progn 
   (add-to-list 'el-get-recipe-path (expand-file-name (concat dotfiles-dir "my/" "recipes")))
   (setq el-get-user-package-directory (concat dotfiles-dir "init-packages"))
   (setq el-get-sources 
	 '((:name yasnippet
		  :after (progn
				   (require 'yasnippet-cfg)))
	   (:name auto-complete
		  :after (progn 
				   (require 'autocomplete-cfg)))
	   (:name autopair
		  :after (progn
				   (add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))
				   (autopair-global-mode t)))
	   (:name drag-stuff
		  :features drag-stuff
		  :after (progn
				   (drag-stuff-global-mode t)))
	   (:name smex
	   		  :after (progn
	   				   (smex-initialize)
	   				   (global-set-key (kbd "M-x") 'smex)
	   				   (global-set-key (kbd "M-X") 'smex-major-mode-commands)
	   				   ;; This is your old M-x.
	   				   (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))
	   (:name python
			  :after (progn
					   (require 'python-cfg)))
	   (:name ropemacs
	   	  :after (progn
	   		   (require 'ropemacs-cfg)))
	   (:name expand-region
			  :type elpa
			  :after (progn
					   (global-set-key (kbd "C-=") 'er/expand-region)))
	   (:name less-css-mode
			  :type elpa)
	   ))

   (setq my-packages
	 (append
	  '(paredit 
	    textile-mode 
	    smarttabs
	    flymake-info
	    flymake-cursor 
	    scss-mode
	    puppet-mode
	    blackboard-theme
		eproject
		helm
	    virtualenv)
	  (mapcar 'el-get-source-name el-get-sources)))

   (el-get 'sync my-packages)))

;; configuration stuff
(require 'master-cfg)
