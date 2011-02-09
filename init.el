;; server
(server-start)

;; set .emacs.d folder path
;;(setq dotfiles-dir (file-name-directory
;;                    (or (buffer-file-name) load-file-name)))

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
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/el-get/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/config/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/my/"))
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
      '(el-get color-theme paredit auto-complete yasnippet
	       (:name color-theme-blackboard
		      :type http
		      :url "http://github.com/technomancy/emacs-starter-kit/raw/master/elpa-to-submit/blackboard.el"
		      :load "blackboard.el"
		      :after (lambda () (color-theme-blackboard)))
	       (:name ibuffer
		      :type git
		      :url "https://github.com/emacsmirror/ibuffer.git"
		      :after (lambda () (global-set-key (kbd "C-x C-b") 'ibuffer-other-window)))))

(el-get 'sync)

;; configuration stuff
(require 'master-cfg)
