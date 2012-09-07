;; Yasnippet Config

(yas/initialize) 
(setq yas/root-directory (list (concat dotfiles-dir "my/" "snippets") (concat el-get-dir "yasnippet/snippets")))
(mapc 'yas/load-directory yas/root-directory)


(provide 'yasnippet-cfg)
