(provide 'fs-c-cpp)

(setq c-default-style "linux"
      c-basic-offset 4
      )

;;open header file with c++ mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;ppindent
(require 'ppindent)

;;key map setup
(defun fs-cc-mode-key-map-config ()
  (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
  )
(add-hook 'c-mode-hook 'fs-cc-mode-key-map-config)
(add-hook 'c++-mode-hook 'fs-cc-mode-key-map-config)


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
(defun fs-company-c-setup ()
(setq company-backends (delete 'company-semantic company-backends))

)
(add-hook 'c-mode-common-hook 'fs-company-c-setup)
(delete 'company-semantic company-backends)
;;(define-key c-mode-map [(tab)] 'company-complete)
;;(define-key c++-mode-map [(tab)] 'company-complete)
;;(setq company-idle-delay 0)
;;(setq company-clang-executable "/usr/bin/clang-3.8")
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


;;company-irony
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;;(setq company-backends (delete 'company-semantic company-backends))
(eval-after-load 'company
 '(add-to-list 'company-backends 'company-irony))

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
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/lib/gcc/x86_64-linux-gnu/5/include")
(add-to-list 'company-c-headers-path-system "/usr/local/include")
(add-to-list 'company-c-headers-path-system "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed")
(add-to-list 'company-c-headers-path-system "/usr/include/x86_64-linux-gnu")
(add-to-list 'company-c-headers-path-system "/usr/include")
(add-to-list 'company-c-headers-path-system "/usr/include/c++/5")
(add-to-list 'company-c-headers-path-system "/usr/local")
 
;;ggtags
;; (require 'ggtags)
;; (add-hook 'c-mode-hook 'ggtags-mode)
;; (add-hook 'c++-mode-hook 'ggtags-mode)
;; (define-key ggtags-mode-map (kbd "C-c g d") 'ggtags-find-definition)
;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

;; (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)



;;add include path
;; (defun fs-add-usr-include-path (path)
;;   "add include path to semantic, company, company-c-headers, flycheck"
;;   (interactive "Duser-include-path:")
;;   (add-to-list 'company-c-headers-path-user path)
;; ;;  (add-to-list 'company-clang-arguments (concat "-I" path))
;; ;;  (add-to-list 'flycheck-gcc-include-path path)
;;   )


;; (defun fs-add-system-include-path (path)
;;   "add include path to semantic, company, company-c-headers, flycheck"
;;   (interactive "Duser-include-path:")
;;   (add-to-list 'company-c-headers-path-system path)
;;   ;;  (add-to-list 'company-clang-arguments (concat "-I" path))
;; ;;  (add-to-list 'flycheck-gcc-include-path path)
;;   )

;;fs-project
(require 'fs-project)

;;rtags
(require 'fs-rtags)

;;fs-debug
(require 'fs-Debug)
