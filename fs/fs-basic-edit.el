(provide 'fs-basic-edit)
;;smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(smartparens-global-mode t)
(smartparens-mode t)

;;auto-complete
(ac-config-default)
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 0.5)
(setq ac-use-fuzzy t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)

;;yasnippet
(require 'yasnippet)
(yas-global-mode t)
(add-to-list 'ac-sources 'ac-source-yasnippet)


;;company
;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-clang-executable "/usr/bin/clang-3.8")

;;ido
;(require 'ido)
;(ido-mode t)

;;linum-mode
(global-linum-mode t)
