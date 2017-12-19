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
  (setq company-backends (list
			  'company-c-headers
			  'company-clang
			  'company-keywords
			  )
			  )
  )

(add-hook 'c-mode-common-hook 'fs-company-c-setup)

(setq company-clang-executable "clang")

(defvar fs-c-cpp-sys-include-dirs (list
				    "/usr/lib/gcc/x86_64-linux-gnu/5/include"
				    "/usr/local/include"
				    "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed"
				    "/usr/include/x86_64-linux-gnu"
				    "/usr/include"
				    "/usr/local"
				    )
  )
(add-hook 'c-mode-common-hook (lambda ()
				"setup ff-search-directories"
				(setq ff-search-directories fs-c-cpp-sys-include-dirs)))

(defvar fs-c-cpp-clang-args(copy-tree fs-c-cpp-sys-include-dirs))
(let (
      (idx 0)
      (lstLen (safe-length fs-c-cpp-clang-args))
      )
  (while (< idx lstLen)
    (let ((dir (nth idx fs-c-cpp-clang-args)))
      (setcar (nthcdr idx fs-c-cpp-clang-args)
	      (concat "-I" dir)
	      )    
      )
    (setq idx (1+ idx)
	  )
    )

  )

(add-to-list 'fs-c-cpp-clang-args "-std=c++11")
;;
(setq company-clang-arguments fs-c-cpp-clang-args)

;;flycheck
(require 'flycheck)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda ()
			   (setq flycheck-clang-args fs-c-cpp-clang-args
				 )))

;;company-c-headers
(require 'company-c-headers)
(setq company-c-headers-path-system fs-c-cpp-sys-include-dirs)

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
