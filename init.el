;;load path
(add-to-list 'load-path
	     (substitute-in-file-name "$HOME/.emacs.d/fs"))

;;fs-package
(require 'fs-package)

;;fs-misc
(require 'fs-misc)

;;fs-basic-edit
(require 'fs-basic-edit)

;;fs-c-cpp
(require 'fs-c-cpp)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cmake-mode company-c-headers smartparens company-irony))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
