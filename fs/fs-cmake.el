;; fs cmake
(provide 'fs-cmake)
(add-hook 'cmake-mode-hook (lambda ()
			     (message "hello fs cmake")
			     (setq company-backends (list 'company-cmake))
			     ))

