(provide 'fs-c-cpp)

;;open header file with c++ mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;ppindent
(require 'ppindent)

;;gud-gdb
(setq gdb-many-windows t)

;;semantic
;; (require 'cc-mode)
;; (require 'semantic)
;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (semantic-mode 1)
;; (semantic-add-system-include "/usr/include")
;(semantic-add-system-include "/usr/include/w32api")

;;projectile
;(require 'projectile)
;(add-hook 'c-mode-hook 'projectile-mode)
;(add-hook 'c++-mode-hook 'projectile-mode)
;(setq projectile-indexing-method 'native)

;;company
(require 'cc-mode)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)
(setq company-idle-delay 0)
;;(setq company-clang-arguments '("-I/usr/include"))

;;irony
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(defun my-irony-mode-hook()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(setq w32-pipe-read-delay 0)

;;company-irony
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))
; (eval-after-load 'company
;  '(add-to-list 'company-backends 'company-irony))


;;company-irony-c-headers
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

;;flycheck
(require 'flycheck)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda ()
			   (
			    setq flycheck-gcc-language-standard "c++11"
			    )))
;;flycheck-irony
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))


;;company-c-headers
;; (require 'company-c-headers)
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/usr/include")
;(add-to-list 'company-c-headers-path-system "/usr/include/w32api")



;;ggtags
(require 'ggtags)
(add-hook 'c-mode-hook 'ggtags-mode)
(add-hook 'c++-mode-hook 'ggtags-mode)
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)



;;add include path
(defun fs-add-usr-include-path (path)
  "add include path to semantic, company, company-c-headers, flycheck"
  (interactive "Duser-include-path:")
  (add-to-list 'company-c-headers-path-user path)
  (add-to-list 'company-clang-arguments (concat "-I" path))
  (add-to-list 'flycheck-gcc-include-path path)
  )


(defun fs-add-system-include-path (path)
  "add include path to semantic, company, company-c-headers, flycheck"
  (interactive "Duser-include-path:")
  (add-to-list 'company-c-headers-path-system path)
    (add-to-list 'company-clang-arguments (concat "-I" path))
  (add-to-list 'flycheck-gcc-include-path path)
  )


;;fs-project
;(require 'fs-project)
