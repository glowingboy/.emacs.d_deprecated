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

;;company
(require 'cc-mode)
(defun fs-company-c-setup ()
  (setq company-backends (delete 'company-semantic company-backends))
;;  (add-to-list 'company-backends 'company-clang)
  (add-to-list 'company-backends 'company-c-headers)

  )

(add-hook 'c-mode-common-hook 'fs-company-c-setup)

(setq company-clang-executable "clang")

;; using windows INCLUDE environment variable
(setq sys_include_dirs (getenv "INCLUDE"))
(setq lst_sys_include_dirs (split-string sys_include_dirs ";" t))
;;adding my system include dir
(add-to-list 'lst_sys_include_dirs "C:\\Program Files (x86)")
(setq lst_clang_include_dirs (copy-tree lst_sys_include_dirs))

(setq idx 0)
(defconst len (safe-length lst_clang_include_dirs))
(while (< idx len)
  (let ((dir (nth idx lst_clang_include_dirs)))
    (setcar (nthcdr idx lst_clang_include_dirs)
  	    (concat "-I" dir)
  	    )    
    )
  (setq idx (1+ idx)
	)
  )

(setq clang-args lst_clang_include_dirs)
(add-to-list 'clang-args "-std=c++11")
;;
(setq company-clang-arguments clang-args)

;;flycheck
;; (require 'flycheck)
;; (add-hook 'c++-mode-hook 'flycheck-mode)
;; (add-hook 'c-mode-hook 'flycheck-mode)
;; (add-hook 'c++-mode-hook (lambda ()
;; 			   (setq flycheck-clang-args clang-args
;; 				 )))

;;company-c-headers
(require 'company-c-headers)
(setq company-c-headers-path-system lst_sys_include_dirs)

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
;;(require 'fs-rtags)

;;fs-debug
(require 'fs-Debug)
