;============================================================
; Various Personal eLisp Functions
;============================================================
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "[([{]") (forward-sexp 1) (backward-char))
		  ((looking-at "[])}]") (forward-char) (backward-sexp 1))
		  (t (self-insert-command (or arg 1)))))

(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)  
  (switch-to-buffer "*ASCII*")  
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))  
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))  
  (beginning-of-buffer))

(defun dos2unix ()  
  (interactive)   
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun unix2dos ()
  (interactive)    
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

; Make all "yes or no" prompts show "y or n" instead
; (fset 'yes-or-no-p 'y-or-n-p)


;; make backup files in ~/.backups/ rather than scattered around all
;; over the filesystem.
(defun make-backup-file-name (file-name)
  "Create the non-numeric backup file name for `file-name'."
  (require 'dired)
  (if (file-exists-p "~/.backups")
      (concat (expand-file-name "~/.backups/")
	      (dired-replace-in-string "/" "|" file-name))
    (concat file-name "~")))

;; disable backups for files in /tmp or in my Mail or News directories.     
(defun ecm-backup-enable-predicate (filename)      
  (and (not (string= "/tmp/" (substring filename 0 5)))           
       (not (string-match "/Mail/" filename))           
       (not (string-match "/News/" filename))))

(setq backup-enable-predicate 'ecm-backup-enable-predicate)

; This doesn't seem to work:
(setq auto-save-directory (expand-file-name "~/.autosaves/"))


(defun toggle-hide-ifdef-mode ()
  (interactive)
  (if (not hide-ifdef-mode)
      (hide-ifdef-mode t)
    (hide-ifdef-mode nil)
    )
  )

(defun toggle-ifdef-hiding ()
  (interactive)
  (if hide-ifdef-hiding
      (show-ifdefs)
    (hide-ifdefs))
  )

;; 
(defun insert-sql-date ()
  (interactive)
  (insert (format-time-string "uniqid > TO_DATE('%m/%d/%Y 01:00', 'MM/DD/YYYY HH24:MI')" (current-time))))


(defun insert-sql-date2 ()
  (interactive)
  (insert (format-time-string "uniqid < TO_DATE('%m/%d/%Y %H:00', 'MM/DD/YYYY HH24:MI')" (current-time))))

(defun insert-sql-date-today ()
  (interactive)
  (insert (format-time-string "uniqid > TRUNC(sysdate, 'DAY')")))

(defun insert-timestamp ()
  (interactive)
  (insert (format-time-string "%m/%d/%Y %H:%M" (current-time))))


(defvar ff-always-in-other-window 1)
(defvar  ff-always-in-other-window )
(setq  ff-always-in-other-window t)

(defun join-region (beg end)
  "Apply join-line over region."
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
	    (end (copy-marker (region-end))))
	(goto-char beg)
	(while (< (point) end)
	  (join-line 1)))))


 (defun uniquify-all-lines-region (start end)
    "Find duplicate lines in region START to END keeping first occurrence."
    (interactive "*r")
    (save-excursion
      (let ((end (copy-marker end)))
        (while
            (progn
              (goto-char start)
              (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
          (replace-match "\\1\n\\2")))))
  
  (defun uniquify-all-lines-buffer ()
    "Delete duplicate lines in buffer and keep first occurrence."
    (interactive "*")
    (uniquify-all-lines-region (point-min) (point-max)))