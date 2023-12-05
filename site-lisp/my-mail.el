;; ~/site-lisp/my-mail.el

   ;============================================================
   ; (5)  EMAIL Settings                                       ;
   ;============================================================

;(if (>= mail-settings 1)
;    (
     (setq send-mail-function 'smtpmail-send-it)
     (setq smtpmail-default-smtp-server "smtprelay.avnet.com")
     (setq smtpmail-smtp-service "smtp")
     (setq smtpmail-local-domain "avnet.com")
     (setq smtpmail-debug-info t)
     (load-library "smtpmail")
     (setq smtpmail-code-conv-from nil)
     (setq user-full-name "John X. Fierke")

; To queue mail, set smtpmail-queue-mail to t and use 
; smtpmail-send-queued-mail to send.
;(setq smtpmail-queue-mail nil)


   ; USER

 (setq user-full-name "Your Nextel Buddy Service")
 (setq user-mail-address "Michael.Daniels@Avnet.com")
 (setq mail-default-reply-to "Michael.Daniels@Avnet.com")

; (setq mail-default-reply-to "ferkee@metronet.com")
; (setq user-full-name "Regina Miller")
; (setq user-mail-address "regmil@swbell.net")

; (setq mail-host-address "zed")

     (setq mail-alias-file "~jfierke/.mailrc")
     (setq mail-aliases t)

   ; SERVER
;;; (setq smtpmail-default-smtp-server "smtprelay.avnet.com")
;;; (setq smtpmail-default-smtp-server "smtp.metronet.com")
;;; (setq smtpmail-default-smtp-server "AMER50.AVNET.COM")

;;; (setenv "MAILHOST" "AMER50.AVNET.COM")
;;; (setenv "MAILHOST" "mail.metronet.com")
;;; (setenv "MAILHOST" "mail.swbell.net")
     (setq rmail-primary-inbox-list '("po:Your login") rmail-pop-password-required t)
     
     (add-hook 'mail-setup-hook 'mail-abbrevs-setup)

; (defvar mail-abbrevs-loaded nil)
; (defvar mail-mode-map nil)
     (setq mail-default-headers "CC:\n")
     (setq mail-default-headers nil)
;     )
;  (message "NOT loading My Mail Settings")
;  )
