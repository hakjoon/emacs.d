(defun setup-ropemacs ()
  (interactive)
  "Setup the ropemacs harness"

  (pymacs-load "ropemacs" "rope-")
  
  ;; Stops from erroring if there's a syntax err
  (setq ropemacs-codeassist-maxfixes 7)
  
  ;; Configurations
  (setq ropemacs-guess-project t)
  (setq ropemacs-enable-autoimport t)
  
  
  (setq ropemacs-autoimport-modules '("os" "shutil" "sys" "logging"
				      "django.*" "fabric.*"))

(defun reload-ropemacs ()
  (interactive)
  (pymacs-terminate-services)
  (setq pymacs-auto-restart t)
  (setup-ropemacs)
  (setq pymacs-auto-restart 'ask))
  
  
  
  ;; Adding hook to automatically open a rope project if there is one
  ;; in the current or in the upper level directory
  (add-hook 'python-mode-hook
            (lambda ()
              (cond ((file-exists-p ".ropeproject")
                     (rope-open-project default-directory))
                    ((file-exists-p "../.ropeproject")
                     (rope-open-project (concat default-directory "..")))))))



(eval-after-load 'python
  '(progn
     (setup-ropemacs)
     ))


(provide 'ropemacs-cfg)
