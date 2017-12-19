;; global keybinding
(provide 'fs-global-keybinding)

(defun fs-tab ()
  "smart tab key"
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
	(hippie-expand nil))
    (if mark-active
	(indent-region (region-beginning)
		       (region-end))
      (if (looking-back ".+")
	  (company-complete)
	  (if (string-match-p "cc.*" (format "%s" major-mode))
	      (c-indent-line-or-region)
	    	(indent-for-tab-command)
		)
	)
      )
    )
  )

(global-set-key (kbd "TAB") 'fs-tab)
(local-unset-key (kbd "TAB"))
