(menu-bar-mode nil)
;(tool-bar-mode nil)
(tooltip-mode t)


(setq mail-settings 0)
(add-hook 'write-file-hooks 'time-stamp)
;============================================================
; (1)           Initial Path settings, etc.                 ;
;============================================================
(setq load-path
   (nconc 
    '( 
      "~/site-lisp"
      "~/site-lisp/dmacro"
      "~/site-lisp/esheet"
      "~/site-lisp/dismal-1.4"
					;     "~/site-lisp/python"
					;     "~/site-lisp/session"
					;     "~/site-lisp/jde-2.1.3" 
					;     "~/site-lisp/cparse"
					;     "~/site-lisp/gnuserv"
					;     "~/site-lisp/vm-6.75"
					;     "~/site-lisp/eshell-2.1.2"
					;     "~/site-lisp/pcomplete-1.1.1"
					;     "~/site-lisp/w3-4.0pre.46/lisp"
					;     "~/site-lisp/desk-calendar-0.7"
					;     "~/site-lisp/sql-mode_2"
      ) 
    load-path))

;(add-to-list 'load-path "/home/jfierke/.emacs.d/cl-lib/")
;(require 'cl-lib)


;; Trying to get package manager to work with Emacs 23
;; (require 'package)
;; ;; Any add to list for package-archives (to add marmalade or melpa) goes here, e.g.:
;; (add-to-list 'package-archives 
;;     '("marmalade" .
;;       "https://marmalade-repo.org/packages/"))
;; (package-initialize)



   ;=================================================================
   ; PC Settings                                                    ;
   ;=================================================================

;   - Enables (C-)HOME, (C-)END
(load-library "pc-mode")
(pc-bindings-mode)

; ;   - Enables text highlighting
(load-library "pc-select")
(pc-selection-mode)


;============================================================
; (2)    Load ANY Pre-Startup Config Files (site-lisp)      ;
;============================================================

					;(load-library "my-dark-display")   
(load-library "my-display")		;load HOST-SPECIFIC display file
(load-library "my-modes")
(load-library "my-defuns")

;; COMMENT OUT htmlize
;; (load-library "htmlize")
					;(load-library "my-jde")
					;(load-library "my-java-imenu")
					;(load-library "untranslate")

					; (add-untranslated-filesystem "F:")
					; (add-untranslated-filesystem "P:")
;;
;============================================================
; (3)     Miscellaneous Settings, Preferences, etc          ;
;============================================================
; Disable the Menu Bar (speeds up display)
; (menu-bar-mode nil)

(when (featurep 'python) (unload-feature 'python t))

(autoload 'python-mode "python-mode" "Python editing mode." t)


; Set scroll-step to 1 to eliminate jump
(setq scroll-step 1)

;; Commented out Tab Stop info to fix Python Mode
;;
; (setq-default tab-width 3)
; (setq-default tab-stop-list
; 	      (list 3 6 9 12 15 18 21 24 27 30 33 
; 		    36 29 42 45 48 51 54 57 60 63
; 		    66 69 72 75 78 81 84 87 90 93 96))

; Don't make backup files before saving
;.....................................
(setq-default make-backup-files t)	;changed from nil on 03/01/2017 - just curious

;; Delete auto-save files when file is saved
;...........................................
(setq delete-auto-save-files t)



   ;=================================================================
   ; SHELL Stuff                                                    ;
   ;=================================================================

 (defun my-shell-setup ()
;;   "For bash (cygwin 18) under Emacs 20"
   (setq comint-scroll-show-maximum-output 'this)
   (setq comint-completion-addsuffix t)
;   (setq comint-process-echoes t)
;   (setq comint-eol-on-send t)
;   (setq w32-quote-process-args ?\")
   (make-variable-buffer-local 'comint-completion-addsuffix)
   )

; (setq process-coding-system-alist 
; 		(cons '("bash" . raw-text-unix)
; 				process-coding-system-alist)
; 		)

;;;;;; Commented out Jan. 30, 2001  (setq shell-mode-hook 'my-shell-setup)

; (setenv "PID" nil)

; ;; Added for new ftp.exe (per ~/bin/ftp.readme)
; (setq exec-path (cons (expand-file-name "~/bin") exec-path))

;;;
;;; Commented COMINT block Jan. 30, 2001...just to see what effect it has...
;;;
;   ;=================================================================
;   ; COMINT Stuff                                                   ;
;   ;=================================================================

;(load "comint")

;; How do I prevent ctrl-m's from being printed in the shell?
;; If you are getting ctrl-m's printed in the shell buffer, try adding the following to your startup file: 
;;
;; Also, try M-x dos2unix and M-x unix2dos (see my-defuns.el)
;;
;(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;(fset 'original-comint-exec-1 (symbol-function 'comint-exec-1))
;(defun comint-exec-1 (name buffer command switches)
;  (let ((binary-process-input t)
;		  (binary-process-output nil))
;    (original-comint-exec-1 name buffer command switches)))


   ;=================================================================
   ; ANGE-FTP Stuff                                                 ;
   ;=================================================================

;; As another alternative, you can tell ange-ftp exactly which ftp
;; program to use by customizing ange-ftp-ftp-program-name, e.g.:
;    (setq ange-ftp-ftp-program-name "c:/emacs/bin/ftp.exe")

;; You will also want to customize the temporary directory that ange-ftp
;; uses to cache files:
;    (setq ange-ftp-tmp-name-template 
;         (concat (expand-file-name (getenv "TEMP")) "/ange-ftp"))
;    (setq ange-ftp-gateway-tmp-name-template 
;         (concat (expand-file-name (getenv "TEMP")) "/ange-ftp"))


   ;=================================================================
   ; RECENT-FILES Stuff                                             ;
   ;=================================================================

;; Put this in your .emacs :
;;
;   (load "recent-files")
;   (recent-files-initialize)

;; If, like me, you don't want, in the recent file list, the directory opened
;; by dired, add this too :
(remove-hook 'dired-after-readin-hook
	     (function recent-files-find-and-write-file-hook))
;;
;; If, like me, you don't want, in the recent file list, the note files (or any
;; other files), add this and customize it to your wishes :
;    (setq recent-files-dont-include '("^/usr/personnel/fmi/NOTES" "^~/NOTES"))


   ;=================================================================
   ; 'CUSTOMIZE' Stuff                                              ;
   ;=================================================================

;(setq-default
; site-bin-path (expand-file-name (concat (getenv "emacs_dir") "/bin"))
; ange-ftp-ascii-hash-mark-size 4096
; ange-ftp-binary-hash-mark-size 4096
; ange-ftp-ftp-program-name (expand-file-name (concat site-bin-path "/ftp.exe"))
; ange-ftp-gateway-host '"janus"
; ange-ftp-generate-anonymous-password '"john.fierke@avnet.com"
; ange-ftp-local-host-regexp '"\\.\\(avnet\\|mtconsulting\\|mtc\\|spgs\\)\\.com$\\|^[^.]*$"
; ange-ftp-smart-gateway t
; ange-ftp-tmp-name-template (expand-file-name (concat (getenv "TEMP") "/ange-ftp-tmp."))
; ange-ftp-gateway-tmp-name-template (expand-file-name (concat (getenv "TEMP") "/ange-ftp-gtmp."))
; load-path (append (list (concat (getenv "emacs_dir") "/site-lisp")) load-path)
; )
 ; end of setq

; force loading of updated custom lib
(load "custom" 'noerror 'nomessage)

;;;;; Moved step 2 from here ;;;;;;;

;;;;; Moved step 3 from here ;;;;;;;

;============================================================
; (4)   Load ANY POST-Startup Config Files (site-lisp)      ;
;============================================================

(load-library "my-bindings")
(load-library "my-etc")
; (load-library "jde")


   ;============================================================
   ; (5)  EMAIL Settings                                       ;
   ;============================================================
   (load-library "my-mail")

   ;=================================================================
   ; SESSION Stuff                                                  ;
   ;=================================================================

;(require 'session)
;(add-hook 'after-init-hook 'session-initialize)

;;; (setq sqlplus-username-password "tecapps/tecapps")

; below - was: '(printer-name "172.18.72.242" t)
; (load-library "~/.customize")
(custom-set-variables
 '(cperl-auto-newline-after-colon t)
 '(printer-name "COLOR_4550")
 '(smtpmail-smtp-server "smtprelay.avnet.com")
 '(ps-default-fg (quote (0.0 0.0 0.0)))
 '(list-directory-verbose-switches "-lt")
 '(py-honor-comment-indentation nil)
 '(ps-printer-name "COLOR_4550")
 '(spell-command "ispell")
 '(mail-default-reply-to "013042@avnet.com")
 '(mail-host-address "____________MAIL.METRONET.COM____________")
 '(py-smart-indentation nil)
 '(lpr-switches (quote ("-P4050_1")))
 '(cperl-font-lock t)
 '(vc-initial-comment t)
 '(mail-signature t)
 '(htmlize-use-rgb-map (quote force))
 '(vc-command-messages t)
 '(emerge-rcs-co-program "cvs -Q co")
 '(ps-lpr-switches (quote ("-PHP_COLOR")))
 '(cperl-electric-keywords t)
 '(mail-personal-alias-file "~jfierke/.mailrc-PERSONAL")
 '(recentf-mode t nil (recentf))
 '(py-imenu-show-method-args-p t)
 '(archive-tmpdir "~/tmp/arc")
 '(cperl-hairy t)
 '(dired-listing-switches "-lat" t)
 '(diff-switches "-cw" t)
 '(lpr-command "/usr/ucb/lpr")
 '(cperl-extra-newline-before-brace t)
 '(auto-save-list-file-prefix "~/.saves/.saves-")
 '(compile-command "cl" t)
 '(ediff-keep-variants nil)
 '(inhibit-eol-conversion nil)
 '(cperl-extra-newline-before-brace-multiline t)
 '(user-mail-address "013042@avnet.com")
 '(ps-lpr-command "/usr/ucb/lpr")
 '(cperl-auto-newline t)
 '(partial-completion-mode t nil (complete))
 '(rec-files-max 20)
 '(vc-checkout-carefully t)
 '(user-full-name "Fierke, John"))
 ; Name that displays on summary

; (custom-set-faces
;  '(font-lock-comment-face ((t (:foreground "Tomato2" :background "LightYellow")))))
(custom-set-faces
 '(font-lock-comment-face ((t (:foreground "azure4"))))
 '(italic ((t (:bold t)))))

(server-start)

   ;=================================================================
   ; GNU-SERVER Stuff                                               ;
   ;=================================================================

					;(require 'gnuserv)
					;(gnuserv-start)
					;(setq gnuserv-frame (selected-frame))


;; HKCR.htmlfile.shell.edit.command: <No Name>: "C:\Program Files\Microsoft Office\Office\Winword.exe" /n

;(setq process-coding-system-alist
;		'(("cmdproxy" . (raw-text-dos . raw-text-dos))))


   ;=================================================================
   ; Printer Stuff                                                       ;
   ;=================================================================
(load-library "my-printer-stuff")

   ;=================================================================
   ; VM Stuff                                                       ;
   ;=================================================================

(load-library "my-vm")

;(defun dired-do-oggle ()
;  "Toggle marks.
;That is, currently marked files become unmarked and vice versa.
;Files marked with other flags (such as `D') are not affected.
;`.' and `..' are never toggled.
;As always, hidden subdirs are not affected."
;  (interactive)
;  (save-excursion
;    (goto-char (point-min))
;    (let (buffer-read-only)
;      (while (not (eobp))
;        (or (dired-between-files)
;            (looking-at dired-re-dot)
;            ;; use subst instead of insdel because it does not move
;            ;; the gap and thus should be faster and because
;            ;; other characters are left alone automatically
;            (apply 'subst-char-in-region
;                   (point) (1+ (point))
;                   (if (eq ?\040 (following-char)) ; SPC
;                       (list ?\040 dired-marker-char)
;                     (list dired-marker-char ?\040))))
;        (forward-line 1)))))

   ;=================================================================
   ; SPEEDBAR                                                       ;
   ;=================================================================

;(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)

;(define-key-after (lookup-key global-map [menu-bar tools])
;  [speedbar] '("Speedbar" . speedbar-frame-mode) [calendar])

;(fset 'fix-includes
;   [?\C-s ?# ?i ?n ?c ?l ?u ?d ?e ?\C-m C-right C-left ?" escape ?l ?/ delete escape ?l ?\C-  ?\C-s ?/ ?\C-m left ?\C-x ?\C-x ?\C-w right end home down])
;;"
	  
;   [?\C-s ?# ?i ?n ?c ?l ?u ?d ?e ?\C-m C-right C-left ?" escape ?l ?/ delete escape ?l ?\C-  ?\C-s ?/ ?\C-m left ?\C-x ?\C-x ?\C-w right end home down])
;;   '(("\\.cc$"  cc-function)
;;     ("\\.hh$"  hh-function))

(fset 'fix-include
   [?\C-s ?_ ?P ?A ?T ?H ?\C-m end S-left escape ?w ?\C-r ?_ ?P ?A ?T ?H ?\C-m C-S-right delete C-left backspace ?\\ backspace ?/ C-left ?\C-y escape ?l escape ?l down home])

; (fset 'rgb
;    [?\C-s ?  ?c ?o ?l ?o ?r ?= ?\" ?# ?\C-m ?\C-s ?< ?b ?> ?\C-m C-S-right escape ?w ?\C-s ?" ?# ?" ?\C-m left ?\C-y ?\C-r ?< ?b ?> ?\C-m C-left left C-S-right escape ?w ?\C-s ?o ?n ?c ?l ?i C-left C-left C-right ?. ?\C-y down home])

(require 'swbuff)

(require 'recentf)
(recentf-mode 1)

;(setq talk-legal-multiuser-functions 
;      '(("Talk Tac Toe"  talk-tac-toe) ("Hangman" hangman) 
;	("Drop 4" drop4) ("Word Thing" word-thing) ("Go Fish" gofish)
;	("4 by 4" 4-by-4) ("Dots" dots) ("Battle ship" battleship)
;	("Checkers" checkers) ("Reversi" reversi) ("Ataxx" ataxx)
;	("Chinese Checkers" china-check) ("Order and Chaos" order-chaos))
;      )



(message (format "Hello %s" "John"))

(setq icomplete-mode 1)
(require 'rec-files)

; (load "align")
; (require 'align)
; (global-set-key "\M-[" 'align)


(font-lock-add-keywords
 'c-mode
 '(("\\<\\(FIXME\\)" 1 font-lock-warning-face t)))
(modify-face (quote font-lock-warning-face) "Red" "yellow" nil t nil t nil nil)


;; turn on font lock with maximum decoration
; (global-font-lock-mode t)
;(setq font-lock-maximum-decoration t)

(require 'font-lock)

;;
;; create a face for function calls
;;
(defface font-lock-regular-function-call-face
  '((t (:foreground "Magenta")))
  "Font Lock mode face used to highlight function calls."
  :group 'font-lock-highlighting-faces)

(defvar font-lock-regular-function-call-face 'font-lock-regular-function-call-face)

;;
;; create a face for ASRS Notifications 
;;
(defface font-lock-ASRS-notification-function-call-face
  '((t (:foreground "MediumOrchid4")))
  "Font Lock mode face used to highlight ASRS Notification function calls."
  :group 'font-lock-highlighting-faces)

(defvar font-lock-ASRS-notification-function-call-face 'font-lock-ASRS-notification-function-call-face)

;;
;; create a face for ASRS Critical Functions 
;;
(defface font-lock-ASRS-critical-function-call-face
  '((t (:foreground "Blue2")))
  "Font Lock mode face used to highlight ASRS critical function calls."
  :group 'font-lock-highlighting-faces)

(defvar font-lock-ASRS-critical-function-call-face 'font-lock-ASRS-critical-function-call-face)

;;
;; create a face for ASRS General Input/Output
;;
(defface font-lock-ASRS-IO-function-call-face
  '((t (:foreground "DarkKhaki")))
  "Font Lock mode face used to highlight ASRS Notification function calls."
  :group 'font-lock-highlighting-faces)

(defvar font-lock-ASRS-IO-function-call-face 'font-lock-ASRS-IO-function-call-face)

;; add it to the font lock tables
(add-hook 'c-mode-hook
   (lambda ()
     (font-lock-add-keywords
      nil
      '(
	("\\<\\(\\sw+\\)("                                  
	 1 font-lock-regular-function-call-face)

	("\\<\\(disp_txt\\|disp_err\\|disp_wrn\\|displ_wrn\\|displ_err\\|displ_text\\|displ_txt\\|log_msg2\\|ss_log\\) (" 
	 1 font-lock-ASRS-notification-function-call-face)

	("\\<\\(terminate\\|exit\\) (" 
	 1 font-lock-ASRS-critical-function-call-face)

	("\\<\\(ays\\|dispscrn\\|enter_key\\|getall\\|getinp\\|putout\\|sleep\\|print_text\\|sleep\\|field_set\\|fld_set_next\\|del_last_fld\\) (" 
	 1 font-lock-ASRS-IO-function-call-face)

	) nil)))

(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))


(fset 'cop_screen
   [escape ?x ?r ?e ?p ?l tab ?s tab return ?q return ?- return C-home C-insert escape ?x ?r ?e ?p ?l tab ?s tab return ?l ?- return ?- ?- return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?- ?k return ?- ?- return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?x ?  backspace backspace ?x return ?| return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?t ?- return ?- ?- return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?- ?w ?- return ?- ?- ?- return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?- ?n ?- return ?- ?- ?- return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?m ?- return ?- ?- return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?v backspace ?- ?v ?- return ?- ?- ?- return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?- ?u return ?- ?- return C-home escape ?x ?r ?e ?p ?l tab ?s tab return ?- ?j return ?- ?- return C-home])

; (global-set-key "\M-c" 'cop_screen)

(fset 'sso-sort
   [escape ?6 ?\C-x ?f escape ?q end left ?\C-  C-end up end ?  ?\C-x ?\C-x escape ?k ?\C-_ home ?\C-x ?r ?y ?\C-x ?\C-x C-S-down escape ?x ?s ?o ?r tab ?l tab return C-up down ?\C-  C-down up right right ?\C-x ?\C-x escape ?k ?\C-0 ?\C-l])

(fset 'terminal-sort
   [escape ?8 ?\C-x ?f escape ?q end left ?\C-  C-end up end ?  ?\C-x ?\C-x escape ?k ?\C-_ home ?\C-x ?r ?y down C-S-up S-down escape ?x ?s ?o ?r tab ?l tab return ?\C-  C-end up right right ?\C-x ?\C-x escape ?k C-end C-home C-end C-up down ?\C-0 ?\C-l])

(save-excursion 
  (set-buffer "*scratch*") 
  (setq buffer-file-name "~/*scratch*")) 

(fset 'format-dss
   [?\C-s ?q ?q ?q ?q home S-end ?\C-w C-end return return ?\C-y home escape ?x ?r ?e ?p ?l tab ?r tab return ?[ ?a ?- ?z ?] return ?- return S-home ?\C-w C-up ?\C-y left left left left left left left left left left left left left left left left left left left left left left left left left left left left left left left left left delete ?| up left ?\C-  C-end C-left C-left right ?\C-x ?\C-x escape ?k down end up left ?\C-  C-end C-left C-right ?\C-x ?\C-x escape ?k down C-home down down down ?\C-s ?: ?\C-s C-left ?\C-  C-end C-left end ?\C-x ?\C-x escape ?k C-end ?\C-x ?r ?y ?\C-x ?\C-x ?\C-x ?\C-x ?\C-  C-up C-up down down down ?\C-x ?\C-x escape ?x ?s ?o ?r tab ?l tab return C-up C-S-up C-S-down delete C-end])


;; (setq select-enable-primary t)
;; (setq select-enable-clipboard t)
;; (setq save-interprogram-paste-before-kill t)

(setq select-enable-primary t)
(setq select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)


(setq vc-command-messages t)		;displays svn commands used 

(require 'ediff)

(defun ediff-current-buffer-revision () 
  "Run Ediff to diff current buffer's file against VC depot. 
Uses `vc.el' or `rcs.el' depending on `ediff-version-control-package'." 
  (interactive) 
  (let ((file (or (buffer-file-name) 
          (error "Current buffer is not visiting a file")))) 
(if (and (buffer-modified-p) 
     (y-or-n-p (message "Buffer %s is modified. Save buffer? " 
                (buffer-name)))) 
    (save-buffer (current-buffer))) 

(ediff-load-version-control) 
(funcall 
 (intern (format "ediff-%S-internal" ediff-version-control-package)) 
 "" "" nil))) 


(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'ediff-current-buffer-revision)) 



(defalias 'list-buffers 'ibuffer) ; always use ibuffer

; M-[ 1 ; 5 i (translated from M-[ 1 ; 5 I) is undefined
; GNU Emacs 23.1.1 (x86_64-redhat-linux-gnu, GTK+ Version 2.18.9) of 2013-05-07 on evlasrss

;Desktop 
(load "desktop")
(desktop-load-default)
; (desktop-read)
;(desktop-save-mode 1)
;(setq desktop-auto-save-timeout 90)

;; Automatically save and restore sessions
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   30)
(desktop-save-mode 1)



; (define-key local-function-key-map "\033[1;5 i" [Z])


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-current-diff-A ((t (:background "color-240"))))
 '(ediff-current-diff-B ((t (:background "color-240"))))
 '(ediff-fine-diff-A ((t (:background "color-214" :foreground "black"))))
 '(ediff-fine-diff-B ((t (:background "color-83" :foreground "black"))))
 '(ediff-even-diff-A ((t (:background "color-238" :foreground "color-39")))) ; turquoise-on-gray
 '(ediff-even-diff-B ((t (:background "color-238" :foreground "color-205")))) ; salmon-on-gray
 '(ediff-odd-diff-A ((t (:background "color-238" :foreground "color-39")))) ; turquoise-on-gray
 '(ediff-odd-diff-B ((t (:background "color-238" :foreground "color-205")))) ; salmon-on-gray
)
