;;; Copyright (c) 1991 Wayne Mesard.  May be redistributed only under the
;;; terms of the GNU Emacs General Public License.

;;; 
;;; Dynamic MACRO
;;; 

;;; COMMANDS
;;    insert-dmacro		Control-c d
;;    dmacro-wrap-line		Control-c l
;;    dmacro-wrap-region	Control-c r
;;    dmacro-fill-in-blanks	Control-c f
;;; PUBLIC VARIABLES
;;    dont-bind-my-keys
;;    auto-dmacro-alist
;;    dmacro-prefix-char
;;    dmacro-month-names
;;    dmacro-rank-in-initials
;;    dmacro-prompt
;;    dmacro-on-abbrev
;;; PUBLIC FUNCTIONS
;;    add-dmacros
;;    define-dmacro
;;    define-dmacro-table
;;    dmacro-command
;;    def-dmacro-function
;;    def-dmacro-alias
;;    dmacro-expand
;;    dmacro-indent

;;; HISTORY
;;    p01 wmesard - Nov 12, 1991: Added decl for dont-bind-my-keys
;;				  made :sexp work!
;;    2.0 wmesard - Oct 31, 1991: Too many changes to list.
;;    1.5 wmesard - Apr 11, 1991.

;;; AUTHOR
;;    Wayne Mesard, WMesard@Oracle.com

;;; 
;;; KEY BINDINGS
;;; 

(defvar dont-bind-my-keys)
(if (not (and (boundp 'dont-bind-my-keys) dont-bind-my-keys))
    (progn
      (global-set-key "\C-cd" 'insert-dmacro)
      (global-set-key "\C-cl" 'dmacro-wrap-line)
      (global-set-key "\C-cr" 'dmacro-wrap-region)
      (global-set-key "\C-cf" 'dmacro-fill-in-blanks)
      ))

;;; 
;;; RELATED COMMANDS
;;; 

(autoload 'build-dmacro "dmacro-bld" 
	  "Interactively build a new dmacro." t nil)
(autoload 'write-dmacro-file "dmacro-bld" 
	  "Save all dmacros and abbrevs to FILE." t nil)

;;; 
;;; USER PARAMETERS
;;; 

(defvar auto-dmacro-alist nil
  "*An alist of filename patterns and corresponding dmacro names.  Each
element looks like (REGEXP . DMACRO-SYMBOL) just like auto-mode-alist.
Visiting a new file whose name matches REGEXP causes the dmacro to be
inserted into the buffer.
  This facility is a functional super-duper-set of autoinsert.el.")


(defvar dmacro-prefix-char "~"
  "*The character searched for by dmacro-expand-region when looking for
text to modify.  The value of this variable must be a string containting
a single character.")


(defconst dmacro-month-names 
  '("January" "February" "March" "April" "May" "June" "July" "August" 
    "September" "October" "November" "December")
  "*Used by the macro ~(month). Change these to suit your language or tastes.")


(defvar dmacro-rank-in-initials nil
  "*If non-nil the ~(user-initials) macro will include (Jr, Sr, II, etc...)
when such a rank is present in the user's name.")


(defvar dmacro-prompt t
  "*When this variable is t, Dmacro prompts the user in the minibuffer
when expanding interactive dmacros (i.e. dmacros containing the
~(prompt) function.  If this variable is nil, it won't do anything
with the blanks until the user types the to-be-substituted text in the
buffer and invokes \\[dmacro-fill-in-blanks].
  If this variable is not t and not nil, Dmacro will grab the words
immediately preceding point.  So if you forget to type them before
invoking the dmacro, it will blindly use whatever it finds in the
buffer.")


(defvar dmacro-on-abbrev nil
  "*Dmacro is an overgrown hack built on top of Emacs' Abbrev Mode.
Some people like to use both abbrevs and dmacros at the same time, but
don't want their dmacros auto-expanded.  If DMACRO-ON-ABBREV is nil,
dmacros will only be expanded if they were accessed through one of the
Dmacro commands: \\[insert-dmacro], \\[dmacro-wrap-line] or \\[dmacro-wrap-region].")


;;; 
;;; PRIVATE VARIABLES
;;; 

;; Used by dmacro-minibuffer-read to detect when user has asked for 
;; completion twice in a row.  When this happens it displays the documentation
;; or expansion for each dmacro name.
(defvar dmacro-verbose-list)

;; Used by dmacro-minibuffer-read to hold the value of local-abbrev-table.
;; This is because local-abbrev-table itself gets changed when the minibuffer
;; becomes active.
(defvar dmacro-table)

;; Used by the "~(point)" function (and company) to keep track of where the
;; cursor should be left when expansion is complete.
(defvar dmacro-point nil)

;; Used by the "~(mark)" function (and company).
(defvar dmacro-marks nil)

;; Used to flag the fact that we are, in fact, expanding a dmacro,
;; as opposed to expanding an abbrev.  We need to know the difference
;; when DMACRO-ON-ABBREV is nil.
(defvar dmacro-expanding nil)

;; Used during dmacro expansion.  Holds the name of the last prompt used
;; so that dmacro builders can just say ~(prompt) instead of ~(prompt foo)
;; if they mean "the same one as last time".
(defvar dmacro-last-prompt)

;; Used during dmacro expansion.  Holds the value returned by
;; (current-time-string) so that a single dmacro only has to call this 
;; function once.  See the function by the same name for details.
(defvar dmacro-ts)

;; Used during dmacro expansion.  Holds the value returned by
;; (buffer-file-name)so that a single dmacro only has to call this 
;; function once.  See the function by the same name for details.
(defvar dmacro-fn)

;; Used by dmacro-wrap-region to pass the to-be-wrapped text in to 
;; dmacro-expand-region.  It needs to be inserted in dmacro-expand-region
;; (as opposed to after we get back to dmacro-wrap-region) because it must 
;; happen before any indenting (so it can get indented too).
(defvar dmacro-extra nil)

;; Used by dmacro-wrap-region to indicate to dmacro-expand-region
;; that the extra text should be inserted at a mark instead of point.
;; See dmacro-wrap-region for details.
(defvar dmacro-goto-mark nil)

;; The plist of this symbol holds the prompt info during expansion.
;; See dmacro-save-string for format of the plist.
(defvar dmacro-strings nil)


;; If non-nil, means we're in a recursive expansion (i.e. a ~(dmacro)
;; command).  This means (among other things) don't process dmacro-strings
;; or dmacro-marks when expansion is done.
(defvar dmacro-recurse nil)

;; A hack to get around a bug in c-indent-command wherein marks near the
;; beginning of a line don't get positioned correctly.  See the comments in
;; dmacro-indent for more details.
(defvar dmacro-fix-marks nil)
(defvar dmacro-fix-marks-on nil)

;; An alist of the documentation strings.
(defvar dmacro-doclist nil)

;; The list of all dmacro-functions.  dmacro-parse looks up things in here.
;; def-dmacro-alias and def-dmacro-function add things to here.
(defvar dmacro-functions
  (list 
   '(@      :alias point)
   '(year   :alias (chron) 20)
   '(mon    :alias (chron) 4 7)
   '(date   :alias (chron) 8 10)
   '(day    :alias (chron) 0 3)
   '(hour24 :alias (chron) 11 13)
   '(min    :alias (chron) 14 16)
   '(sec    :alias (chron) 17 19)
   (cons '~
	 (function (lambda () dmacro-prefix-char)))
   (cons 'prompt
	 (function (lambda (mods &optional itemname &rest args)
		     ;; if no itemname specified, default to previous one.
		     ;; if there wasn't a previous one, use the word "prompt".
		     (if (null itemname)
			 (setq itemname dmacro-last-prompt)
		       (setq dmacro-last-prompt itemname))
		     (dmacro-save-string t mods itemname args)
		     (concat "<" (symbol-name itemname) ">"))
		   ))

   (cons 'if
	 (function (lambda (mods expr then &optional else)
		     (if (eq 'prompt (car expr))
			 (progn
			   (dmacro-save-string 
			    nil (list then else mods)
			    (or
			     (car (cdr expr)) dmacro-last-prompt)
			    (cdr (cdr expr)))
			   nil)
		       (if (dmacro-funcall expr)
			   (dmacro-funcall then)
			 (dmacro-funcall else))
		       ))
		   ))
   (cons 'dmacro
	 (function (lambda (tem &optional pointP) 
		     (let ((dmacro-recurse (or pointP 'protect-point)))
		       (insert-dmacro (symbol-name tem))
		       )
		     nil)
		   ))

   '(chron . dmacro-ts)
   (cons 'month-num
	 (function (lambda () (format "%2d" (dmacro-month-num)))))
   (cons 'month
	 (function (lambda () 
		     (nth (1- (dmacro-month-num)) dmacro-month-names))))
   (cons 'hour
	 (function (lambda ()
		     (let* ((r (string-to-int (substring (dmacro-ts) 11 13)))
			    (h (if (zerop (% r 12)) 12 (% r 12))))
		       (format "%2d" h)))))
   (cons 'ampm
	 (function (lambda ()
		     (if (<= 12 (string-to-int (substring (dmacro-ts) 11 13)))
			 "pm"
		       "am"))))

   '(file-long . dmacro-fn)
   (cons 'file
	 (function (lambda () (file-name-nondirectory (dmacro-fn)))))
   (cons 'file-dir
	 (function (lambda () (file-name-directory (dmacro-fn)))))
   (cons 'file-name
	 (function (lambda ()
		     (let ((fn (file-name-nondirectory (dmacro-fn))))
		       (substring fn 0 (string-match "\\.[^.]*$" fn))
		       ))
		   ))
   (cons 'file-ext
	 (function (lambda ()
		     (let* ((fn (file-name-nondirectory (dmacro-fn)))
			    (i (string-match "\\.[^.]*$" fn)))
		       (if i
			   (substring fn (1+ i))
			 )))))
   (cons 'insert-file
	 (function (lambda (x)
		     (condition-case data
			 (save-excursion
			   (set-buffer (get-buffer-create " dmacro-temp"))
			   (erase-buffer)
			   (insert-file x)
			   (setq x (buffer-substring (point-min) (point-max)))
			   (erase-buffer))
		       (error
			(if (eq 'file-error (car data))
			    (message "Warning: couldn't read file: %s" x)
			  (signal 'error data))
			(setq x nil)
			))
		     x)))
   '(user-id . user-login-name)
   '(user-name . user-full-name)
   '(user-initials . dmacro-initials)
   (cons 'point
	 (function (lambda () 
		     (if (not (eq dmacro-recurse 'protect-point))
			 (setq dmacro-point (point))
		       (dmacro-push-mark))
		     nil)))
   '(mark . dmacro-push-mark)
   (cons 'shell
	 (function (lambda (cmd)
		     (save-excursion
		       (set-buffer (get-buffer-create " dmacro-temp"))
		       (erase-buffer)
		       (shell-command cmd t)
		       (setq cmd 
			     (buffer-substring (point-min) (point-max)))
		       )
		     cmd)))
   (cons 'eval
	 (function (lambda (form)
		     (let ((res (eval form)))
		       (if (or (null res) (stringp res))
			   res
			 (prin1-to-string res))
		       ))
		   ))
   ))


;;; 
;;; COMMANDS
;;; 

(defun insert-dmacro (name)
  "Insert the dmacro NAME.  It prompts for NAME.
When called from Lisp programs, NAME is a string; if NAME is not a valid
dmacro in the current buffer, then NAME itself is inserted."
  (interactive (list (dmacro-minibuffer-read nil t)))
  (let ((executing-macro t)
	(dmacro-expanding t))
    (abbrev-prefix-mark)
    (insert name)
    (expand-abbrev)
    ))

(defun dmacro-wrap-region (dmacro marker beg end)
  "Put the text between point and mark at the point location in DMACRO.
E.g., if the selected text is \"abc\" and the dmacro expands to \"{ <p> }\",
where <p> is the location of the cursor, the result would be \"{ abc }\".
With a prefix argument, put the text at a marker location instead of point.
The marker used is the number of the marker indicated by the prefix argument.
If there aren't that many markers in the dmacro, the first one is used."
  (interactive (list (dmacro-minibuffer-read nil t)
		     current-prefix-arg
		     (region-beginning) (region-end) 
		     ))
  (let ((dmacro-extra (buffer-substring beg end))
	(dmacro-goto-mark marker))
    (delete-region beg end)
    (insert-dmacro dmacro)
    ))

(defun dmacro-wrap-line (dmacro marker)
 "Put the text on the current line at the point location in DMACRO.
E.g., if the line contains \"abc\" and the dmacro expands to \"{ <p> }\",
(where <p> is the location of the cursor), the result would be \"{ abc }\".
With a prefix argument, put the text at a marker location instead of point.
The marker used is the number of the marker indicated by the prefix argument.
If there aren't that many markers in the dmacro, the first one is used."
  (interactive (list (dmacro-minibuffer-read nil t)
		     current-prefix-arg))
  (let* ((end (save-excursion (end-of-line) (point)))
	 (loc (- end (point))))
    (dmacro-wrap-region dmacro 
			  marker
			  (save-excursion (forward-to-indentation 0) (point))
			  end)
    (goto-char (- (point) loc))
    ))

(defun dmacro-fill-in-blanks ()
  "When DMACRO-PROMPT is nil, users invoke this function after inserting a
dmacro.  It then backward deletes the appropriate number of sexps from 
the buffer and fills in the blanks in the dmacro."
  (interactive)
  (if (null (symbol-plist 'dmacro-strings))
      (error "No blanks to fill in from the last dmacro."))
  (let ((last-buff (marker-buffer 
		    (car (car (car (cdr (symbol-plist 'dmacro-strings))))))))
    (if (not (eq last-buff (current-buffer)))
	(error "Error: Last dmacro expansion was in %s." 
	       (buffer-name last-buff))))
  (dmacro-process-strings (dmacro-get-words (point))))


;;; 
;;; PUBLIC FUNCTIONS
;;; 

;; Example of use:
;;  (add-dmacros 'c-mode-abbrev-table
;;    '(("def" "#define ")
;;      ("day" "today is ~day" dmacro-expand "the day of the week")
;;      ))

(defun add-dmacros (tabname definitions)
  "Just like define-abbrev-table, except: existing abbrevs are not destroyed
and if HOOK (see below) is unspecifed, \"dmacro-expand\" is assumed.
  TABNAME is a symbol, DEFINITIONS is a list of elements of the form (NAME 
TEXT &optional EXPANSION-QUALIFIER DOCUMENTATION).  Valid values for EXPANSION-
QUALIFIER are: nil, expand and indent."
  (mapcar (function (lambda (d)
		      (define-dmacro 
			(symbol-value tabname)
			(nth 0 d)
			(nth 1 d)
			(nth 2 d)
			(nth 3 d))
		      ))
	  definitions)
  ;; No need for this to return a big ugly list.
  nil)


(defun define-dmacro (table name text expansion-qualifier doc)
  "Define a single dmacro.  Takes 5 args.  TABLE is the
abbrev-table to define it in.  NAME is a string, the name of the
dmacro.  TEXT is the actual dmacro text string. EXPANSION-QUALIFIER
is the hook to run on the text (valid values are dmacro-expand,
dmacro-indent or nil (which is the same as dmacro-expand)).  DOC,
if non-nil, is a string describing the dmacro."
  ;; protect the global value of abbrevs-changed from getting modified.
  (let* ((abbrevs-changed nil)
	 ;; define the abbrev
	 (sym (abbrev-symbol (define-abbrev table name text
			       (if (eq expansion-qualifier 'indent)
				   'dmacro-indent
				 (if (or (not expansion-qualifier)
					 (eq expansion-qualifier 'expand))
				     'dmacro-expand
				   expansion-qualifier)))
			     table))
	 ;; check for an existing doc string.
	 (doccons (assq sym dmacro-doclist)))
    ;; store the doc string in the alist.
    (if doccons
	(setcdr doccons doc)
      ;; write-dmacro-file needs this done even if doc is nil.
      (setq dmacro-doclist (cons (cons sym doc) dmacro-doclist)
	))
    ))


(defun define-dmacro-table (tabname definitions)
  "Just like add-dmacros, but it makes sure the table is empty first.
We recommend that you use add-dmacros so that you can define dmacros in
multiple files and not worry about one trashing the other."
  ;; protect the global value of abbrevs-changed from getting modified.
  (let ((abbrevs-changed nil))
    (clear-abbrev-table (symbol-value tabname))
    (add-dmacros tabname definitions)
    ))


(defun dmacro-command (TEM1 &optional TEM2 FUNCNAME)
  "In true Lisp fashion, this is a function building function.
It generates a function that inserts and expands a dmacro, TEM1.  If optional 
second arg TEM2 is specified, then the generated function will also insert and
expand TEM2 when preceded by \\[universal-argument].  If optional third arg FUNCNAME, a symbol,
is specified, then a real live function is generated suitable for use with
\\[describe-function], \\[execute-extended-command], etc.

DMACRO-COMMAND is intended to bind dmacros to keys.  E.g.:
 (global-set-key \"\\C-ct\" 
                 (dmacro-command \"dstamp\" \"dtstamp\" 'insert-timestamp)))
 (define-key c-mode-map \"\\C-cf\" (dmacro-command \"fordown\" \"forup\"))"
  (let* ((docdef 
	  (if FUNCNAME
	      (apply 
	       (function concat)
	       "Insert and expand the dmacro named \"" TEM1 "\"."
	       (if TEM2
		   (list "\nWith a prefix arg, use \"" TEM2 "\" instead.")))
	    ))
	 (fundef 
	  (if TEM2
	      (list 'lambda '(arg) docdef '(interactive "P")
		    (list 'insert-dmacro
			  (list 'if 'arg TEM2 TEM1)))
	    (list 'lambda () docdef '(interactive)
		  (list 'insert-dmacro TEM1)
		  ))
	  ))
    (if FUNCNAME
	(progn
	  (fset FUNCNAME fundef)
	  FUNCNAME)
      fundef)))

;; For compatibility with v1.5.  This will go away someday. -wsm9/3/91.
(fset 'dmacro-function (symbol-function 'dmacro-command))


(defmacro def-dmacro-function (name &rest body)
  (list 'setq 'dmacro-functions
	(list 'cons
	      (list 'cons (list 'quote name)
		    (if (= 1 (length body))
			(list 'quote (car body))
		      (list 'function (cons 'lambda body))
		      ))
	      'dmacro-functions)
	))

(defmacro def-dmacro-alias (&rest args)
  (list 'setq 'dmacro-functions
	(list 'append
	      (let ((new nil))
		(while args
		  (setq new (cons 
			     (cons (car args) (cons ':alias (car (cdr args))))
			     new)
			args (cdr (cdr args))))
		(list 'quote new))
	      'dmacro-functions)
	))

;;
;; Abbrev hooks
;;

;; These are semi-public functions.  The user doesn't invoke them directly.
;; They are used as the hook in the dmacro definition.

(defun dmacro-expand ()
  "Passed in as the HOOK argument to define-dmacro.
Causes the dmacro to be expanded."
  (if (or dmacro-on-abbrev dmacro-expanding)
      (progn
	(dmacro-expand-region last-abbrev-location (point))
	(dmacro-fix-marks-hack))
    (unexpand-abbrev)
    ))

(defun dmacro-indent ()
  "Passed in as the HOOK argument to define-dmacro.
Causes the dmacro to be expanded and then each line of the expanded
text to be indented in a way appropriate to the buffer's major mode."
  (if (or dmacro-on-abbrev dmacro-expanding)
      (let* ((endpt (point-marker))
	     (boln (save-excursion
		     (goto-char last-abbrev-location)
		     (beginning-of-line)
		     (point)))
	     (dmacro-fix-marks-on t))
	(dmacro-expand-region last-abbrev-location endpt)
	;; Use boln instead of last-abbrev-location to make sure that the first
	;; line gets indented first.  (This would burn "case" abbrev.)
	(indent-region boln endpt nil)
	;; The next call is just to be sure point does the right thing.  Else:
	;; Inserting this:     would leave point here:     instead of here:
	;;
	;;      {                         {                        {
	;;                                p                           p
	;;      }                         }                        }
	(indent-according-to-mode)
	;; And this does the same thing for all the marks that might need it.
	(dmacro-fix-marks-hack))
    (unexpand-abbrev)
    ))


;;; 
;;; PRIVATE FUNCTIONS
;;; 

;; 
;; Minibuffer prompting for dmacro name
;; 

;; Read the name of a dmacro from the user.
;; PROMPT can be nil (in which case a default prompt is used).
;; If CONFIRM is t then the user-specified string must be the name of an
;; existing dmacro.

(defun dmacro-minibuffer-read (prompt confirm)
  (let ((dmacro-table local-abbrev-table)
	(dmacro-verbose-list nil)
	res)
    ;; The while loop prevents an empty string from being entered.
    (while (zerop (length res))
      (if res				; There was an error
	  (beep t))
      (setq res (completing-read (or prompt "Dmacro: ") 
				 'dmacro-internal nil confirm nil))
      )
    res))

  
;; Helper function for dmacro-minibuffer-read.

(defun dmacro-internal (str ignore action)
  (cond 
   ;; Find the matches in both tables, return t if an 
   ;; exact match in either, else return the shorter
   ;; of the two (non-nil) common prefixes.
   ((null action)			; ACTION = Complete
    (let ((try1 (if dmacro-table 
		    (try-completion str dmacro-table)))
	  (try2 (try-completion str global-abbrev-table)))
      (or (eq t try1) (eq t try2)
      (dmacro-common-prefix try1 try2)
	  (if (or (null try2) 
		  (and try1 (< (length try1) (length try2))))
	      try1
	    try2))
      ))
   ;; Look it up.
   ((eq action 'lambda)			; ACTION = Verify
    (let ((local-abbrev-table dmacro-table))
      (abbrev-symbol str)
      ))
					; ACTION = List matches
   ;; List all matches (and maybe some other helpful information).
   ((let ((lis (append (if dmacro-table (all-completions str dmacro-table))
		       (all-completions str global-abbrev-table)))
	  (local-abbrev-table dmacro-table))
      (if (and (stringp dmacro-verbose-list)
	       (string-equal str dmacro-verbose-list))
	  ;; 2nd time through list dmacro names and their documentation
	  ;; (or expansion of documentation is nil).
	  (mapcar 
	   '(lambda (x) 
	      (format "\n%s:\t%s" x
		      (or
		       (let ((sym (abbrev-symbol x)))
			 (and sym (cdr (assq sym dmacro-doclist))))
		       (abbrev-expansion x)
		       )))
	   lis)
	;; 1st time through, just list dmacro names.
	(progn
	  (setq dmacro-verbose-list str)
	  lis))
      ))
    ))


(defun dmacro-common-prefix (s1 s2)
 ;; If one's nil, the other wins.
  (if (not (and s1 s2))
      (or s1 s2))
  (let ((len (min (length s1) (length s2)))
	(i 0))
    (while (and (< i len) (= (elt s1 i) (elt s2 i)))
      (setq i (1+ i)))
    ;; If no common prefix, return nil
    (if (zerop i)
	nil
      (substring s1 0 i))
    ))
	

(defun dmacro-fix-marks-hack ()
  ;; (save-excursion saves mark ring too, so we have to save point by hand)
  (if (and (not dmacro-recurse) dmacro-fix-marks)
      (let ((my-mark-list (cons (mark-marker) mark-ring))
	    savep)
	(setq savep (point))
	(mapcar (function (lambda (m)
			    (goto-char m)
			    (skip-chars-forward " \t")
			    (let ((badm (dmacro-member m my-mark-list)))
			      (if badm
				  (set-marker badm (point))
				))
			    ))
		dmacro-fix-marks)
	(goto-char savep)
	)))


;; Just like memq except: comparison is done with equal not eq;
;; returns the element, not the tail of the list whose care is ELT
;; Like (car (member ...)) in Common Lisp.
(defun dmacro-member (elt list)
  (catch 'got-it
    (mapcar (function (lambda (x)
			(if (equal x elt)
			    (throw 'got-it x))
			))
	    list)
    nil))
  

;; 
;; Auto dmacros
;; 

(setq find-file-hooks
      (cons 'auto-dmacro find-file-hooks))

(defun auto-dmacro ()
  (if (and (not buffer-read-only)
	   (zerop (buffer-size)))
      (let ((alist auto-dmacro-alist)
	    (fn (file-name-sans-versions buffer-file-name))
	    )
	(while (and alist
		    (if (and (string-match (car (car alist)) fn)
			     (abbrev-symbol (symbol-name (cdr (car alist)))))
			(progn
			  (insert-dmacro (symbol-name (cdr (car alist))))
			  (set-buffer-modified-p nil)
			  (message "New file. Inserted dmacro: %s"
				   (symbol-name (cdr (car alist))))
			  nil)
		      (setq alist (cdr alist))
		      ))
	  ))
    ))


(defun dmacro-expand-region (start end)
  ;; reset the prompt data list, unless we've specifically asked not to.
  (if (null dmacro-recurse)
      (progn
	(setplist 'dmacro-strings nil)
	(setq dmacro-point nil
	      dmacro-marks nil
	      dmacro-fix-marks nil)
	))
  (let ((endm (set-marker (make-marker) end))
	(dmacro-ts nil)
	(dmacro-fn nil)
	(dmacro-last-prompt 'your-text))
    (goto-char start)
    (while (and (< (point) endm)
		(search-forward dmacro-prefix-char endm t nil))
      (let* ((cmdbeg (point))
	     ;; parsed command (<func-name> <func-pointer> <arglist> <modlist>)
	     (cmd (dmacro-parse
		   (cond ((= ?\( (char-after cmdbeg))
			  ;; It's a macro (with possible modifiers)
			  (read (current-buffer)))
			 ((= ?w (char-syntax (char-after cmdbeg)))
			  (forward-word 1)
			  (car (read-from-string
				(buffer-substring cmdbeg (point))
				 ))
			  )
			 (t (forward-char 1)
			    (car (read-from-string (char-to-string 
						    (char-after cmdbeg))))
			    ))
		   nil nil))
	     (text
	      (if (nth 1 cmd)
		  (progn
		    (delete-region (1- cmdbeg) (point))
		    (dmacro-run cmd)
		    )))
	     )
	(if text (insert text))
	))
    (if (not dmacro-recurse)
	(progn
	  (if (null dmacro-point) (setq dmacro-point endm))
	  ;; If the user wants the extra text inserted at a mark instead of
	  ;; point, we have to swap values of point and the specified mark.
	  (if (and dmacro-goto-mark dmacro-marks)
	      (let* ((marknum (- (length dmacro-marks)
				 (prefix-numeric-value dmacro-goto-mark)))
		     (ourmark (nthcdr
			       (if (> 0 marknum) 
				   (1- (length dmacro-marks)) marknum)
			       dmacro-marks))
		     (newpoint (car ourmark)))
		(setcar ourmark (copy-marker dmacro-point))
		(setq dmacro-point newpoint)))
	  (mapcar
	   (function (lambda (m)
		       (push-mark m t)
		       (set-marker m nil) ; null it so it doesn't slow editting
		       ))
	   dmacro-marks)
	  ;; If there was no point set, AND we started at the end of the
	  ;; region AND we wound up after the original point marker,
	  ;; then the very last thing in the region was a command and it
	  ;; got expanded after the marker.  Therefore, we should leave
	  ;; the point alone and not move it back.  Example: Today is
	  ;; Wed Wrong^ ^Correct
	  (if (not (and (= dmacro-point endm)
			(> (point) endm)))
	      (goto-char dmacro-point))
	  (if dmacro-extra (insert-before-markers dmacro-extra))
	  ;; Fill in the blanks
	  (if dmacro-prompt
	      (dmacro-process-strings (if (not (eq t dmacro-prompt))
					    (dmacro-get-words start))))
	  ))
    ))


(defun dmacro-parse (cmd args mods)
  (if (and (listp cmd)
	   (listp (car cmd)))
      ;; the cdr is definitely a modlist
      (dmacro-parse (car cmd) nil (cons (cdr cmd) mods))
    (let (func lookup)
      (if (listp cmd)
	  (setq func (car cmd)
		args (or args (cdr cmd)))
	(setq func cmd)
	)
      (setq lookup (cdr (assq func dmacro-functions)))
      (if (and (listp lookup)
	       (eq ':alias (car lookup)))
	  (dmacro-parse (cdr lookup) args mods)
	(list func lookup args mods)
	))
    ))


;; parsed command (<func-name> <func-pointer> <arglist> <modlist>)
(defun dmacro-run (cmd)
  (dmacro-apply-modifiers
   (if (or (eq 'prompt (car cmd))
	   (eq 'if (car cmd)))
       ;; must remember mods for post-prompt processing
       (apply (nth 1 cmd) (nth 3 cmd) (nth 2 cmd))
     (apply (nth 1 cmd) (nth 2 cmd)))
   (nth 3 cmd)
   (eq 'prompt (car cmd))
   ))


;; Process the modifiers
(defun dmacro-apply-modifiers (text modlist forbid-trunc)
  (if (null text)
      ""
    (while modlist
      (let ((modifiers (car modlist))
	    (pad ?\ )
	    caser
	    mod-start mod-end sexps)
	(while modifiers
	  (cond ((numberp (car modifiers))
		 ;; substring
		 (if mod-start
		     (setq mod-end (car modifiers))
		   (setq mod-start (car modifiers))))
		;; sub-expressions, not characters
		((eq ':sexp (car modifiers))
		 (setq sexps t))
		;; left-padding
		((eq ':pad (car modifiers))
		 (setq modifiers (cdr modifiers)
		       pad (car modifiers)))
		;; upper/lower/capitalized
		((setq caser (cdr (assq (car modifiers)
					'((:up . upcase)
					  (:down . downcase)
					  (:cap . capitalize)))))
		 ))
	  (setq modifiers (cdr modifiers)))
	(if (and mod-start (not forbid-trunc))
	    (condition-case nil
		(setq text 
		      (if sexps
			  (substring text
				     (dmacro-sexp-pos text mod-start t)
				     (dmacro-sexp-pos text mod-end nil))
			(substring text mod-start mod-end)))
	      (error))
	  )
	(if (and (not (eq pad ?\ ))
		 (string-match "^\\s-+" text))
	    (setq text
		  (concat (if pad
			      (make-string (- (match-end 0)
					      (match-beginning 0))
					   pad))
			  (substring text (match-end 0))
			  ))
		   )
	(if caser
	    (setq text (funcall caser text)))
	)
      (setq modlist (cdr modlist)))
    text))


(defun dmacro-sexp-pos (text count startP)
  (if count
      (save-excursion
	(set-buffer (get-buffer-create " dmacro-temp"))
	(erase-buffer)
	(let ((emacs-lisp-mode-hook nil))
	  (emacs-lisp-mode))
	(insert text)
	(if (< count 0)
	    (goto-char (point-max))
	  (goto-char (point-min)))
	(forward-sexp count)
	(if (and (not startP) (< count 0))
	    (forward-sexp 1)
	  (if (>= count 0)
	      (progn		  
		(forward-sexp 1)
		(if startP
		    (backward-sexp 1)
		  ))
	    ))
	(- (point) (point-min)))
    ))



(defun dmacro-process-strings (words)
  (save-excursion
    (let ((fillin (symbol-plist 'dmacro-strings))
	  ;; set to nil so read functions will do their stuff
	  (executing-macro nil))
      (while fillin
	(let* ((blanks (reverse (car (cdr fillin))))
	       (prompt (car blanks))
	       (str (if words
			(car words)
		      (apply (or (car (cdr prompt)) 'read-string) 
			     (or (car prompt) 
				 (concat
				  (capitalize (symbol-name (car fillin))) ": "))
			     (cdr (cdr prompt))))
		    ))
	  (while (setq blanks (cdr blanks))
	    (goto-char (car (car blanks)))
					; Remove the "<foo>"
	    (insert-before-markers
	     (if (car (cdr (car blanks)))
		 ;; It's a modifier list
		 (progn
		   (delete-char (+ 2 (length (symbol-name (car fillin)))))
		   (dmacro-apply-modifiers str
					     (cdr (cdr (car blanks)))
					     nil)
		   )
	       ;; It's the then/else clauses from a conditional expression
	       (dmacro-apply-modifiers
		(if (or (null str) (string= "" str))
		    (dmacro-funcall (nth 3 (car blanks)))
		  (dmacro-funcall (nth 2 (car blanks))))
		(nth 4 (car blanks))
		nil)
	       ))
	    ))
	(setq fillin (cdr (cdr fillin))
	      words (cdr words))
	))
    (setplist 'dmacro-strings nil)
    ))

(defun dmacro-get-words (end)
  (save-excursion
    (save-restriction
      (goto-char end)
      (narrow-to-region (point-min) end)
      (let ((cnt (/ (length (symbol-plist 'dmacro-strings)) 2))
	    (loc end)
	    (lis nil))
	(while (not (zerop cnt))
	  (backward-sexp)
	  (let ((s (point))
		(trim (if (= ?\" (char-after (point)))
			  1 0)))
	    (forward-sexp)
	    (setq lis (cons (buffer-substring (+ s trim) (- (point) trim))
			    lis))
	    )
	  (backward-sexp)
	  (setq cnt (1- cnt))
	  )
	(delete-region (point) end)
	lis)
      ))
  )


;; 
;; Macro helpers
;; 

;; Most dmacros won't need to know the current time or the filename, so
;; we don't want to compute it each time we do a dmacro-expand-region.
;; On the other hand, we don't want to compute it each time it's asked for
;; since that would be inefficient if a dmacro needed it several times
;; (e.g. "~hour:~min:~sec") (not to mention the fact that the time string
;; could change during expansion and inconsistent information from two
;; different times strings.
;;   Anyway, these functions compute the information once and then save it
;; for the extent of the current expansion.

(defun dmacro-ts ()
  (or dmacro-ts (setq dmacro-ts (current-time-string))))
(defun dmacro-fn ()
  (or dmacro-fn (setq dmacro-fn (or (buffer-file-name) (buffer-name)))))


;; ...   name ((prompt label prompter args) [(loc . caser)...]) ...
;; E.g.: function (("Enter function: " "<function>" 'read-string nil) 
;;                 (120 . capitalize) (140 . identity))

(defun dmacro-save-string (typeflag val itemname args)
  (if (null (get 'dmacro-strings itemname))
      (put 'dmacro-strings itemname (list args)))
  (put 'dmacro-strings itemname
       (cons (cons (point-marker) (cons typeflag val))
	     (get 'dmacro-strings itemname)))
  )


;; Used by the "if" macro and other things to evaluate its args.
;; Returns SEXP if it's a string or nil, otherwise it treats SEXP as a
;; dmacro command and parses and runs it and returns the resulting
;; string (or nil if the result was nil or the empty string).

(defun dmacro-funcall (sexp)
  (if (stringp sexp)
      sexp
    (if (null sexp)
	nil
      (let* ((res (dmacro-run (dmacro-parse sexp nil nil))))
	(if (string= "" res)
	    nil
	  res)
	))
    ))


(defun dmacro-month-num ()
  (1+ (/ (string-match 
	  (substring (dmacro-ts) 4 7)
	  "JanFebMarAprMayJunJulAugSepOctNovDec")
	 3)))


;; Thanks to Dean Norris (William Dean Norris II) at UFL for insisting
;; that this be added.

(defun dmacro-initials ()
  "Given a user name, return a string containing the user's initials.
See also the description of the variable DMACRO-RANK-IN-INITIALS, which 
affects the behavior of this function."
  (let ((fullname (user-full-name))
	(index -1)
	(res nil))
    (while index
      (setq index (string-match "\\<" fullname (1+ index)))
      (if index (setq res (concat res (substring fullname index (1+ index)))))
      )
    ;; If the last word was a rank, either add the rest of the word, or
    ;; delete the first char that was processed (depending on the value of
    ;; dmacro-rank-in-initials).
    (if (and (> (length res) 1)
	     (string-match "\\([IVX]+\\|[JS]R\\)\\.?$" fullname (match-end 0)))
	(if dmacro-rank-in-initials
	    (concat res (substring fullname 
				   (1+ (match-beginning 1))
				   (match-end 1)))
	  (substring res 0 -1)
	  )
      res)
    ))
      
(defun dmacro-push-mark ()
  ;; If we're indenting, notice all marks which appear on a line with
  ;; only whitespace to their left.  They will have to be indented by
  ;; hand, since c-indent (among others) doesn't do the right thing.
  (if (and dmacro-fix-marks-on
	   (not (bolp))
	   (save-excursion
	     (skip-chars-backward " \t")
	     (bolp)))
      (setq dmacro-fix-marks (cons (copy-marker (point)) dmacro-fix-marks)))
  (setq dmacro-marks (cons (copy-marker (point)) dmacro-marks))
  nil)


;;; 
;;; MODULE NAME
;;; 

(provide 'dmacro)
