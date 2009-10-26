;; system configuration

;;=Load config files
(require 'window-systems)
(require 'settings-cfg)
(require 'keys-cfg)
(require 'minor-modes-cfg)
(require 'major-modes-cfg)
(require 'macros)
(require 'auto-install-cfg)


;; load specific files for different systems

(if (W32)
    (require 'win32-cfg))

(if (OSX)
    (require 'mac-cfg))

(if (Terminal)
    (require 'terminal-cfg))

(provide 'master-cfg)