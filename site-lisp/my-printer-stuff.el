;; ~/site-lisp/my-printer-stuff.el


; (setq lpr-command "C:\\WINNT\\system32\\notepad.exe")  ;; Use NOTEPAD as print tool
	 ;   (setq lpr-destination '("/p"))  ;; PFE print only
;(setq ps-print-use-gs nil)      ;; do not use ghostscript 
;(require 'print-nt)

;;  if you use print.exe command (The UNC style location for regular print jobs):
;;  Remember to escape the backslashes for emacs and your shell.
;;  (If you use cmdproxy.exe (see "C-h v shell-file-name") do '\\' for each '\' and for
;;    most Unix shells (like tcsh) do '\\\\' for each '\' (you may have up to 8 '\'!)) 
;;  (setq lpr-command "print")
;;  (setq lpr-destination '("/D:\\\\host\\share-name")) ;; for normal printer
;;  (setq ps-lpr-destination '("/D:\\\\host\\share-name")) ;; for postscript printer
;;
;;  (setq ps-print-use-gs t) ; t - use ghostscript, nil - do not
;;  (setq gs-print-command "c:\\gs\\gswin32.exe")
;;  (setq gs-print-switches '("-q -sDEVICE=ljet4 -r600 -dNOPAUSE"))
;;  (setq gs-view-command  "c:\\gs\\gsview\\gsview32.exe")
;;  (if (<= emacs-major-version 19)	; set the type of paper
;;    (setq ps-paper-type 'ps-a4 )	; for emacs < 20.x
;;    (setq ps-paper-type 'a4 ))	; for emacs since 20.x
;;  (require  'print-nt)
;;
;;  if you use lpr.exe command, replace the following commands above:
;;
(setq lpr-command "lpr")
;(setq lpr-destination '("-S host -P share-name"))  ;; for normal printer
;(setq ps-lpr-destination '("-S host -P share-name")) ;; for postscript printer
