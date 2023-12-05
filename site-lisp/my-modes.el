(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))

  (setq py-install-directory "~/site-lisp")
  (add-to-list 'load-path py-install-directory)
  (require 'python-mode)


;============================================================
; Set up filename/mode bindings via auto-mode-alist         ;
;============================================================
(setq auto-mode-alist
      (append 
       '(	
	 ("\\.\\(cpp\\)\\'"                     . c++-mode)  ;  case isn't being acknowledged!
	 ("\\.\\([chv]\\)\\'"                     . c-mode)  ;  case isn't being acknowledged!
	 ("\\.pc\\'"                                   . c-mode) ; added pc for Pro*C
	 ("\\.\\(pl\\|plx\\|plex\\|cgi\\|pm\\)\\'"     . perl-mode)
	 ("Configure\\'"                               . perl-mode)
	 ("\\.py$"                                     . python-mode)
	 ("akefile$"                                   . makefile-mode)
	 ("\\.\\(m\\|mak\\)$"                          . makefile-mode)
	 ("\\.sh$"                                     . shell-script-mode)  ; sh-mode)
	 
	 ("\\.html$"                                   . html-helper-mode)
	 ("\\.htm$"                                    . html-helper-mode)
	 
	 ("ups_re.*\\'"   . html-helper-mode)

	 ("\\.ctm$"                                    . html-helper-mode)
	 
	 ("\\.css\\'"                                  . css-mode)
	 ("\\.php\\'"                                  . php-mode)
	 ("\\(sp_\\|fk_\\|seq_\\|tb_\\|tr_\\).*\\'"    . sql-mode)
	 ("\\.\\(sql\\|tbl\\|sp\\)\\'"                 . sql-mode)
	 ("\\.js$"                                     . java-mode)
	 ("\\.dm\\'"                                   . emacs-lisp-mode)
	 
					;  Specially Named Files
	 ("\\.emacs"                                   . emacs-lisp-mode)
	 ("\\(dmacro\\|abbrev_defs\\)$"                . emacs-lisp-mode)
;	 ("\\.mailrc\\'"                               . shell-script-mode)
	 (".\\(mailrc\\|profile\\|aliases\\)$"         . shell-script-mode)
	 ("\\(svl\\|net\\).*\\'"   . shell-script-mode)
	 ("\\.\\(xml\\|xsl\\)\\'"                      . xml-mode)
	 ) 
       auto-mode-alist))

  ;=================================================================
  ; The REAL default mode based on above
  ;=================================================================
(defun my-default-mode () nil
  "This will try to figure out the best mode
 using text-mode as a default, based on the contents of the file"
  (save-excursion
	 (beginning-of-buffer)
	 (cond
	  ; order very important!
	  ((looking-at "^#!.+csh") (shell-script-mode))
	  ((looking-at "^#!.+sh") (shell-script-mode))	; bash also
	  ((looking-at "^#!.+ksh") (shell-script-mode))
	  ((looking-at "^#!.+perl") (perl-mode))
	  ((looking-at "^#!.+pl") (perl-mode))
;	  ((looking-at "^#!.+awk") (awk-mode))
	  ((looking-at "^#x") (shell-script-mode))
	  ; use text-mode as default (different than setting default-major-mode) !!!
	  (t (text-mode)))))

(my-default-mode)

;=================================================================
;                INDIVIDIAUL MODE SETTINGS                       ;
;=================================================================

   ;=================================================================
   ; SQL Stuff                                                      ;
   ;=================================================================

(setq sql-dataserver-type "oracle")
(setq sql-abbrev-mode t)

(setq sqlplus-username-password "asrs\/venum15\@avp68db")


;(autoload 'sql-mode "sql-mode"
;  "Mode for editing SQL files and running SQL interpretor." t)
;(setq sql-set-dataserver-type "oracle")
;; for now..... (add-hook 'sql-mode-hook 'abbrev-mode)
;(add-hook 'sql-mode-hook 
;			 '(lambda ()
;				 (turn-on-font-lock)
;				 t))

;=================================================================
; SQL Stuff
;    (require 'sql-mode)
;    (sql-initialize)

;**************************************************
  (defvar sql-server nil)
  (defvar sql-server-name nil)
  (defvar sql-user nil)
  (defvar sql-password nil)
  (defvar sql-database nil)
  (defvar sql-database-name nil)
  (defvar sql-server-table nil)
  (defvar sql-user-table nil)
  (defvar sql-table-list nil)
  (defvar sql-database-list nil)
  (defvar sql-column-list nil)
  (defvar sql-value-list nil)
  (defvar sql-stored-procedure-list nil)
  (defvar sql-user-list nil)
;  (defvar sql-secure-passwords t
;	 "*Make password entry invisible if non-nil.")

(load-library "hscroll")

(defun my-sql-mode-hook ()
  "My SQL-mode customized hooks"
  (interactive)
	(turn-on-font-lock)
 ;;   (modify-syntax-entry ?\_ "w") ;; make _ a regular "in-word" char
  (setq-default abbrev-mode t)
  (setq-default truncate-partial-width-windows nil)
  (setq-default truncate-lines 2010)

  (make-local-variable 'comment-start)
  (setq comment-start "/* ")
  (make-local-variable 'comment-end)
  (setq comment-end " */")
  (turn-on-hscroll)
)


(require 'sql-mode)
 
; (sql-initialize)


(autoload 'sqlplus "sql-mode" 
   "Run an interactive SQL*plus session in a separate buffer." t)
(autoload 'sql-mode "sql-mode"
   "Major mode for editing SQL*plus batch files." t)

(add-hook 'sqlplus-mode-hook 'my-sql-mode-hook)

(add-hook 'sql-mode-hook 'my-sql-mode-hook)

(fset 'collapse-msgs
   [end delete end delete end delete end delete end delete end delete end delete end delete end delete end delete end delete end home down delete])
(global-set-key "\M-C" 'collapse-msgs)

; This will run the 'set tab off, set echo on, set linesize 2000, and set pagesize 60'
; && ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY HH24:MI:SS'

(fset 'sql-init
   "set echo on\C-mset tab off\C-mset linesize 2000\C-mset pagesize 60\C-mALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY HH24:MI:SS';\C-m")


 (global-set-key "\M-i" 'sql-init)

(defun my-sql-save-history-hook ()
    (let ((lval 'sql-input-ring-file-name)
          (rval 'sql-product))
      (if (symbol-value rval)
          (let ((filename 
                 (concat "~/.emacs.d/sql/"
                         (symbol-name (symbol-value rval))
                         "-history.sql")))
            (set (make-local-variable lval) filename))
        (error
         (format "SQL history will not be saved because %s is nil"
                 (symbol-name rval))))))
 
  (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)


   ;=================================================================
   ; Func-Menu
   ;=================================================================
 (require 'func-menu)
 (define-key global-map "\M-G" 'fume-prompt-function-goto)
(global-unset-key [M-button1])
(global-unset-key [M-down-mouse-1])
(define-key global-map '[M-down-mouse-1] 'fume-mouse-function-goto)
;(define-key global-map "\C-mouse-3" 'fume-mouse-function-goto)

   ;=================================================================
   ; C/C++ Modes                                                    ;
   ;=================================================================
(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
;; (autoload 'c-mode "cc-mode" "C Editing Mode" t)
(autoload 'c-mode "cc-mode" "C Editing Mode" t)

(defun my-c-mode-common-hook ()
  "My C/C++/Java mode customized hook s"
  (interactive)
  (turn-on-font-lock)
;  (turn-on-hscroll)
  (setq-default abbrev-mode t)
  (function-menu)
  (imenu-add-to-menubar "My C Functions") ;works ...try C-Button2
; (imenu-add-to-menubar "My Perl Functions")
  (c-toggle-auto-hungry-state t)
  (c-set-offset 'substatement-open 0)
  (setq-default c-basic-offset 4)
  (c-set-offset 'case-label '+)
  
  (setq indent-tabs-mode nil)
;49:  In C mode, can I show just the lines that will be left after #ifdef
;     commands are handled by the compiler?
  (hide-ifdef-mode t)
;  M-x hide-ifdef-mode.  (This is a minor mode.)  You might also want to try
;  cpp.el, available at the Emacs Lisp Archive (see question 90).



;  (set-face-background 'font-lock-reference-face bgcolor)
  (set-face-foreground 'font-lock-reference-face "Steel Blue")
  (message "This is my-c-mode-common-hook")
  )


(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c-mode-common-hook 'my-hide-ifdef-mode-hook)


(setq compilation-window-height 15)



(add-hook 
 'c-mode-hook 
 (function
  (lambda ()
    (unless (or (file-exists-p "makefile")
     		(file-exists-p "Makefile"))
;      (make-local-variable 'compile-command)
      (setq compile-command
	    (concat "cl "
		    (file-name-sans-extension (file-name-nondirectory buffer-file-name))
		    ;; (file-name-sans-extension buffer-file-name)
		    ))))
 ))

(defun my-hide-ifdef-mode-hook ()
;      '(lambda ()
;	 (if (not hide-ifdef-define-alist)
;	     (setq hide-ifdef-define-alist
;		   '(
;		     (list1 ONE TWO)
;		     (list2 TWO THREE)
;		     )
;		   ))
;	 (hide-ifdef-use-define-alist 'list2) ; use list2 by default
;	 ))

  '(lambda ()
     (if (not hide-ifdef-define-alist)
	 (setq hide-ifdef-define-alist
	       '((list1 1 DEBUGIT DEBUG_NEW JWF1 JWF2 JWF12 DEBUGIT2 )
					;		    (list2 TWO THREE)
		 )))
     (hide-ifdef-use-define-alist 'list1) ; use list1 by default
     (message "Hiding Hook")
     ))

(setq hide-ifdef-mode-hook
      '(lambda ()
	 (if (not hide-ifdef-define-alist)
	     (setq hide-ifdef-define-alist
		  '((list1 ONE TWO)
		    (list2 TWO THREE)
		    (list3 1 DEBUGIT DEBUG_NEW JWF1 JWF2 JWF12 DEBUGIT2 )
		    )))
	 (hide-ifdef-use-define-alist 'list3) ; use list3 by default
	 ))



   ;=================================================================
   ; Python Stuff                                                   ;
   ;=================================================================

(add-hook 'python-mode-hook 'my-python-mode-common-hook)

(defun my-python-mode-common-hook ()
  "Hook code for Python mode"
  (interactive)
;  (imenu-add-to-menubar "My Python Functions")
  (function-menu)
  (local-set-key "\C-F" 'py-mark-def-or-class)
  )


   ;=================================================================
   ; Perl Stuff                                                     ;
   ;=================================================================
(autoload 'perl-mode "perl-mode" "Perl Editing Mode" t)
; (autoload 'tpd-perl-mode-hook "tpd-perl-mode-stuff" "TPD Perl Stuff" t)
;(add-hook 'perl-mode-hook 
;			 '(lambda ()
;				 (my-turn-on-font-lock)
;				 t))
(add-hook 'perl-mode-hook 'my-perl-mode-common-hook)
;(require 'imenu)
;(add-hook 'perl-mode-hook (function (lambda () (imenu-add-menubar-index))))


(defun my-perl-mode-common-hook ()
  "Hook code for Perl mode"
  (interactive)
  (imenu-add-to-menubar "My Perl Functions")
  (function-menu)
  (local-set-key "\C-F" 'mark-perl-function)
  )

   ;=================================================================
   ; C-PERL Stuff
   ;=================================================================
(add-hook 'cperl-mode-hook 'my-cperl-mode-common-hook)

(defun my-cperl-mode-common-hook ()
  "Hook code for C-Perl mode"
  (interactive)
;  (set-face-background 'font-lock-emphasized-face bgcolor)
  (set-face-foreground 'font-lock-emphasized-face "SpringGreen")
;  (set-face-background 'font-lock-other-emphasized-face bgcolor)
  (set-face-foreground 'font-lock-other-emphasized-face "SandyBrown")
)



   ;=================================================================
   ; HTML Stuff                                                     ;
   ;=================================================================
(autoload 'html-helper-mode "html-helper-mode" "HTML Helper Mode" t)
(add-hook 'html-helper-mode-hook 'turn-on-font-lock)
(add-hook 'html-helper-mode-hook 'my-html-mode-hook t)
(add-hook 'html-helper-load-hook t)
(add-hook 'html-helper-mode-hook t)
(add-hook 'html-helper-mode 'html-helper-netscape)

(defun my-html-mode-hook ()
  "Turns on auto-fill-mode"
  (interactive)
					;  (auto-fill-mode 1)
  (setq-default abbrev-mode t)
  )

;(setq html-helper-user-menu t)
; (setq html-helper-use-expert-menu t)
;; Have html-helper-mode prompt for tag values
(setq tempo-interactive t)
(setq html-helper-do-write-file-hooks t)
(setq html-helper-build-new-buffer t)
(setq html-helper-address-string "<a href=\"mailto:john.fierke@avnet.com\">John Fierke</a>")
(setq my-body-attributes  " BGCOLOR=\"#FFFFFF\" TEXT=\"#000000\" ")

   ;=================================================================
   ; CSS Stuff                                                      ;
   ;=================================================================

(autoload 'css-mode "css-mode")
; (setq auto-mode-alist       
;       (cons '("\\.css\\'" . css-mode) auto-mode-alist))


   ;=================================================================
   ; PHP Stuff                                                      ;
   ;=================================================================

(autoload 'php-mode "php-mode")



   ;=================================================================
   ; Lisp Stuff                                                     ;
   ;=================================================================
(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)

(add-hook 'emacs-lisp-mode-hook
			 '(lambda ()
				 (turn-on-font-lock)
				 (local-set-key "\C-cb" 'byte-compile-file)
				 (imenu-add-to-menubar "My Elisp Functions")
				 (abbrev-mode 1)
				 t))

   ;=================================================================
   ; MAIL Stuff                                                    ;
   ;=================================================================
					;(setq mail-load-hook nil)
					;(add-hook 'mail-mode-hook
					;			 '(lambda ()
					;				 (turn-on-font-lock)
					;				 t))

   ;=================================================================
   ; VM Stuff                                                       ;
   ;=================================================================

					;(autoload 'vm "vm" "Start VM on your primary inbox." t)
					;(autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
					;(autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
					;(autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
					;(autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
					;(autoload 'vm-mail "vm" "Send a mail message using VM." t)
					;(autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)



   ;=================================================================
   ; DIRED Stuff                                                    ;
   ;=================================================================
(setq dired-local-variables-file ".dired")
(setq-default save-place t)
(setq dired-load-hook nil)
(add-hook 'dired-mode-hook
	  '(lambda ()
	     (turn-on-font-lock)
	     t))

   ;=================================================================
   ; Text Stuff                                                     ;
   ;=================================================================
(add-hook 'text-mode 'turn-on-auto-fill)
;(add-hook 'text-mode-hook 'turn-on-hscroll)

   ;=================================================================
   ; Find-File Stuff                                                ;
   ;=================================================================
(autoload 'ff-find-other-file "find-file" "Find this file's associated file." t)
(autoload 'ff-get-other-file "find-file" "Find this file's associated file." t)
;; I do my own wrappers around find-other-file because of stored procedure files
(autoload 'my-find-proc-file "my-find-file-stuff" "find file stuff" t)
(autoload 'my-find-src-file "my-find-file-stuff" "find file stuff" t)
(setq ff-search-directories
      '(
	"." "../dat/*" "/usr/include/*" "/phx" "../../*"
	))
					; "/opt/SUNWappc/*" 
					;	"/rpt/log/phx" "/rpt/log" "/rpt/log/*"
					;	"."  "c:\\sapphire\\include" "c:/Program Files/DevStudio/VC/include" 
					;                 "c:/Program Files/DevStudio/VC/mfc/include" 
					;	"c:/orant/pro80/c/include" "c:/projects/work" 
					;	"/rpt/log/phx" "." "../../*" 
					;"/phx" "/usr/include/*" "/rpt/log" "/rpt/log/*"


(setq ff-special-constructs
      '(
	;; C/C++ include, for NeXTSTEP too
	("^\#\\s *\\(include\\|import\\)\\s +[<\"]\\(.*\\)[>\"]" .
	 (lambda ()
	   (setq fname (buffer-substring (match-beginning 2) (match-end 2)))))


	;; Special for ASRS #defines of Screen(.src) files
	;;   1. #define SCREEN_NAME     "/PATH/TO/FILE/SCREEN.FILE"
	;;   2. #define SCREEN_NAME     MACRO("PARTIAL/PATH/SCREEN.FILE")
	;;           MACRO = FILSYS, PRI_FS, SHD_FS, LOG_FS, RPT_FS, SHCNFS
	;;   3  #include  CONSTANT/include.h"
	;;   4. #define   SCREEN_NAME CONSTANT
	("^\#\\s *\\(define\\|import\\)\\s +\\([a-zA-Z0-9_]+\\) +\\(FILSYS\\|LOG_FS\\)\\s *[\(] *\"\\(.*\\)\" *[\)]" .
	 (lambda ()
	   (setq fname (buffer-substring (match-beginning 4) (match-end 4))))
	 ) ; ASRS1  (#define SCREEN_NAME FILSYS("partial/path/screen.file"))
	
	("^\#\\s *\\(define\\|import\\)\\s +\\([a-zA-Z0-9_]+\\) +\"\\(.*\\)\"" .
	 (lambda ()
	   (setq fname (buffer-substring (match-beginning 3) (match-end 3))))
	 ) ; ASRS2 (#define SCREEN_NAME "/path/to/file/screen.file")
	
	("^\#\\s *\\(include\\|import\\)\\s +\\([A-Z0-9_]+\\)\/\\(.*\\)[\"]" .
	 (lambda ()
	   (setq fname (buffer-substring (match-beginning 3) (match-end 3))))
	 ) ; ASRS3 (#include CONST/include.h")

	("^\#\\s *\\(define\\|import\\)\\s +\\([a-zA-Z0-9_]+\\) +\\([A-Z0-9_]+\\)\/\\(.*\\)\"" .
	 (lambda ()
	   (setq fname (buffer-substring (match-beginning 4) (match-end 4))))
	 ) ; ASRS4 (#define SCREEN_NAME CONST/path/to/file/screen.file")
	
	;; for PYTHON
	("^import[ \t]+\\([a-zA-Z0-9_\\.]+\\)" .
	 (lambda ()
	   (setq fname 
		 (concat  
		  (buffer-substring (match-beginning 1) (match-end 1))
		  ".py"))
	   ))

	;; Ada import
	("^with[ \t]+\\([a-zA-Z0-9_\\.]+\\)" .
	 (lambda ()
	   (setq fname (buffer-substring (match-beginning 1) (match-end 1)))
	   (require 'ada-mode)
	   (setq fname (concat (ada-make-filename-from-adaname fname)
			       ada-spec-suffix))))
	)
      )

   ;=================================================================
   ; Abbreviation Stuff                                             ;
   ;=================================================================
(read-abbrev-file       "~/.abbrev_defs"    )
(autoload 'abbrev-mode  "abbrev" "Abbreviation Mode"       t)
(autoload 'abbrev       "abbrev-mode" "Abbreviation Mode"  t)

;(setq save-abbrevs nil)
; (read-abbrev-file abbrev-file-name)


   ;=================================================================
   ; Who Knows                                                      ;
   ;=================================================================
(setq zmacs-regions t);; make regions highlighted
(setq server-temp-file-regexp "^/tmp/\\|/usr/tmp/\\|/draft$\\|oae_")


;; ;; JWF : Commented out 03/31/2015 - Fails to load
;; ;; ------------------------------------------------------------------------------------
;; ;    ;=================================================================
;; ;    ; DMacro Stuff                                                   ;
;; ;    ;=================================================================
;; (load-library "dmacro")
;; (require 'dmacro)

;; (defun my-reload-dmacros ()
;;   "Reload my dmacros from Where? "
;;   (interactive)
;;   (load "my-other-dmacro.dm")
;;   (setq auto-dmacro-alist (append '(("\\.c$" . masthead) ("\\.h$" . dot-h))
;; 				  auto-dmacro-alist))
  
;; )

;; (my-reload-dmacros)
;; ; ;(autoload 'my-reload-dmacros "my-dmacro-stuff" "My dmacro stuff" t)
;; ; ;(autoload 'my-set-dmacro-alist "my-dmacro-stuff" "My dmacro stuff" t)

;; ; ;(my-set-dmacro-alist)
;; ;; ------------------------------------------------------------------------------------

;; (add-hook 'custom-mode-hook 'my-custom-mode-hook)


(defun my-custom-mode-hook ()
  "My Custom-mode customized hooks"
  (interactive)
  (turn-on-font-lock)
  (set-face-foreground 'custom-state-face "aquamarine")
  )

;; cal-desk-calendar.el --- Desk calendar style extensions to Emacs' Calendar/Diary
;;     SEE ~/site-lisp/desk-calendar-0.7/cal-desk-calendar.el
;(load-library "cal-desk-calendar")
;(add-hook 'diary-display-hook 'sort-diary-entries)
;(add-hook 'diary-display-hook 'fancy-schedule-display-desk-calendar t)

; turn on auto fill mode when editing text files
;(add-hook 'text-mode-hook 'turn-on-auto-fill)

; Use this if you have a network printer
					; ; (setq printer-name "\\\\C084\\C084_HPLASER3_2")
(setq printer-name "172.18.72.242")


   ;=================================================================
   ; ISPELL4 Stuff                                                  ;
   ;=================================================================

(autoload 'ispell-word "c:/emacs/bin/ispell/ispell"
  "Check spelling of word at or before point" t)
(autoload 'ispell-complete-word "c:/emacs/bin/ispell/ispell"
  "Complete word at or before point" t)
(autoload 'ispell-region "c:/emacs/bin/ispell/ispell"
  "Check spelling of every word in the region" t)
(autoload 'ispell-buffer "c:/emacs/bin/ispell/ispell"
  "Check spelling of every word in the buffer" t)
(setq ispell-command "c:/emacs/bin/ispell/ispell.exe"
      ispell-look-dictionary "c:/emacs/bin/ispell/ispell.words"
      ispell-look-command "c:/emacs/bin/ispell/look.exe"
      ispell-command-options (list "-d"
											  "c:/emacs/bin/ispell/ispell.dict"))

(setq ispell-dictionary "c:/emacs/bin/ispell/ispell.dict")



   ;=================================================================
   ; VISUAL BASIC  Stuff                                            ;
   ;=================================================================

(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\)$" .
                                  visual-basic-mode)) auto-mode-alist))
(autoload 'vbp-mode "visual-basic-mode" "VBP mode." t)
(setq auto-mode-alist (append '(("\\.\\(vbg\\|vbg\\)$" .
                                  vbp-mode)) auto-mode-alist))
(setq visual-basic-ide-pathname "CE:/Program Files/DevStudio/VB/VB5.EXE")

(autoload 'vbp-mode "vbp-mode" "VBP mode." t)
(setq auto-mode-alist (append '(("\\.vbp$" .
                     vbp-mode)) auto-mode-alist))


;  ;; add menus to menubar

;(require 'easymenu)

;(setq my-menu-map (make-sparse-keymap "Title"))

;(define-key my-menu-map [indent-relative]
;  '(menu-item "Indent relative" indent-relative
;	      :enable t
;	      :visible t))

;(defvar hideifdef-menu nil)

;(defun hide-mode-menu (modestr)
;  (let ((m
;	 '(
;	   ["Toggle hide-ifdef-mode" hide-ifdef-mode t]
;	   "---"
;	   ["Supress #ifdef's"       hide-ifdefs t]
;	   ["Show #ifdef's"          show-ifdefs t]
;	   "---"
;	   ["Read-Only"              hide-ifdef-read-only t]
;	   "---"
;	   ["Define Symbol"          hide-ifdef-define t]
;	   ["Undefine Symbol"        hide-ifdef-undef t]
;	   )))
;    (cons modestr m)))

;(easy-menu-add (hide-mode-menu mode-name))


(defun tpd-goto-buffer-list ()
  "bring up AND go to the buffer list.  position cursor at first entry. afc."
  (interactive)
  (list-buffers)
  (other-window 1)
  (next-line 2))
; (global-set-key "\C-x\C-b" 'tpd-goto-buffer-list)

; mode hook for gdb mode (TPD)
;(add-hook 'gdb-mode-hook
;	  '(lambda ()
;	     (def-gdb "next" "\M-n" "one more line")
;	     (def-gdb "cont" "\M-c" "keep going")))

