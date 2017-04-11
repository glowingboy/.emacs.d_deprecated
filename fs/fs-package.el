(provide 'fs-package)
(require 'package)
(add-to-list 'package-archives
	     '("popkit" . "https://elpa.popkit.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'packge-archives '("gnu" . "http://elpa.gnu.org/packages/")))
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
		 rtags
		 company
;		 irony
;		 company-irony
		 flycheck
;		 flycheck-irony
		 company-c-headers
;		 company-irony-c-headers
		 cmake-mode
;;		 ggtags
		 lua-mode
		 company-lua
		 glsl-mode
		 android-mode
		 csharp-mode
		 ))
	 

(package-initialize)
