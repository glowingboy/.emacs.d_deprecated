(provide 'fs-basic-edit)
;;smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(smartparens-global-mode t)
(smartparens-mode t)

;;company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-clang-executable "/usr/bin/clang-3.8")

;;ido
;(require 'ido)
;(ido-mode t)

;;linum-mode
(global-linum-mode t)
