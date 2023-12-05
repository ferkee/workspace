; From : http://brookland.mech.uwa.edu.au/barney/.emacs.txt

;(setq debug-on-error t)

;;search paths

(setq exec-path (cons "/bin" exec-path))
(setq load-path (cons (expand-file-name "~/lisp") load-path))
(setq load-path (cons (expand-file-name "~/lisp/jde") load-path))
;;(setq load-path (cons (expand-file-name "~/lisp/custom") load-path))
(setq load-path (cons (expand-file-name "~/lisp/cc-mode") load-path))
;(setq load-path (cons (expand-file-name "~/lisp/oo-browser") load-path))
;(setq load-path (cons (expand-file-name "~/lisp/oo-browser/hypb") load-path))
;(setq load-path (cons (expand-file-name "~/lisp/psgml") load-path))


;;add cygnus stuff to info search
(setq Info-default-directory-list 
      (cons (concat (expand-file-name (getenv "cygnus")) "/info")  Info-default-directory-list)) 
(setq Info-default-directory-list (cons (expand-file-name "~/info")  Info-default-directory-list)) 
(setq Info-default-directory-list (cons (expand-file-name "~/oo-browser/man")  Info-default-directory-list)) 



;; frame and buffer setup
(setq default-frame-alist
      '((top . 55) (left . 40)
	(width . 120) (height . 55)
	(cursor-color . "light goldenrod")
					; (cursor-type . box)
	(foreground-color . "gold")
					; (foreground-color . "sandy brown")
	(background-color . "black")
	(font . "-*-Lucida Console-normal-r-*-*-11-82-*-*-c-*-*-ansi-")))
					; (font . "-*-Courier-normal-r-*-*-13-97-*-*-c-*-*-ansi-")))


(setq initial-frame-alist '((top . 30) (left . 30)))
(setq frame-background-mode 'dark)

(set-face-background 'modeline "dark slate grey")
(set-face-foreground 'modeline "bisque")
(set-face-background 'region "gray19")
(set-face-background 'show-paren-match-face "coral3")

(require 'gnuserv)
(gnuserv-start)
(setq gnuserv-frame (selected-frame))


;better buffer menus
(require 'msb)
(setq msb-menu-cond (cons '((eq major-mode 'jde-mode) 3019 "Java Files (%d)") msb-menu-cond))
(put 'narrow-to-region 'disabled nil)

(setq default-major-mode 'text-mode)

;; --------------------------------------------------------------------------
;; automatically resizing the minibuffer to display whole contents,
;; really very nice feature!
(autoload 'resize-minibuffer-mode "rsz-mini" nil t)
(resize-minibuffer-mode)
(setq resize-minibuffer-window-exactly nil)
;; --------------------------------------------------------------------------

;;allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;;use page up/down in minibuffer
(global-set-key [minibuffer-local-map up]   'previous-history-element)
(global-set-key [minibuffer-local-map down] 'next-history-element)

;;use C-n C-p to cycle through completions in minibuffer
;would like it to be TAB 
(load "cycle-mini")

;; key bindings

(global-set-key [?\C-^] 'delete-indentation)
(global-set-key [?\C-z] 'undo)
;(global-set-key [?\C-c?\C-a] 'apropos)
(global-set-key [?\C-c?l] 'goto-line)
(global-set-key [?\C-c?a] 'align)
(global-set-key [?\C-c?\C-r] 'repeat-matching-complex-command)
(global-set-key [?\C-c?c-n] 'next-tag)
(global-set-key [?\C-c?C-p] 'nt-ps-2up-print-buffer)
(global-set-key [M-delete] 'kill-word)
(define-key global-map [(f10)] 'gud-next) 
(define-key global-map [(f11)] 'gud-step)
(define-key global-map [(f12)] 'gud-print)

(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "Really kill Emacs? "))
	    kill-emacs-query-functions))


;; mouse

;(setq win32-swap-mouse-buttons t)


;; file handling

;; write-file-hooks 

(add-hook 'write-file-hooks 'time-stamp)


;; revert buffer no confirm

;function revert-buffer with no prompt to confirm
(defun revert-buffer-noconfirm () 
	"revert buffer with no confirm" 
	(interactive) 
	(revert-buffer t t)
	) 

(global-set-key [?\M-r] 'revert-buffer-noconfirm)
(put 'revert-buffer 'disabled nil)

;;swap caps
(defun toggle-char-case () 
  "Toggle the case of the character at point, and move forward to next
character. If the character is not a letter, move forward anyway"
  (interactive "*")
  (let* ((original (char-after))
	 (up-cased (upcase original))
         (down-cased (downcase original))
         (toggle-cased (if (equal up-cased original)
			   (if (not (equal down-cased up-cased))
			       down-cased)
			 up-cased)))
    (if toggle-cased
	(progn (delete-char 1)
	       (insert toggle-cased))
      (forward-char))
    )
  )


(global-set-key "\C-c\C-w" 'toggle-char-case)

;; session save
(require 'session)
(add-hook 'after-init-hook 'session-initialize)


;;recent files - done by session.el as well, can't have too much of a good thing
(require 'recentf)
(setq recentf-max-menu-items 35)

;; template

;;template stuff
(require 'template)
(template-initialize)


;; copyright

;;copyright
(add-hook 'write-file-hooks 'copyright-update)




;; major modes

;; TeX settings

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-electric-escape t)
;(setq default-tab-width 2)
;(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'tex-mode-hook 'auto-fill-mode)
(add-hook 'tex-mode-hook 'cite-it-mode)


;;auctex stuff
(require 'tex-site)

(setq tex-default-mode 'latex-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)


;; ange-ftp

(setq ange-ftp-tmp-name-template 
			(concat (expand-file-name (getenv "TEMP")) "/ange-ftp"))
(setq ange-ftp-gateway-tmp-name-template 
			(concat (expand-file-name (getenv "TEMP")) "/ange-ftp"))





;; dired
(eval-after-load
    "dired"
  '(define-key dired-mode-map "X" 'w32-shellex-dired-on-objects))



;;oo-browser for java/c++ ....
;(load "br-start")
;(global-set-key "\C-cb" 'oo-browser)
;(load "hmouse-tag")
;;psgml mode
;(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t )

;; c,cpp mode

;;c,cpp customisations

;(add-hook 'c-mode-hook 'abbrev-mode)


;;(setq dabbrev-case-fold-search nil)



;;use c++ mode for .c files
;;(setq auto-mode-alist (cons '("\\.c\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.h\\'" . c++-mode) auto-mode-alist))

(defun my-c-mode-common-hook ()
	;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
	(setq c-basic-offset 2)
	(c-set-offset 'substatement-open 0)
	(c-set-offset 'case-label '+)
	;;(define-key c-mode-mode-map [return] 'newline-and-indent)
	(auto-fill-mode)
	(setq indent-tabs-mode nil)
	(define-key c-mode-base-map "\C-m" 'newline-and-indent)
	(define-key c-mode-base-map [S-mouse-2] 'ffap-at-mouse)
	(define-key c++-mode-map "\C-c\C-v" 'compile)
	(c-toggle-auto-hungry-state 1)
	;;(local-set-key [return] 'newline-and-indent)
	;; other customizations can go here
	)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c++-mode-hook
	  (function
	   (lambda ()
	     (make-local-variable 'compile-command)
	     (setq compile-command
		   (concat "make -k "
			   (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".obj")))))

(load "cpp-tempo.el")


;; compilation
(setq compilation-ask-about-save nil)	;don't ask to save files - just do it

;; lispdir

(autoload 'format-lisp-code-directory "lispdir" nil t)
(autoload 'lisp-dir-apropos "lispdir" nil t)
(autoload 'lisp-dir-retrieve "lispdir" nil t)
(autoload 'lisp-dir-verify "lispdir" nil t)


;; html mode

;;html mode stuff


(defun my-html-mode-hook ()
	;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
	(setq fill-column 100)
	(setq html-helper-timestamp-hook 'html-custom-insert-timestamp)
	;; other customizations can go here
	)

(add-hook 'html-helper-mode-hook 'my-html-mode-hook)


(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html-ssi$" . html-helper-mode) auto-mode-alist))
(setq html-helper-do-write-file-hooks t)
(setq html-helper-build-new-buffer t)



;; htmlize

(require 'htmlize)


;;easy saving of source code to my website

(defvar www-root "//leeuwin/e/users/barney/www/" "root www site for save-source-to-www function")
(defvar dotfile-www-extension "txt" "default extension for dot files")
(defvar relative-www-dir nil "use this as a buffer-local way of a destination realtive to the root www dir")

(defun default-www-dir ()
  (concat (file-name-as-directory www-root)
	  (if relative-www-dir (file-name-as-directory relative-www-dir)))
  )

(defun save-source-to-www (destination) 
  "htmlize and copy current buffer to my www site using 'destination'
   dir" 
  (interactive (list (read-file-name "Where's it going? "  (default-www-dir) (default-www-dir))))
  (message "its going to %s" destination)
  (htmlize-file buffer-file-name destination)
  (copy-file buffer-file-name 
	     (concat
	      destination
	      (file-name-nondirectory buffer-file-name)
	      (if (eq (aref (file-name-nondirectory buffer-file-name) 0) ?\.) 
		  (concat "." dotfile-www-extension))
	      ) 
	     t
	     )
  )

(global-set-key [?\C-c?w] 'save-source-to-www)

;; woman

;;reading man pages
   (autoload 'woman "woman"
             "Decode and browse a UN*X man page." t)
   (autoload 'woman-find-file "woman"
             "Find, decode and browse a specific UN*X man-page file." t)
(define-key-after
  ;; Repeated calls do not seem to matter!
  (lookup-key global-map [menu-bar help-menu])
  [woman] '("WoMan..." . woman) 'man)


;; shell

;;bash setup
(defun my-shell-setup ()
	"For bash (cygwin 18) under Emacs 20"
	(setq comint-scroll-show-maximum-output 'this)
	(setq comint-completion-addsuffix t)
	(setq comint-process-echoes nil)
	(setq comint-eol-on-send t)
	(setq w32-quote-process-args ?\")
	(make-variable-buffer-local 'comint-completion-addsuffix))

(setq shell-mode-hook 'my-shell-setup)
(setenv "PID" nil)

(setq process-coding-system-alist (cons '("bash" . raw-text-unix)
																				process-coding-system-alist))

(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;(setq win32-quote-process-args ?\")
;(setq shell-command-switch "-c")
;(load "comint")
;(fset 'original-comint-exec-1 (symbol-function 'comint-exec-1))
;(defun comint-exec-1 (name buffer command switches)
;	(let ((binary-process-input t)
;				(binary-process-output nil))
;		(original-comint-exec-1 name buffer command switches)))

;(setq using-unix-filesystems t)
;(setq shell-file-name "bash")
;(setq shell-file-name "cmdproxy.exe")
;(setq explicit-shell-file-name "bash")
;(setq explicit-sh-args '("--login" "-i"))
;(setq ps-print-use-gs nil)

;(setq win32-quote-process-args t)
;(setq shell-command-switch "/c")




;;get rid of errors in shell mode
(add-hook 'sh-mode-hook
	  (defun my-sh-mode-hook-set-shell ()
	    ;; Use whatever shell is most appropriate -- it doesn't matter
	    ;; if the actual /bin/ksh file exists on the system or not
	    (sh-set-shell "/bin/sh")))


;; java

;;Java
;(require 'andersl-java-font-lock)
(require 'jde)

;;JDE add ons
; update package statements
(require 'jpack)
;;control flow templates
(load "jde-cflow")

;;document functions
(require 'jdok)

;;makefiles
;(require 'jmaker)

    
;; ispell

;;ispell stuff
;(add-hook text-mode-hook '(lambda ()
;												(local-set-key "\M-\t" 'ispell-complete-word)))
;(add-hook tex-mode-hook '(lambda ()
;											 (local-set-key "\M-\t" 'ispell-complete-word)))
;(add-hook latex-mode-hook '(lambda ()
;												 (local-set-key "\M-\t" 'ispell-complete-word)))

(setq ispell-enable-tex-parser t)


;; calendar

;;calendar
(setq european-calendar-style t)


;; mail

;;sending mail
(setq user-full-name "Barney Dalton")
(setq user-mail-address "barney@mech.uwa.edu.au")

(setq smtpmail-default-smtp-server "mail.mech.uwa.edu.au")
(setq smtpmail-local-domain nil)
(setq send-mail-function 'smtpmail-send-it)

(load-library "smtpmail")
(add-hook 'mail-setup-hook 'mail-abbrevs-setup)
(setq mail-self-blind t)


;; perl

;;PERL stuff
(setq auto-mode-alist (cons '("\\.pl\\'" . cperl-mode) auto-mode-alist))
(setq cperl-hairy t)
(defalias 'perl-mode 'cperl-mode)


;; calculator

;;calculator stuff
(autoload 'calculator "calculator"
	"A simple pocket calculator for Emacs." t)
(global-set-key [(control return)] 'calculator)


;; diary

;;diary
(add-hook 'diary-hook 'appt-make-list)
(diary 0)




;; minor modes

;; hideshow

(load-library "hideshow")
(defun my-hs-setup () "enables hideshow and binds some commands"
  (hs-minor-mode 1)
  (define-key hs-minor-mode-map "\C-c," 'hs-hide-block)
  (define-key hs-minor-mode-map "\C-c." 'hs-show-block)
  (hs-hide-all))
;(add-hook 'c-mode-hook 'my-hs-setup t)   ; other modes similarly



;; folding

;;folding mode
;; (setq fold-default-keys-function
;;      'fold-bind-backward-compatible-keys)

(load "folding")
;(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)

;(setq fold-default-mouse-keys-function 'my-fold-bind-mouse)
(add-hook 'folding-mode-hook 'my-fold-bind-keys)

(defun my-fold-bind-keys ()
	"My favourite fold key settings"
	;;  - I want the default ones, but I want fold-whole-buffer and
	;;    fold-open-buffer to be close together, instead of the
	;;    default
	;;  - read them all.
	;;
	;;(fold-default-keys)
	;;  - first disable old bind and define new one.
	;;
	(define-key folding-mode-map [?\C-c ?i] 'folding-shift-in)
	(define-key folding-mode-map [?\C-c ?o] 'folding-shift-out)
	(define-key folding-mode-map [?\C-c ?s] 'folding-show-current-entry)
	(define-key folding-mode-map [?\C-c ?h] 'folding-hide-current-entry)
	(define-key folding-mode-map [?\C-c ?f] 'folding-fold-region)
	)

(folding-add-to-marks-list 'jde-mode "// {{{ " "// }}}" nil t)


;; font lock

;;mode hooks
;(require (quote font-lock))
;(font-lock-use-default-colors)

;; Turn on font-lock in all modes that support it
(if (fboundp 'global-font-lock-mode)
		(global-font-lock-mode t)
)
;; Customize face attributes
;(setq font-lock-face-attributes
			;; Symbol-for-Face Foreground Background Bold Italic Underline
;			'((font-lock-comment-face       "DarkGreen")
;				(font-lock-string-face        "Sienna")
;				(font-lock-keyword-face       "RoyalBlue")
;				(font-lock-function-name-face "OrangeRed1")
;				(font-lock-variable-name-face "Black")
;				(font-lock-type-face          "Black")
;				(font-lock-reference-face     "Purple")
;				))

(set-face-foreground 'font-lock-function-name-face "OrangeRed1")
;(set-face-foreground 'highlight "OrangeRed1")
;(set-face-background 'highlight "OrangeRed1")


;; Maximum colors
;(setq font-lock-maximum-decoration t)


;; version control

;version control stuff
(setq vc-command-messages t)
(setq vc-consult-headers nil)
;(add-hook 'vc-checkout-writable-buffer-hook 'font-lock-fontify-buffer)
(setq vc-mistrust-permissions t)

(setq vc-keep-workfiles t)              ; make default to save workfiles
;;
;;  Make sure that VC also creates backups (if I make interim changes)
;;
(setq vc-make-backup-files t)


;; tempo

;;tempo stuff
(setq tempo-interactive t)

;;enable abbrev mode instead
;;setup tempo to complete on space
;(defun tempo-space (n)
;  "If there's a tempo completion Automatically complete on space, 
;otherwise insert a space as normal"
;  (interactive "p")
;  (if (tempo-expand-if-complete)
;      nil
;    (self-insert-command n)))

;(define-key global-map " " 'tempo-space) 


;; abbrev

;;abbrev mode stuff
(defun turn-on-abbrev-mode ()
	(abbrev-mode 1)
)

(add-hook 'find-file-hooks 'turn-on-abbrev-mode)
;;globalabbrevs is ~/lisp - contains the gpl
(load "globalabbrevs")
;(abbrev-mode 1)


;; word completion commented

;;word completion
;(load "completion")
;(initialize-completions)



;;parenthesis amtching
(if window-system
    (require 'mic-paren))
;; show-paren-mode

;(setq 'show-paren-style 'mixed)
;(setq show-paren-delay 1)
;show-paren-mode


;; elib
(setq load-path (cons (expand-file-name "~/lisp/elib") load-path))

;; pcl-cvs
;; don't forget to add the pcl-cvs directory to your load-path
(setq load-path (cons (expand-file-name "~/lisp/pcl-cvs") load-path))
(autoload 'cvs-update "pcl-cvs" "autoloaded pcl-cvs command" t)
(autoload 'cvs-examine "pcl-cvs" "autoloaded pcl-cvs command" t)
(autoload 'cvs-status "pcl-cvs" "autoloaded pcl-cvs command" t)
(autoload 'cvs-checkout "pcl-cvs" "autoloaded pcl-cvs command" t)
(autoload 'diff-mode "diff-mode" "autoloaded diff-mode command" t)

;; put this also if you feel like it
(setq completion-ignored-extensions (cons "CVS/" completion-ignored-extensions))

;; This works on Emacs-20.3 (and higher)
(condition-case nil
    (progn
      (require 'easymenu)
      (easy-menu-add-item
       nil '("tools")
       '("PCL CVS"
	 ["Update Directory"    cvs-update    t]
	 ["Examine Directory"   cvs-examine   t]
	 ["Status Directory"    cvs-status    t]
	 ["Checkout Module"     cvs-checkout  t]) "vc"))
  (error))

;; this is not strictly necessary, but adds a few goodies
(require 'pcl-cvs-hooks)





;; mode line

(setq line-number-mode t)

;;Time
(setq display-time-day-and-date t)
(display-time)


;; helper lisp

;; shellex
(require 'w32-shellex)


;;shellex stuff
(defvar shell-execute-helper "shelex.exe")
(defun shell-execute-url (url &optional new-window)
	"Invoke the shell-execute-helper program to call ShellExecute and launch
     or re-direct a web browser on the specified url."
	(interactive "sURL: ")
	(call-process shell-execute-helper nil nil nil url))

(setq browse-url-browser-function 'shell-execute-url)
(setq gnus-button-url 'shell-execute-url)               ; GNUS
(setq vm-url-browser 'shell-execute-url)                ; VM


;; cyclebuffer

;;cyclebuffer
(autoload 'cyclebuffer-forward "cyclebuffer" "cycle forward" t)
(autoload 'cyclebuffer-backward "cyclebuffer" "cycle backward" t)
(global-set-key "\M-N" 'cyclebuffer-forward)
(global-set-key "\M-P" 'cyclebuffer-backward)



(load "align-regexp")
(load "barney-timestamp")


;;align code
(load "align")
(setq align-c++-modes (cons 'jde-mode align-c++-modes))

;(setq align-mode-alist
;      (cons (cons 'jde-mode
;		  (copy-alist (cdr (assq 'java-mode
;					 align-mode-alist))))
;	    align-mode-alist))


;; commented code

;;auto insert
;; Auto-insert facility
;; from ~/elisp/autoinsert.el[c], modified from the distribution by
;; adding: (provide `autoinsert); the specified files are
;; automatically inserted upon creation of a file which name matches
;; the corresponding regex.
; (setq auto-insert-directory (expand-file-name "~/insert/"))
; (setq
;  auto-insert-alist
;  `(("\\(GNU\\)?[Mm]akefile$" . "GNUmakefile-insert") ; GNU Make file
;    ("\\.[Ff]90$" . "f90-insert.f90")           ; F90 code
;    ("\\.[Ff]\\([Cc][Mm]\\)?$" . "f77-insert.f"); F77 and CMF code
;    ("\\.c$" . "c-insert.c")                    ; C code
;    ("\\.csh$" . "csh-insert.csh")              ; C-shell script
;    ("\\.el$" . "elisp-insert.el")              ; Elisp code
;    ("\\.h$" . "h-insert.h")                    ; include file for C
;    ("\\.html$" . "html-insert.html")           ; HTML text
;    ("\\.job$" . "job-insert")                  ; NQS, DJM and DQS script
;    ("\\.man$" . "nroff-insert.man")            ; Nroff
;    ("\\.mk$" . "GNUmakefile-insert")           ; Make file
;    ("\\.perl$" . "perl-insert.perl")           ; Perl script
;    ("\\.pl$" . "perl-insert.pl")               ; Perl script
;    ("\\.sh$" . "sh-insert.sh")                 ; Bourne-shell script
;    ("\\.tex$" . "tex-insert.tex")              ; LaTeX and TeX
;    ("\\.txt$" . "text-insert.txt")             ; plain text
;    ))
; (load "autoinsert")

;; autoinsert.el setup
; (setq auto-insert-query nil)
; (setq auto-insert-directory "~/txt/")
; (defconst
;   auto-insert-alist                     ;replace with mine
;   '(("\\.sh"        . "label.csh")      ;; I do only csh ...
;     ("\\.awks$"     . "label.awk")      ;; .awks = awk shell executable
;     ("\\.c$"        . "label.c")
;     ("\\.cc$"       . "label.cc")
;     ("\\.h$"        . "label.h")
;     ("\\.pls$"      . "label.pls")      ;; perl exe
;     ("\\.pl$"       . "label.pl")       ;; perl library
;     ("\\.txt$"      . "label.txt")      
;     ("\\.el$"       . "label.el")       
;     ("\\.dbcrq$"    . "label.dbcrq")    ;; Database Change Request
;     ("\\.kom$"      . "label.kom")      ;; mml exe file
;     ("\\.mml$"      . "label.mml")      ;; mml exe file
;     ("\\.html?$"    . "label.html")
;     ("\\.makc$"     . "label.makc")     ;; uta C/C++
;     ("\\.make$"     . "label.make")     ;; exodus make
;     ("\\.sql$"      . "label.sql")
;     ("\\.e$"        . "label.e")        ;; exodus, GNU E language
;     ))


; (require 'tinylib)
; (require 'tinyreplace)

; (add-hook 'find-file-not-found-hooks 'my-auto-insert-template-fix)


; (defun my-auto-insert-template-fix ()
;   "Correct default templates after auto-insert"
;     (require 'tinyreplace)
;     (let* (
;            (folding-mode        nil)
;            (tire-:symmetry-rest t)
;            (tire-:symmetry      t)
;            name
;            )
;       ;; Right now correct only C++ .h files
;       ;;  #ifndef EXAMPLE_H
;       ;;  #define EXAMPLE_H
;       ;;  const char example_h_rcsid[] =""
;       ;;    ...
;       ;;  #endif EXAMPLE_H
;       ;;
;       (if-t (setq name (strmatget "^\\(.*\\)\\.h" 1 (buffer-name)))
;         (PMIN)
;         (tire-replace-region-1 (point-min) (point-max) "example" name  0)
;         (if (re-search-forward "insert your code" nil t)
;             (forward-line 1))
;         )))


;(define-skeleton foo-skel
;  "Insert a foo template."
;  "Class name: "
;  comment-start (format-time-string "%Y-%m-%d %H:%M") comment-end \n
;  "class "
;  str                                   ; class name goes here
;  \n)

;;printing from NT
;; ##################################################  NT - PS-Print

;(setq lpr-command "cp")
;(setq ps-lpr-command "cp")
;(setq lpr-destination '("/D:\\\\leeuwin\\mecha3a4")) ;; for normal printer
;(setq ps-lpr-destination '("\\\\leeuwin\\mecha3a4")) ;; for postscript printer

;(setq ps-print-use-gs t) ; t - use ghostscript, nil - do not
;(setq gs-print-command "c:\\gstools\\gs5.03\\gswin32.exe")
;(setq gs-print-switches '("-q -sDEVICE=ljet4 -r600 -dNOPAUSE"))
;(setq gs-view-command  "c:\\gstools\\gsview\\gsview32.exe")
;(setq ps-paper-type 'ps-a4) ; the type of paper (if needed)
;(setq  ps-psnup-command "psnup")
;(setq ps-psnup-switches '(" -l -pa4 -m.25in -2 "))
;(setq ps-psnup-buffer "c:\\tmp\\psnup.ps")
;(require  'print-nt)

;; (setq-default w32-print-use-faces nil
;;                 w32-print-paper-type 'letter
;;                 w32-print-lpr-destination "//janus/lq500"
;;                 w32-print-ps-destination "//janus/GhostScript"
;;                 w32-print-gs-destination "//janus/hp"
;;                 w32-print-gs-device "ljet4"
;;                 w32-print-gs-device-dpi '300
;;                 w32-print-gs-version "5.10"
;;                 w32-print-lpr-path "e:/gnu/emacs/site-bin")
;;                 w32-print-gs-path "e:/gnu/gs5.10"
;;                 w32-print-gs-view-path "e:/gun/gsview"
;;                 w32-print-psnup-path "e:/sdk/bin"
;(setq-default
; w32-print-paper-type 'a4
; w32-print-ps-destination "//leeuwin/ps172"
; w32-print-psnup-path "c:/bin"
; w32-print-lpr-path "c:/bin")
;(load "w32-print" 'noerror 'nomessage)


(custom-set-variables
 '(jde-run-option-properties (quote (("java.compiler" . "NONE"))))
 '(jde-compile-option-command-line-args "+E ")
 '(jde-compile-option-depend nil)
 '(jde-build-use-make t)
 '(jde-run-read-app-args t)
 '(jde-db-source-directories (quote ("d:/java/src")))
 '(jde-compiler "jikes")
 '(jde-db-read-app-args t))
(custom-set-faces
 '(custom-variable-tag-face ((t (:underline t :foreground "LightSlateBlue"))))
 '(cvs-filename-face ((t (:foreground "seagreen1"))))
 '(font-lock-comment-face ((t (:foreground "tomato"))))
 '(cvs-header-face ((t (:bold t :foreground "IndianRed2"))))
 '(cvs-action-face ((t (:foreground "SteelBlue2"))))
 '(custom-group-tag-face ((t (:underline t :foreground "blue violet"))))
 '(speedbar-directory-face ((t (:foreground "sienna2"))))
 '(diff-hunk-header-face ((((class color) (background light)) (:background "orange red"))))
 '(font-lock-keyword-face ((t (:foreground "medium Purple"))))
 '(widget-field-face ((t (:background "olivedrab4"))))
 '(widget-single-line-field-face ((t (:background "chartreuse4"))))
 '(font-lock-type-face ((t (:foreground "seagreen3"))))
 '(highlight ((t (:background "dark slate blue"))))
 '(show-paren-match-face ((((class color)) (:background "dark slate grey"))))
 '(diff-file-header-face ((((class color) (background light)) (:bold t :background "brown")))))



