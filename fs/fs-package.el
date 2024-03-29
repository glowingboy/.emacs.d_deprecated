(provide 'fs-package)
(require 'package)
;;(setq package-archives)
(add-to-list 'package-archives
	     '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
(when (< emacs-major-version 24)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.emacs-china.org/gnu/")))
(package-initialize t)
(defun touch-package(packages)
  (mapcar
   (lambda (package)
     (unless (package-installed-p package)
       (message (format "install %s" package))
       (package-install package)
       )
     )
   packages))

(unless package-archive-contents
  (package-refresh-contents))

(touch-package '(dash
		 smartparens
		 ace-window
;;		 ggtags
		 ;;		 helm
;;		 yasnippet
		 company
;;		 rtags
;;		 company-rtags
;;		 irony
;;		 company-irony
		 flycheck
;;		 flycheck-irony
;;		 flycheck-rtags
		 company-c-headers
;;		 company-irony-c-headers
		 cmake-mode
;;		 ggtags
		 lua-mode
		 company-lua
		 glsl-mode
;;		 android-mode
		 ;;		 csharp-mode
;;		 elpy
		 ))
	 

(package-initialize)
