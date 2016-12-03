(provide 'fs-project)


(defconst FS-PROJECT-FILE-NAME "fs-proj.el")
(setq fs-proj-file nil)

(defun fs-p-search-file-from-here (proj_file)
  "search file from current buffer file location "
  (interactive "sfile name:")
  (let (dirs (dest-dir nil) (pos 0) (start_pos 0) (dir (file-name-directory buffer-file-name)))
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
      (dolist (dir dirs)
	(message "dir:%s" dir)
	(let ((files (directory-files dir)))
	  (dolist (file files)
	    (message "file:%s" file)
	    (if (string= file proj_file)
		(progn
		  (setq dest-dir (concat dir "/" file))
		  (message "dest-dir:%s" dest-dir)
		  (throw 'dest_file nil)
		  )
	      )
	    )
	  )
	)
      )
    (eval dest-dir)
    )
  )

(defun fs-p-check-proj-file ()
  "check if b-proj-file-found is nil"
  (interactive)
  (if fs-proj-file
      (message "proj file has been found")
    (setq fs-proj-file (fs-p-search-file-from-here FS-PROJECT-FILE-NAME))
    (message "fs-proj-file:%s" fs-proj-file)
    (if fs-proj-file
	(progn
	  (load-file fs-proj-file)
	  (dolist (path fs-proj-usr-include-path)
	    (fs-add-usr-include-path path)
	    )
	  (dolist (path fs-proj-system-include-path)
	    (fs-add-system-include-path path))
	  )
      (message "proj file not found")
      )
    )
  )

(add-hook 'find-file-hook 'fs-p-check-proj-file)


(setq fs-proj-usr-include-path ())
(setq fs-proj-system-include-path ())

(defun fs-p-create-proj-file(path)
  (interactive "Dproject-root:")
  (setq fs-proj-file (concat path "/" FS-PROJECT-FILE-NAME))
  (write-region
   "(setq fs-proj-usr-include-path ())
(setq fs-proj-system-include-path ())
(add-to-list 'fs-proj-usr-include-path
	     \"\")

(add-to-list 'fs-proj-system-include-path
	     \"\")"
nil fs-proj-file nil nil nil t)
    )

(defun fs-p-delete-proj-file ()
  (interactive)
(setq fs-proj-file nil)  
)

(defun fs-p-refresh-proj-file()
  (interactive)
  (setq fs-proj-file nil)
  (fs-p-check-proj-file)
  )
