(provide 'fs-misc)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-buffer-menu t)

;;color
(set-background-color "black")
(set-foreground-color "white")


;;disable menu bar, tool bar, scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;ace-window
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
