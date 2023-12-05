;===================================================================
; Various Key Bindings (Global & Mode-Spefific)                    ;
;===================================================================
(global-set-key "\C-o"        'menu-bar-mode)
(global-set-key "\C-co"       'ff-find-other-file)
(global-unset-key "%")
(global-set-key "%"           'match-paren)
;(global-unset-key  "\C-x\C-c")   ;   'kill-screen)	
(global-set-key "\C-x\C-r"    'query-replace-regexp)
(global-set-key "\M-g"        'goto-line)
(global-set-key "\M-m"        'call-last-kbd-macro)
(global-set-key "\M-s"        'isearch-forward-regexp)
(global-set-key "\C-o"        'end-and-newline)
(global-set-key "\C-c\C-c"    'comment-region)
(global-set-key "\C-c\C-l"    'what-line)
(global-set-key "\C-c\C-k"    'delete-line)
(global-set-key "\C-c\C-v"    'cvs-update)
(global-set-key "\M-k"        'kill-rectangle)
(global-set-key [insert]      'overwrite-mode)
;(global-set-key "\M-b"        'flip-through-buffers-list)
(global-set-key "\C-cb"       'byte-compile-file)
(global-set-key "\C-c\C-f"    'grep)
(global-set-key [DELETE]         'backward-delete-char-untabify)
(global-set-key "\C-x\C-q"    'toggle-read-only)

;;
;; Function and Special Keys
;;

; No Workie with Cygwin (global-set-key [C-tab]       'other-window) ; SAME AS --> [F6]
;; (global-set-key (kbd "C-TAB") 'other-window)
;; (global-set-key [C-tab] 'other-window)
;; (global-set-key (kbd "<C-tab>") 'other-window)


; (global-set-key [C-S-tab]     'swbuff-switch-to-next-buffer)

(global-set-key [f3]          'toggle-hide-ifdef-mode)
(global-set-key [f4]          'toggle-ifdef-hiding)
(global-set-key [f5]          'compile)
(global-set-key [f7] 	      (lambda ()
				"Switch to previous buffer"
				(interactive)
				(switch-to-buffer (other-buffer))))
(global-set-key [f8]          'font-lock-fontify-buffer)
(global-set-key [f9]          'ediff-buffers)
;(global-set-key [f10]         'htmlize-buffer)
(global-set-key [f11]         'ps-print-region-with-faces)
(global-set-key [f12]         'gdb)

;; Shift + ____
(global-set-key [S-f5]        'shell)
(global-set-key [S-f8]        (lambda ()
				"Show COMPLETE LIST OF FONTS (at point)"
				(interactive)
				(insert (prin1-to-string (x-list-fonts "*")))))

;;
;; NEW : Added 10/19/99
;;
(global-set-key [M-button1]   'fume-mouse-function-goto)


;;
;; hide-if-def
;;
;(global-set-key [f3]          'toggle-hide-ifdef-mode)
;(global-set-key [f4]          'toggle-ifdef-hiding)
; 'hide-ifdefs) ;  or C-c @ h
; (global-set-key [S-f4]        'show-ifdefs) ;  or C-c @ s
; toggle read-only  (C-c @ C-q).
; define a symbol.   hide-ifdef-define (C-c @ d) 
; undefine a symbol. hide-ifdef-undef (C-c @ u) 
; You can call hide-ifdef-use-define-alist (C-c @ u) at any time to specify another list to use.



(global-set-key "\C-c\C-r" 'repeat-matching-complex-command)
(global-set-key "\C-c\C-n" 'next-tag)

(global-set-key "\C-j" 'kill-word) ; had been newline-and-indent
(define-key global-map [(f1)] 'gud-next) 
; (define-key global-map [(f2)] 'gud-step)
(define-key global-map [(f2)] 'recentf-open-files)



(global-set-key [(pause)] 'undo)
(define-key sqlplus-mode-map "\M-j" 'insert-sql-date)
(define-key sqlplus-mode-map "\M-J" 'insert-sql-date2)
(define-key sqlplus-mode-map "\M-h" 'insert-sql-date-today)


(define-key sql-mode-map "\M-j" 'insert-sql-date)



;; [1;5I
;; (window-system)

;; display-graphic-p