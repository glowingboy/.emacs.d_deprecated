;;load path
(add-to-list 'load-path
	     (substitute-in-file-name "$HOME/.emacs.d/fs"))

(add-to-list 'load-path
	     (substitute-in-file-name "$HOME/.emacs.d/fs_ThirdParty"))

;;common lisp extension
;;needed by other packages like, ppindent
(require 'cl)

;;fs-package
(require 'fs-package)

;;fs-misc
(require 'fs-misc)

;;fs-basic-edit
(require 'fs-basic-edit)

;;fs-c-cpp
(require 'fs-c-cpp)

;;fs-lua
(require 'fs-lua)

;;fs-python
;;(require 'fs-python)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

