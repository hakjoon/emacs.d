(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; Move this into project specific config/dir-locals maybe
(setq web-mode-engines-alist
			 '(("django" . "\\.html?\\")))
