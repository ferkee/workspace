;=================================================================
; Inhibit the f&*$%ng startup message                            ;
;=================================================================
(setq inhibit-startup-message t)

;===================================================================
; Specify the Default Base display settings (bg, fg, cursor, font) ;
;===================================================================
(setq initial-frame-alist 
      '((top . 15)  (left . 50)
        (width . 120) (height . 47)
	(cursor-color . "blue")
        (foreground-color . "white")
        (background-color . "black")
	(modeline-color . "yellow" )
	)
      )

(setq default-frame-alist
      '(
	(cursor-color . "yellow")
	(background-mode . light)
	(cursor-type . box)
        (foreground-color . "white")
        (background-color . "black")
	(modeline-color . "yellow" )
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


;;..........................................................................
;; The above code uses the default faces for decoration. If you would 
;; like to customize the attributes of the faces, you can use the following 
;; startup code to get started:
;;..........................................................................
;(cond ((fboundp 'global-font-lock-mode)
;;       ;; Turn on font-lock in all modes that support it
;       (global-font-lock-mode t)
;;       ;; Maximum colors
;       (setq font-lock-maximum-decoration t)
;;       ;; Customize face attributes
;       (setq font-lock-face-attributes
;;	     ;; Symbol-for-Face Foreground Background Bold Italic Underline
;	     '((font-lock-comment-face       "Gray")
;	       (font-lock-string-face        "Wheat")
;	       (font-lock-keyword-face       "Yellow")
;	       (font-lock-function-name-face "Orange")
;	       (font-lock-variable-name-face "LightGreen")
;	       (font-lock-type-face          "SandyBrown") ;AquaMarine
;	       (font-lock-reference-face     "DeepSkyBlue")))
;;       ;; Create the faces from the attributes
;       (font-lock-make-faces))
;      )

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


(setq bgcolor "wheat1")
(setq fgcolor "black")

(defun jwf-set-faces ()
  (interactive)
  "set the foreground and background colors, etc. for normal black bkgd video"
;   (set-face-background 'default bgcolor)
;   (set-face-foreground 'default fgcolor)

;   (set-face-background 'region "DarkGray")
;   (set-face-foreground 'region bgcolor)

;  (set-face-background 'font-lock-type-face bgcolor)
  (set-face-foreground 'font-lock-type-face "lime green")

;  (set-face-foreground 'font-lock-other-type-face "IndianRed1")

;   (set-face-background 'font-lock-preprocessor-face bgcolor)
;   (set-face-foreground 'font-lock-preprocessor-face "DarkSlateGray")

  (set-face-background 'font-lock-comment-face bgcolor)
  (set-face-foreground 'font-lock-comment-face "gray"); LightPink
  
;   (set-face-background 'widget-field-face "gray44")
;   (set-face-foreground 'widget-field-face "yellow")

;  (set-face-foreground 'custom-state-face "aquamarine")

;   (set-face-foreground 'font-lc "aquamarine")
  
  (set-face-background 'font-lock-doc-string-face bgcolor)
  (set-face-foreground 'font-lock-doc-string-face "Salmon")

  (set-face-background 'font-lock-string-face bgcolor)
  (set-face-foreground 'font-lock-string-face "PaleVioletRed1")

  (set-face-background 'font-lock-keyword-face bgcolor)
  (set-face-foreground 'font-lock-keyword-face "Plum")

  (set-face-background 'font-lock-function-name-face bgcolor)
  (set-face-foreground 'font-lock-function-name-face "Orange")

  (set-face-foreground 'font-lock-variable-name-face "AquaMarine")

  (set-face-background 'highlight "Violet")
  (set-face-foreground 'highlight bgcolor)

;   (set-face-background 'primary-selection "PapayaWhip")
;   (set-face-foreground 'primary-selection "DimGray")
)

(jwf-set-faces)

;;; Font Faces
;                            bold
;                     bold-italic
;              custom-button-face
;             custom-changed-face
;       custom-documentation-face
;            custom-face-tag-face
;           custom-group-tag-face
;         custom-group-tag-face-1
;             custom-invalid-face
;            custom-modified-face
;               custom-rogue-face
;               custom-saved-face
;                 custom-set-face
;               custom-state-face
;     custom-variable-button-face
;        custom-variable-tag-face
;                         default
;          font-lock-builtin-face
;          font-lock-comment-face
;         font-lock-constant-face
;       font-lock-doc-string-face
;       font-lock-emphasized-face
;    font-lock-function-name-face
;          font-lock-keyword-face
; font-lock-other-emphasized-face
;       font-lock-other-type-face
;        font-lock-reference-face
;           font-lock-string-face
;             font-lock-type-face
;    font-lock-variable-name-face
;          font-lock-warning-face
;                       highlight
;                          italic
;             makefile-space-face
;         message-cited-text-face
;          message-header-cc-face
;        message-header-name-face
;  message-header-newsgroups-face
;       message-header-other-face
;     message-header-subject-face
;          message-header-to-face
;     message-header-xheader-face
;          message-separator-face
;                        modeline
;                          region
;             secondary-selection
;            speedbar-button-face
;         speedbar-directory-face
;              speedbar-file-face
;         speedbar-highlight-face
;          speedbar-selected-face
;               speedbar-tag-face
;                       underline
;              widget-button-face
;      widget-button-pressed-face
;       widget-documentation-face
;               widget-field-face
;            widget-inactive-face
;   widget-single-line-field-face

