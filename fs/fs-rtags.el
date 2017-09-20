(provide 'fs-rtags)

(require 'rtags)
(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)


;; (define-key c-mode-map (kbd "M-.") 'rtags-find-symbol-at-point)
;; (define-key c++-mode-map (kbd "M-.") 'rtags-find-symbol-at-point)
;;(define-key c-mode-map (kbd "M-.") 'rtags-ba)
;;(define-key c++-mode-map (kbd "M-.") 'rtags-find-symbol-at-point)
(rtags-enable-standard-keybindings)

;; (setq rtags-autostart-diagnostics t)
;; (setq rtags-completions-enabled t)
;; (require 'company-rtags)
;; (push 'company-rtags company-backends)

;; (require 'flycheck-rtags)
;; (setq flycheck-highlight-mode nil)

;; (defun fs-flycheck-rtags-setup ()
;;   (flycheck-select-checker 'rtags)
;;   (setq-local flycheck-highlighting-mode nil)
;;   (setq-local flycheck-check-syntax-automatically nil)
;;   (add-hook 'c-mode-common-hook #'fs-flycheck-rtags-setup)
;;   )
