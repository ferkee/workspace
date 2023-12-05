;=================================================================
; Inhibit the f&*$%ng startup message                            ;
;=================================================================
(setq inhibit-startup-message t)

(setq bgcolor "moccasin")				 ;LightYellow
(setq fgcolor "black")
;===================================================================
; Specify the Default Base display settings (bg, fg, cursor, font) ;
;===================================================================
(setq initial-frame-alist 
      '((top . 15)  (left . 50)
        (width . 120) (height . 47)
	(cursor-color . "blue")
        (foreground-color . "black")
        (background-color . "moccasin")
	(modeline-color . "brown" )
	)
      )

(setq default-frame-alist
      '(
	(cursor-color . "blue")
	(background-mode . light)
	(cursor-type . box)
        (foreground-color . "black")
        (background-color . "moccasin")
		  (modeline-color . "brown" )
        (top . 15) (left . 100)
        (width . 120) (height . 47)
    ; fancy font below.
;  (font .  "-*-Courier New-normal-r-*-*-14-82-*-*-c-*-*-ansi-")
	(font .  "-*-Lucida Console-normal-r-*-*-12-82-*-*-c-*-*-ansi-")
	)
      )

;=================================================================
; Titlebar shows Filename preceded by its Path + (Current Mode)  ;
;=================================================================
(setq frame-title-format '(
			   (buffer-file-name "%f" 
					     (dired-directory dired-directory "%b"))
			   "....\(%m\)"
			   ))

;=================================================================
; Icon shows Current Filename only                               ;
;=================================================================
(setq frame-icon-title-format "%b")



;;;;=================================================================
;;;;          GLOBAL FONT-LOCK & FACE CUSTOMIZATIONS                ;
;;;;=================================================================
(cond ((fboundp 'global-font-lock-mode)
		 ;; Turn on font-lock in all modes that support it
		 (global-font-lock-mode t)
		 ;; Maximum colors
		 (setq font-lock-maximum-decoration t)))

(defun my-create-faces ()
  "create the necessary faces"
  (make-face 'font-lock-comment-face)
  (make-face 'font-lock-string-face) ;;; --> "In Quotes"
  (make-face 'font-lock-function-name-face) ;;; --> HTML: "<A HREF="
  (make-face 'font-lock-keyword-face)
  (make-face 'font-lock-type-face)
  (make-face 'font-lock-reference-face) ;;; --> #include
  (make-face 'font-lock-variable-name-face)
  (make-face 'font-lock-doc-string-face)
  )

(my-create-faces) ; you need to create them yourself




(defun jwf-set-faces ()
  (interactive)
  "set the foreground and background colors, etc. for normal black bkgd video"

  (set-face-background 'font-lock-type-face bgcolor)
  (set-face-foreground 'font-lock-type-face "lime green") ; int, char

  (set-face-background 'font-lock-comment-face bgcolor); LightPink
  (set-face-foreground 'font-lock-comment-face "Tomato2")


  (set-face-background 'font-lock-doc-string-face bgcolor)
  (set-face-foreground 'font-lock-doc-string-face "red2")

  (set-face-background 'font-lock-string-face bgcolor)
  (set-face-foreground 'font-lock-string-face "MediumSeagreen")

  (set-face-background 'font-lock-keyword-face bgcolor)
  (set-face-foreground 'font-lock-keyword-face "blue")

  (set-face-background 'font-lock-function-name-face bgcolor)
  (set-face-foreground 'font-lock-function-name-face "blue")

  (set-face-foreground 'font-lock-variable-name-face bgcolor)
  (set-face-foreground 'font-lock-variable-name-face "DarkViolet")

  (set-face-background 'highlight "Violet")
  (set-face-foreground 'highlight bgcolor)

;   (set-face-background 'primary-selection "PapayaWhip")
;   (set-face-foreground 'primary-selection "DimGray")

;   (set-face-background 'default bgcolor)
;   (set-face-foreground 'default fgcolor)

;   (set-face-background 'region "DarkGray")
;   (set-face-foreground 'region bgcolor)

;   (set-face-foreground 'font-lock-other-type-face "IndianRed1")

;   (set-face-background 'font-lock-preprocessor-face bgcolor)
;   (set-face-foreground 'font-lock-preprocessor-face "DarkSlateGray")

;   (set-face-background 'widget-field-face "gray44")
;   (set-face-foreground 'widget-field-face "yellow")
 
;   (set-face-foreground 'custom-state-face "aquamarine")

;   (set-face-foreground 'font-lc "aquamarine")
)

(jwf-set-faces)

