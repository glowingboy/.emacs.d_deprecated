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
(setq company-backends (delete 'company-clang company-backends))
(setq company-idle-delay 0.1)



;;ido
					;(require 'ido)
					;(ido-mode t)

;;linum-mode
(global-linum-mode t)

;;highlight-changes-mode
(global-highlight-changes-mode t)
(require 'hilit-chg)
;;create a new face 
(make-empty-face 'highlight-changes-saved-face)
;;add into highlight-changes-face-list for rotate
(setq highlight-changes-face-list '(highlight-changes-saved-face))
;;when buffer saved then rotate face to the empty face
(add-hook 'local-write-file-hooks 'highlight-changes-rotate-faces)
(add-hook 'after-save-hook
	  (lambda ()
	    (highlight-changes-remove-highlight (point-min) (point-max))))


