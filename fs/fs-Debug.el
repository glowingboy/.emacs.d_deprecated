(provide 'fs-Debug)

;;gud-gdb
(setq gdb-many-windows t)

;;recover window layout from gud-gdb
(defconst fs-window-config-register
  "fs-window-layout-register")
(defun fs-set-my-current-windowlayout ()
  "save current windows layout"
  (interactive)
  (window-configuration-to-register fs-window-config-register)
  )
(defun fs-gdb ()
  "save current windows layout and call gdb"
  (interactive)
  (fs-set-my-current-windowlayout)
  (call-interactively 'gdb)
  )


(defun fs-gdb-quit()
  "quit gdb and recover previous windows layout"
  (interactive)
  (gud-basic-call "quit")
    (jump-to-register fs-window-config-register)
  )
(defun fs-gud-mode-key-hook ()
  "chang q to my own quit"
  (local-unset-key (kbd "q"))
  (local-set-key (kbd "q") 'fs-gdb-quit)
  )

(add-hook 'gud-mode-hook 'fs-gud-mode-key-hook)
