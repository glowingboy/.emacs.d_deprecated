(provide 'fs-project)


(defun fs-p-search-file-from-here (proj_file)
  "search file from current buffer file location "
  (interactive "sfile name:")
  (let (dirs (start_pos 0) (dir (file-name-directory buffer-file-name)))
    
    (while
	(setq pos (string-match "/" dir start_pos))
      (message "pos:%d:%d" pos start_pos)
      (progn
	(setq start_pos (+ pos 1))
	(if (/= pos 0)
	    (let ((tmp (substring dir 0 pos)))
	      (message "tmp:%s" tmp)
	      (add-to-list 'dirs tmp)
	      )
	  )
	)
      )
    (message "dirs:%s" dirs)
    (catch 'dest_file 
      (dolist (element dirs)
	(message "element:%s" element)
	(let ((files (directory-files element)))
	  (dolist (file files)
	    
	    (message "file:%s" file)
	    (if (string= file proj_file)
		(throw 'dest_file file)
	      )

	    )
	  )
	)
      )
    )
  )
(fs-p-search-file-from-here "GPATH")

(add-hook 'find-file-hook 'fs-p-search-proj-root)
