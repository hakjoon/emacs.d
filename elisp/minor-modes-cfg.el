;; Minor modes config

;;=Recent Files
(recentf-mode t)

;;=ido mode
(ido-mode t)

;;=Desktop mode
(desktop-save-mode nil)

;;=yasnippet settings
(require 'yasnippet-cfg)

;;=Autocomplete settings
(require 'autocomplete-cfg)

;;=textmate style matching
(autoload 'textmate-mode "emacs-textmate" "Match braces like textmate" t)

;;=Mercurial mode
(require 'mercurial)

(provide 'minor-modes-cfg)