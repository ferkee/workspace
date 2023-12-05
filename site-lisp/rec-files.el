;;; rec-files-mode.el -- list-rec-files function, supporting functions, rec-files-mode

;; Steve Molitor Jul 5 1999

;;; Commentary

;; Maintain list of recently edited files.
;;
;; The function list-rec-files displays the list, using rec-files-mode.
;; The user can then select files to open.
;;
;; A file is added to the list when a buffer is killed, and the buffer
;; is associated with a valid file.  When emacs exits, any open buffers
;; pointing to valid files are added to the list.
;;
;; The rec-files-max variable determines the number of recent files remembered.



;;; Customization variables
(defgroup rec-files nil
  "Display, manipulate list of recently opened files."
  :group 'tools)

(defcustom rec-files-file (expand-file-name "~/.emacs.rec-files")
  "*File to save rec-files list to."
  :type 'string
  :group 'rec-files)

(defcustom rec-files-max 100
  "*Maximum number of recently opened files to remember.

This is also the number of files that will show up in the rec-files
buffer."
  :type 'integer
  :group 'rec-files)

(defcustom rec-files-menu-display 10
  "*Maximum number of recent files to display in a drop-down menu."
  :type 'integer
  :group 'rec-files)

(if (featurep 'xemacs)
    (defcustom rec-files-show-menu t
      "*Show recent files menu?"
      :type 'boolean
      :group 'rec-files))

(defcustom rec-files-tab-size 4
  "*Tab size for rec-files-mode.

This affects the appearance of the rec-files buffer."
  :type 'integer
  :group 'rec-files)


(defcustom rec-files-filters nil
  "*List of regular expressions used to filter file names out of the
recent files list."
  :type 'sexp
  :group 'rec-files)


;;; variables 
(defvar rec-files-hook nil
  "List of functions to call when entering rec-files-mode")

(defvar rec-files-mode-map nil
  "Keymap for rec-files-mode")

(if rec-files-mode-map
    ()
  (setq rec-files-mode-map (make-sparse-keymap))
  (define-key rec-files-mode-map "v" 'rec-files-select-this-window)
  (define-key rec-files-mode-map "\C-m" 'rec-files-select-this-window)
  (define-key rec-files-mode-map "o" 'rec-files-select-other-window)
  (define-key rec-files-mode-map " " 'next-line)
  (define-key rec-files-mode-map "n" 'next-line)
  (define-key rec-files-mode-map "p" 'previous-line)
  (define-key rec-files-mode-map "1" 'rec-files-select-1-window)
  (define-key rec-files-mode-map "?" 'describe-mode))

(defvar rec-files-popup-menu nil
  "Popup menu for rec-files-mode")

(if rec-files-popup-menu
    ()
  (setq rec-files-popup-menu '("Recent Files"
			       [ "Select this window" rec-files-select-this-window ]
			       [ "Select other window" rec-files-select-other-window ]
			       [ "Select one window" rec-files-select-1-window ]
			       "----"
			       [ "Help" describe-mode ])))


(put 'rec-files-mode 'mode-class 'special) 

(defvar rec-files nil
  "list of recently opened files")




;;; global keys 
(global-set-key "\C-cr" 'list-rec-files)



;;; add hooks 
(add-hook 'find-file-hooks 'rec-files-add)
(add-hook 'kill-buffer-hook 'rec-files-add)
(add-hook 'after-init-hook 'rec-files-read)
(add-hook 'kill-emacs-hook 'rec-files-exit)



;;; functions
(defun rec-files-mode ()
  "Major mode for selecting from list of recently opened files.

To see the list of recently opened files and enter rec-files-mode,
enter \"\\[list-rec-files]\".

Under XEmacs you also get a \"Recent Files\" menu itme appears on the
menu bar.

There is a customization group, \"rec-files\" available for tweaking.

To see this help message, run \"rec-files-help\".

Special keys:
\\{rec-files-mode-map}"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'rec-files-mode)
  (setq mode-name "Recent Files")
  (use-local-map rec-files-mode-map)
  (setq truncate-lines t)
  (setq buffer-read-only t)
  (setq mode-popup-menu rec-files-popup-menu)
  (run-hooks 'rec-files-hook))


(defun rec-files-help ()
  (interactive)
  (describe-function 'rec-files-mode))


(defun list-rec-files ()
  "Display list of recently opened files.
Enters rec-files-mode."
  (interactive)

  (split-window-vertically)
  (switch-to-buffer-other-window (get-buffer-create "*Recent Files*"))

  (save-excursion
    (setq buffer-read-only nil)  
    (erase-buffer)

    (let ((longest-len 0))
    
      ;; find longest file name
      (let ((files rec-files))
	 (while files
	   (let ((len (length (file-name-nondirectory (car files)))))
	     (if (> len longest-len)
		 (setq longest-len len)))
	   (setq files (cdr files))))

      (let* ((rec-files-tab-size 8)
	     (path-col (max (+ longest-len rec-files-tab-size)
			    (+ (length "File") rec-files-tab-size)))
	     (spaces (make-string (- path-col (length "File")) ? )))

	 ;; header
	 (insert (concat "File" spaces "Path\n"))
	 (insert (concat "----" spaces "----\n"))

	 ;; files
	 (let ((files rec-files))
	   (while files
	     (let ((file-name (file-name-nondirectory (car files)))
		   (file-name-start (point)))
	       (insert file-name)
	       (put-text-property file-name-start (point) 'mouse-face 'highlight)
	       (insert (make-string (- path-col (length file-name)) ? ))

	       (insert (car files))
	       (insert "\n")

	       (setq files (cdr files)))))))

    (goto-char (point-min))
    (rec-files-mode)))



(defun rec-files-current-file ()
  "Return this line's file"
  (interactive)
  (let (path-col)
    (save-excursion
      (goto-char (point-min))
      (setq path-col (- (search-forward "Path") 5)))
    (search-backward-regexp "^")
    (buffer-substring (+ (point) path-col) (search-forward-regexp "$"))))


(defun rec-files-find-file (file-name)
  "Open file if it exists."
  (cond ((file-exists-p file-name)
	 (find-file file-name))
	(t
	 (error "%s%s%s" "File '" file-name "' no longer exists!"))))
	 

(defun rec-files-select-this-window ()
  "Select this line's file in this window"
  (interactive)
  (rec-files-find-file (rec-files-current-file)))


(defun rec-files-select-other-window ()
  "Select this line's file in other window"
  (interactive)
  (let ((file-name (rec-files-current-file)))
    (cond ((file-exists-p file-name)
	   (find-file-other-window (rec-files-current-file)))
	  (t
	   (error "%s%s%s" "File '" file-name "' no longer exists!")))))


(defun rec-files-select-1-window ()
  "Select this line's buffer, alone, in full frame."
  (interactive)
  (rec-files-find-file (rec-files-current-file))
  (bury-buffer (other-buffer))
  (delete-other-windows))


(defun rec-files-add ()
  "Add current buffer file to recent files list."
  (if (and buffer-file-name
	   (file-exists-p buffer-file-name))
      (progn
	(let ((file-name (file-truename buffer-file-name)))
	  (if (member file-name rec-files)
	      (setq rec-files (delete file-name rec-files)))
	  (if (>= (length rec-files) rec-files-max)
	      (setcdr (nthcdr (- rec-files-max 2) rec-files) nil))
	  (setq rec-files (cons file-name rec-files))))))


(defun rec-files-write ()
  "Write rec-files list to rec-files-file."
  (save-excursion
    (set-buffer (generate-new-buffer "rec-files-temp"))
    (print rec-files (current-buffer))
    (write-file rec-files-file)))

	    
(defun rec-files-read ()
  "Read rec-files list from rec-files-file."
  (save-excursion
    (if (file-readable-p rec-files-file)
	 (progn
	   (set-buffer (generate-new-buffer "rec-files-temp"))
	   (insert-file-contents rec-files-file)
	   (setq rec-files (read (current-buffer)))
	   (kill-buffer (current-buffer))))))


(defun rec-files-exit ()
  "Add open files to rec-files list, save rec-files list to recent files file."
  (let ((buffers (buffer-list )))
    (while buffers
      (save-excursion
	 (set-buffer (car buffers))
	 (rec-files-add))
      (setq buffers (cdr buffers))))
  (save-excursion
    (set-buffer (generate-new-buffer "rec-files-temp"))
    (print rec-files (current-buffer))
    (write-file rec-files-file)
    (kill-buffer (current-buffer))))



;;; menus -- XEmacs only
(if (and (featurep 'xemacs) rec-files-show-menu)
    (progn
      (defun rec-files-menu-filter (items)
	"Add recent files to rec-files-menu."
	(let ((i 0)
	      (files rec-files)
	      menus)
	  (while (and files (< i rec-files-menu-display))
	    (setq menus
		  (append menus (list (vector (car files)
					      (list 'rec-files-find-file
						    (car files)) :active t))))
	    (setq files (cdr files))
	    (setq i (1+ i)))
	  menus))
      (add-submenu nil '("Recent Files"
			 :filter rec-files-menu-filter))))
      
      

;;; provide		 
(provide 'rec-files)

;;; rec-files-mode.el ends here
