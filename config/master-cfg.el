;; system configuration

;;=Load config files
(require 'settings-cfg)
(require 'keys-cfg)
(require 'minor-modes-cfg)
(require 'major-modes-cfg)
(require 'defuns)


;; load specific files for different systems

(if (W32)
    (require 'win32-cfg))

(if (OSX)
    (require 'mac-cfg))

(if (Terminal)
    (require 'terminal-cfg))

(if (X)
	(require 'x-cfg))

(add-hook 'text-mode-hook 'remove-dos-eol)

(provide 'master-cfg)
