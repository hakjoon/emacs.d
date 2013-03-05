;; Yasnippet Config

(setq yas-snippet-dirs (list (concat dotfiles-dir "my/" "snippets") (concat el-get-dir "yasnippet/snippets")))
(yas-global-mode 1)
(add-hook 'term-mode-hook #'(lambda () (yas-minor-mode -1)))

(provide 'yasnippet-cfg)
