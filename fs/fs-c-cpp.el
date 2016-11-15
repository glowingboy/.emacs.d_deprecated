(provide 'fs-c-cpp)
;;sematic
(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

;;company
(require 'cc-mode)
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)
(setq company-clang-arguments '("-I/usr/include"))
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
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
;;flycheck
(require 'flycheck)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

;;flycheck-irony
;(eval-after-load 'flycheck
;  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;;company-irony-c-headers
;(require 'company-irony-c-headers)
;(eval-after-load 'company
;  '(add-to-list
;    'company-backends '(company-irony-c-headers company-irony)))

;;company-c-headers
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
