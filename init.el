;;load path
(add-to-list 'load-path
	     (substitute-in-file-name "$HOME/.emacs.d/fs"))

;;package
(setq package-list '(smartparens))

(require 'package)
(add-to-list 'package-archives
	     '("popkit" . "https://elpa.popkit.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'packge-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;;smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(smartparens-global-mode t)
(smartparens-mode t)


;;fs-c-cpp
(require 'fs-c-cpp)
