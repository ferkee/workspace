;******************************************************************************
; Special personal work-arounds (orig. afc)
;******************************************************************************
(setq case-replace nil) ; don't replace case

;; When running ispell, consider all 1-3 character words as correct.
(setq ispell-extra-args '("-W" "3"))

;; default to visible bell
;.........................
(setq-default visible-bell t)

; Turn ON Column Numbers
;.......................
(column-number-mode t)

;Non-nil means to highlight words during query replacement.
(setq query-replace-highlight  t)

(setq mouse-yank-at-point t)

; non-nil will also display the day, month and date in addition to the time
(setq display-time-day-and-date t)
(display-time)
(load "find-func")

;(autoload 'follow-mode "follow"
;    "Synchronize windows showing the same buffer, minor mode." t)

; (require 'w3-auto)


;; Below is from TPD lisp files
;; ..............................

; Better buffer menus
;......................
(require 'msb)
;(setq msb-menu-cond (cons '((eq major-mode 'jde-mode) 3019 "Java Files (%d)") msb-menu-cond))
(put 'narrow-to-region 'disabled nil)

(setq default-major-mode 'text-mode)


;(autoload 'sm-manual-entry "superman" "Better manual stuff" t)
(line-number-mode 1)			; turn on the line number
;(require 'completer)			; see f-l-f-b as font-lock-fontify-buffer
(setq teach-extended-commands-p t)
(load "icomplete")
(setq icomplete-mode nil) ; Disable until later

;; Commented on 08/29/01 (caused problems)
;(load "completion")
;(PC-mode t)
;(initialize-completions)

; Align assignment statements in Region
;.......................................
(load "align-eq")

;(autoload 'live-find-file "live" "View a file with \"tail -f\"" t)

(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "Really kill Emacs? "))
	    kill-emacs-query-functions))

;; EDIFF Mods
;; only hilight current diff:
(setq-default ediff-highlight-all-diffs 'nil)
