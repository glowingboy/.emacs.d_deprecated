;; elisp setup

(provide 'fs-elisp)
(add-to-list 'company-backends 'company-elisp)
(defun fs-elisp-setup ()
  "fs elisp setup"
  (setq company-backends (list 'company-elisp))
  )
(add-hook 'emacs-lisp-mode-hook 'fs-elisp-setup)
