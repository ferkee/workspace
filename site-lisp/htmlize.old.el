;; htmlize.el -- HTML-ize font-lock buffers

;; Copyright (C) 1997,1998 Hrvoje Niksic

;; Author: Hrvoje Niksic <hniksic@srce.hr>
;; Keywords: hypermedia, extensions

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This package will HTML-ize your buffers, analyzing the text
;; properties and transforming them to HTML.  Mail to
;; <hniksic@srce.hr> to discuss features and additions.  All
;; suggestions are more than welcome.

;; To use, just switch to a buffer you want HTML-ized, and type `M-x
;; htmlize-buffer'.  After that, you should find yourself in an HTML
;; buffer, which you can save.  Alternatively, `M-x htmlize-file' will
;; find a file, font-lockify the buffer, and save the HTML version,
;; all before you blink.  Even more alternatively, `M-x
;; htmlize-many-files' will prompt you for a slew of files to undergo
;; the same treatment.  `M-x htmlize-many-files-dired' will do the
;; same for the files marked by dired.

;; The code attempts to generate compliant HTML, but I can't make any
;; guarantees; I haven't yet bothered to run the generated markup
;; through a validator.  I tried to make the package elisp-compatible
;; with multiple Emacsen, specifically aiming for XEmacs 19.14+ and
;; GNU Emacs 19.34+.  Please let me know if it doesn't work on any of
;; those, and I'll try to fix it.  I relied heavily on the presence of
;; CL extensions, especially for compatibility; please don't try to
;; remove that dependency.

;; When compiling under GNU Emacs, you're likely to get oodles of
;; warnings; ignore them all.  For any of this to work, you need to
;; run Emacs under a window-system -- anything else will almost
;; certainly fail.

;; The latest version should be available at:
;;
;;        <URL:http://jagor.srce.hr/~hniksic/htmlize.el>
;;

;; Thanks go to:
;;   * Ron Gut <rgut@aware.com>, for useful additions (hooks and
;;     stuff);
;;
;;   * Bob Weiner <weiner@altrasoft.com>, for neat ideas (use of
;;     rgb.txt and caching color strings);
;;
;;   * Toni Drabik <tdrabik@public.srce.hr>, for a crash course to
;;     CSS1.
;;
;;   * Peter Breton <pbreton@ne.mediaone.net>, for useful suggestions
;;     (multiple file stuff) and dired code.
;;
;;   * Thomas Vogels <tov@ece.cmu.edu>, for contributing a fix.
;;
;;   * A bunch of other people for sending reports.
;;

;; TODO: Should attempt to merge faces (utilize CSS for this?).
;; Should recognize all extents under XEmacs, not just text
;; properties.  Should recognize overlays under FSF Emacs.  Should
;; ignore invisible text.  Should expand TABs.

;; User quotes: "You sir, are a sick, sick, _sick_ person. :)"
;;                  -- Bill Perry, author of Emacs/W3


;;; Code:

(require 'cl)
(eval-when-compile
  (if (string-match "XEmacs" emacs-version)
      (byte-compiler-options
	(warnings (- unresolved))))
  (defvar font-lock-auto-fontify)
  (defvar global-font-lock-mode))

(defconst htmlize-version "0.48")

;; Incantations to make custom stuff work without customize, e.g. on
;; XEmacs 19.14 or GNU Emacs 19.34.
(eval-and-compile
  (condition-case ()
      (require 'custom)
    (error nil))
  (if (and (featurep 'custom) (fboundp 'custom-declare-variable))
      nil ;; We've got what we needed
    ;; We have the old custom-library, hack around it!
    (defmacro defgroup (&rest args)
      nil)
    (defmacro defcustom (var value doc &rest args) 
      (` (defvar (, var) (, value) (, doc))))
    (defmacro defface (face value doc &rest stuff)
      `(make-face ,face))))

(defgroup htmlize nil
  "HTMLize font-locked buffers."
  :group 'hypermedia)

(defcustom htmlize-head-tags ""
  "*Additional tags to insert within HEAD of the generated document."
  :type 'string
  :group 'htmlize)

(defcustom htmlize-output-type 'css
  "*Output type of generated HTML.  Legal values are `css' and `font'.
When set to `css' (the default), htmlize will generate a style sheet
with description of faces, and use it in the HTML document, specifying
the faces in the actual text with <span class=\"FACE\">.

When set to `font', the properties will be set using layout tags
<font>, <b>, <i>, <u>, and <strike>."
  :type '(choice (const css) (const font))
  :group 'htmlize)

(defcustom htmlize-use-rgb-map t
  "*Controls when `rgb.txt' should be looked up for color values.

When set to t (the default), htmlize will, when running under an X
display, look for the `rgb.txt' file and use it to obtain the RGB
values for named colors.  This is useful when the values reported by
`color-instance-rgb-components'/`x-color-values' are incorrect because
of color approximation.

When set to nil, htmlize will never look for `rgb.txt' and will always
use the values Emacs returns.

When set to `force', htmlize will try to look for `rgb.txt' even on
non-X devices."
  :type '(choice (const :tag "When Appropriate" t)
		 (const :tag "Never"          nil)
		 (const :tag "Always"       force))
  :group 'htmlize)

(defvar htmlize-before-hook nil
  "Hook run before htmlizing a buffer.
The hook is run in the original buffer (not HTML buffer), so you may
wish to add `font-lock-fontify-buffer' here.")

(defvar htmlize-after-hook nil
  "Hook run after htmlizing a buffer.
Unlike `htmlize-before-hook', these functions are run in the HTML
buffer.  You may use them to modify the outlook of the final HTML
output.")

(defvar htmlize-file-hook nil
  "Hook run after htmlizing a file, and before writing it out to disk.
This is run by the `htmlize-file'.")

;; I try to conditionalize on features rather than Emacs version, but
;; in some cases checking against the version *is* necessary.
(defconst htmlize-running-xemacs (string-match "XEmacs" emacs-version))


;;; Protection of HTML strings.

(defvar htmlize-character-table
  (let ((table (make-vector 256 ?\0)))
    (dotimes (i 256)
      (setf (aref table i) (char-to-string i)))
    (setf (aref table ?&) "&amp;"
	  (aref table ?<) "&lt;"
	  (aref table ?>) "&gt;"
	  (aref table ?\") "&quot;")
    table))

(defun htmlize-protect-string (string)
  ;; Checking whether STRING contains dangerous stuff removes a lot of
  ;; unnecessary consing.
  (if (not (string-match "[&<>\"]" string))
      string
    (mapconcat (lambda (char)
		 (aref htmlize-character-table char))
	       string "")))

;; Currently unused.
;(defun htmlize-protect-region (start end)
;  (goto-char start)
;  (let (match replacement)
;    (while (re-search-forward "[&<>\"]" end t)
;      (setq match (char-after (1- (point)))
;	    replacement (aref htmlize-character-table match))
;      (delete-region (1- (point)) (point))
;      (insert replacement)
;      (incf end (1- (length replacement)))))
;  (goto-char end))

;;; Color handling.

(if (fboundp 'locate-file)
    (defalias 'htmlize-locate-file 'locate-file)
  (defun htmlize-locate-file (file path)
    (dolist (dir path nil)
      (when (file-exists-p (expand-file-name file dir))
	(return (expand-file-name file dir))))))

(if (fboundp 'file-name-extension)
    (defalias 'htmlize-file-name-extension 'file-name-extension)
  (defun htmlize-file-name-extension (filename &optional period)
    (let ((file (file-name-sans-versions (file-name-nondirectory filename))))
      (and (string-match "\\.[^.]*\\'" file)
	   (substring file (+ (match-beginning 0) (if period 0 1)))))))

(eval-and-compile
  ;; I hate having replacement macros which are not colorized or
  ;; indented properly, so I'll just define save-current-buffer and
  ;; with-current-buffer if I can't find them.  htmlize is hardly a
  ;; package that you use all the time, so that should be fine.
  (unless (fboundp 'save-current-buffer)
    (defmacro save-current-buffer (&rest forms)
      `(let ((__scb_current (current-buffer)))
	 (unwind-protect
	     (progn ,@forms)
	   (set-buffer __scb_current)))))
  (unless (fboundp 'with-current-buffer)
    (defmacro with-current-buffer (buffer &rest forms)
      `(save-current-buffer (set-buffer ,buffer) ,@forms)))
  (unless (fboundp 'with-temp-buffer)
    (defmacro with-temp-buffer (&rest forms)
      (let ((temp-buffer (gensym "tb-")))
	`(let ((,temp-buffer
		(get-buffer-create (generate-new-buffer-name " *temp*"))))
	   (unwind-protect
	       (with-current-buffer ,temp-buffer
		 ,@forms)
	     (and (buffer-live-p ,temp-buffer)
		  (kill-buffer ,temp-buffer))))))))

(defvar htmlize-x-library-search-path
  '("/usr/X11R6/lib/X11/"
    "/usr/X11R5/lib/X11/"
    "/usr/lib/X11R6/X11/"
    "/usr/lib/X11R5/X11/"
    "/usr/local/X11R6/lib/X11/"
    "/usr/local/X11R5/lib/X11/"
    "/usr/local/lib/X11R6/X11/"
    "/usr/local/lib/X11R5/X11/"
    "/usr/X11/lib/X11/"
    "/usr/lib/X11/"
    "/usr/local/lib/X11/"
    "/usr/X386/lib/X11/"
    "/usr/x386/lib/X11/"
    "/usr/XFree86/lib/X11/"
    "/usr/unsupported/lib/X11/"
    "/usr/athena/lib/X11/"
    "/usr/local/x11r5/lib/X11/"
    "/usr/lpp/Xamples/lib/X11/"
    "/usr/openwin/lib/X11/"
    "/usr/openwin/share/lib/X11/"))

(defun htmlize-get-color-rgb-hash (&optional rgb-file)
  "Return a hash table mapping X color names to RGB values.
The keys to the hash table are X color names as strings, and the
values are the #rrggbb RGB specifications, extracted from `rgb.txt'.

If RGB-FILE is nil, the function will try hard to find a suitable file
in the system directories."
  (let ((rgb-file (or rgb-file (htmlize-locate-file
				"rgb.txt"
				htmlize-x-library-search-path)))
	(hash (make-hash-table :test 'equal)))
    (with-temp-buffer
      (insert-file-contents rgb-file)
      (while (not (eobp))
	(cond ((looking-at "^!")
	       ;; Skip comments
	       )
	      ((looking-at "[ \t]*\\([0-9]+\\)[ \t]+\\([0-9]+\\)[ \t]+\\([0-9]+\\)[ \t]+\\(.*\\)")
	       (setf (gethash (downcase (match-string 4)) hash)
		     (format "#%02x%02x%02x"
			     (string-to-number (match-string 1))
			     (string-to-number (match-string 2))
			     (string-to-number (match-string 3)))))
	      (t
	       (error "Unrecognized line in rgb.txt: %s"
		      (buffer-substring (point) (progn (end-of-line) (point))))))
	(forward-line 1)))
    hash))

(defvar htmlize-color-rgb-hash nil)
(and (or (eq htmlize-use-rgb-map 'force)
	 (and (eq htmlize-use-rgb-map t)
	      (eq window-system 'x)))
     (null htmlize-color-rgb-hash)
     (setq htmlize-color-rgb-hash (htmlize-get-color-rgb-hash)))

;;; Face handling

;; (htmlize-face-foreground FACE) should return the foreground color
;; of the face, either as color name string or as #rrggbb string.
(cond ((fboundp 'face-foreground-name)
       ;; New XEmacs
       (defalias 'htmlize-face-foreground 'face-foreground-name)
       (defalias 'htmlize-face-background 'face-background-name))
      ((fboundp 'color-instance-name)
       ;; XEmacs before 20.4, hopefully
       (defun htmlize-face-foreground (face)
	 (color-instance-name (face-foreground-instance face)))
       (defun htmlize-face-background (face)
	 (color-instance-name (face-background-instance face))))
      ((fboundp 'x-color-values)
       ;; FSF Emacs
       (defun htmlize-face-foreground (face)
	 (or (face-foreground face)
	     (face-foreground 'default)
	     ;; Totally bogus, but in my FSFmacs, (face-foreground
	     ;; 'default) simply returns nil.  Is it a bug?  Is there
	     ;; a way around it?
	     "black"))
       (defun htmlize-face-background (face)
	 (or (face-background face)
	     (face-background 'default)
	     "white")))
      (t
       (error "WTF?!")))

(if (fboundp 'find-face)
    (defalias 'htmlize-symbol-face-p 'find-face)
  (defalias 'htmlize-symbol-face-p 'facep))

;; Return the #rrggbb string for foreground color of FACE.  If BG-P is
;; non-nil, background color is used.
(defun htmlize-face-rgb-string-direct (face &optional bg-p)
  (apply #'format "#%02x%02x%02x"
	 (if (fboundp 'color-instance-rgb-components)
	     (mapcar (lambda (arg)
		       (/ arg 256))
		     (color-instance-rgb-components
		      (if bg-p
			  (face-background-instance face)
			(face-foreground-instance face))))
	   (mapcar (lambda (arg)
		     (/ arg 256))
		   (x-color-values (if bg-p (htmlize-face-background face)
				     (htmlize-face-foreground face)))))))

(defun htmlize-face-rgb-string (face &optional bg-p)
  (if (and htmlize-use-rgb-map
	   htmlize-color-rgb-hash)
      (let* ((oname (downcase (if bg-p (htmlize-face-background face)
				(htmlize-face-foreground face))))
	     (name (if (string-match "^#" oname)
		       oname
		     (gethash oname htmlize-color-rgb-hash))))
	(unless name
	  (error "Something is rotten (face %s, color %s)" face oname))
	name)
    (htmlize-face-rgb-string-direct face bg-p)))

(defstruct htmlize-face
  rgb-foreground			; foreground color, #rrggbb
  rgb-background			; background color, #rrggbb
  boldp					; whether face is bold
  italicp				; whether face is italic
  underlinep				; whether face is underlined
  strikep				; whether face is strikethrough
  css-name				; CSS name of face
  )
(defvar htmlize-face-hash (make-hash-table :test 'eq))

(defun htmlize-make-face-hash (faces)
  (clrhash htmlize-face-hash)
  (let (face-fancy-names b-font i-font bi-font use-bi use-i)
    (when htmlize-running-xemacs
      (setq b-font (face-font-name 'bold)
	    i-font (face-font-name 'italic)
	    bi-font (face-font-name 'bold-italic)
	    use-bi (not (or (equal b-font bi-font) (equal i-font bi-font)))
	    use-i (not (equal b-font i-font))))
    (dolist (face faces)
      (let ((object (make-htmlize-face
		     :rgb-foreground (htmlize-face-rgb-string face)
		     :rgb-background (htmlize-face-rgb-string face t)
		     :underlinep (face-underline-p face))))
	;; Portability junk -- there is no good way of detecting
	;; whether a face is bold or italic under XEmacs, so I need to
	;; resort to disgusting hacks.  Please close your eyes lest
	;; you vomit or spontaneously combust.
	(if htmlize-running-xemacs
	    (let* ((font (face-font-name face)))
	      ;; Boldness, XEmacs
	      (setf (htmlize-face-boldp object)
		    (or (equal font (face-font-name 'bold))
			(and use-bi
			     (equal font (face-font-name 'bold-italic)))))
	      ;; Italic-ness, XEmacs
	      (setf (htmlize-face-italicp object)
		    (and use-i
			 (or (equal font (face-font-name 'italic))
			     (and use-bi
				  (equal font (face-font-name 'bold-italic))))))
	      ;; OK, you may open them again.
	      ;; Strikethrough, XEmacs
	      (setf (htmlize-face-strikep object) (face-strikethru-p face)))
	  (when (fboundp 'face-bold-p)
	     ;; Boldness, GNU Emacs 20
	    (setf (htmlize-face-boldp object) (face-bold-p face)))
	  (when (fboundp 'face-italic-p)
	    ;; Italic-ness, GNU Emacs
	    (setf (htmlize-face-italicp object) (face-italic-p face)))
	  ;; Strikethrough is not supported by GNU Emacs.
	  (setf (htmlize-face-strikep object) nil))

	;; css-name.  Emacs is lenient about face names -- virtually
	;; any string may name a face, even those consisting of
	;; characters such as ^@.  We try hard to beat the face name
	;; into shape, both esthetically and according to CSS1 specs.
	(setf (htmlize-face-css-name object)
	      (let ((name (downcase (symbol-name face))))
		(when (string-match "\\`font-lock-" name)
		  (setq name (replace-match "" t t name)))
		(when (string-match "-face\\'" name)
		  (setq name (replace-match "" t t name)))
		(while (string-match "[^-a-zA-Z0-9]" name)
		  (setq name (replace-match "X" t t name)))
		(when (string-match "^[-0-9]" name)
		  (setq name (concat "X" name)))
		(let ((i 1))
		  (while (member name face-fancy-names)
		    (setq name (format "%s-%d" name i))
		    (incf i)))
		(push name face-fancy-names)
		name))
	;; Hash it away.
	(setf (gethash face htmlize-face-hash) object)))))

(defun htmlize-faces-in-buffer ()
  "Return a list of faces used by the extents in the current buffer."
  (let (faces)
    (if (fboundp 'map-extents)
	(map-extents (lambda (extent ignored)
		       (let ((face (extent-face extent)))
			 (when (consp face)
			   (setq face (car face)))
			 (when (htmlize-symbol-face-p face)
			   (pushnew face faces)))
		       nil)
		     nil nil nil nil nil 'face)
      (save-excursion
	(goto-char (point-min))
	(let (face next)
	  (while (not (eobp))
	    (setq face (get-text-property (point) 'face)
		  next (or (next-single-property-change (point) 'face)
			   (point-max)))
	    (when (consp face)
	      (setq face (car face)))
	    (when (htmlize-symbol-face-p face)
	      (pushnew face faces))
	    (goto-char next)))
	(setq faces (delq nil faces))))
    (delq 'default faces)))

;;; CSS1 support

(defun htmlize-css-doctype ()
  nil					; no doc-string
  "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\">")

;; Internal function; not a method.
(defun htmlize-css-specs (face-object &optional default-face-object)
  (let (result)
    (when (or (not default-face-object)
	      (not (equal (htmlize-face-rgb-foreground face-object)
			  (htmlize-face-rgb-foreground default-face-object))))
      (push (format "color: %s;" (htmlize-face-rgb-foreground face-object))
	    result))
    (when (or (not default-face-object)
	      (not (equal (htmlize-face-rgb-background face-object)
			  (htmlize-face-rgb-background default-face-object))))
      (push (format "background-color: %s;"
		    (htmlize-face-rgb-background face-object)) result))
    (when (and (htmlize-face-boldp face-object)
	       (or (not default-face-object)
		   (not (htmlize-face-boldp default-face-object))))
      (push "font-weight: bold;" result))
    (when (and (htmlize-face-italicp face-object)
	       (or (not default-face-object)
		   (not (htmlize-face-italicp default-face-object))))
      (push "font-style: italic;" result))
    (when (and (htmlize-face-underlinep face-object)
	       (or (not default-face-object)
		   (not (htmlize-face-underlinep default-face-object))))
      (push "text-decoration: underline;" result))
    (when (and (htmlize-face-strikep face-object)
	       (or (not default-face-object)
		   (not (htmlize-face-strikep default-face-object))))
      (push "text-decoration: line-through;" result))
    (nreverse result)))

(defun htmlize-css-insert-head ()
  (insert "    <style type=\"text/css\">\n    <!--\n")
  (let ((default-face-object (gethash 'default htmlize-face-hash)))
    (insert "      BODY {\n        "
	    (mapconcat #'identity (htmlize-css-specs default-face-object)
		       "\n        ")
	    "\n      } /* default */\n")
    (maphash
     (lambda (face face-object)
       (let ((cleaned-up-face-name (symbol-name face)))
	 ;; If face name contains `--' or `*/', we must nix them out.
	 (while (string-match "--" cleaned-up-face-name)
	   (setq cleaned-up-face-name (replace-match "-" t t
						     cleaned-up-face-name)))
	 (while (string-match "\\*/" cleaned-up-face-name)
	   (setq cleaned-up-face-name (replace-match "XX" t t
						     cleaned-up-face-name)))
	 (unless (eq face 'default)
	   (let ((specs (htmlize-css-specs face-object default-face-object)))
	     (insert "      span." (htmlize-face-css-name face-object))
	     (if (null specs)
		 (insert " {")
	       (insert " {\n        "
		       (mapconcat #'identity specs "\n        ")))
	     (insert "\n      } /* " cleaned-up-face-name " */\n")))))
     htmlize-face-hash))
  (insert "    -->\n    </style>\n"))

(defun htmlize-css-face-prejunk (face-object)
  (concat "<span class=\"" (htmlize-face-css-name face-object) "\">"))
(defun htmlize-css-face-postjunk (face-object)
  nil					; no doc-string
  "</span>")

;;; <font> support

;; We use the HTML Pro DTD by default.  Note that under W3-procured
;; DTD's it is illegal to specify <font> under <pre>.
(defun htmlize-font-doctype ()
  nil					; no doc-string
  "<!DOCTYPE HTML PUBLIC \"+//Silmaril//DTD HTML Pro v0r11 19970101//EN\">")

(defun htmlize-font-body-tag ()
  (let ((face-object (gethash 'default htmlize-face-hash)))
    (format "<body text=\"%s\" bgcolor=\"%s\">"
	    (htmlize-face-rgb-foreground face-object)
	    (htmlize-face-rgb-background face-object))))
(defun htmlize-font-face-prejunk (face-object)
  (concat "<font color=\"" (htmlize-face-rgb-foreground face-object) "\">"
	  (and (htmlize-face-boldp      face-object) "<b>")
	  (and (htmlize-face-italicp    face-object) "<i>")
	  (and (htmlize-face-underlinep face-object) "<u>")
	  (and (htmlize-face-strikep    face-object) "<strike>")))
(defun htmlize-font-face-postjunk (face-object)
  (concat (and (htmlize-face-strikep    face-object) "</strike>")
	  (and (htmlize-face-underlinep face-object) "</u>")
	  (and (htmlize-face-italicp    face-object) "</i>")
	  (and (htmlize-face-boldp      face-object) "</b>")
	  "</font>"))

(defmacro htmlize-method (method &rest args)
  (let ((func (gensym "hm-")))
    `(let ((,func (intern (format "htmlize-%s-%s" htmlize-output-type ',method))))
       (and (fboundp ,func)
	    (funcall ,func ,@args)))))

;;;###autoload
(defun htmlize-buffer (&optional buffer)
  "HTML-ize BUFFER."
  (interactive)
  (or buffer
      (setq buffer (current-buffer)))
  (save-excursion
    (set-buffer buffer)
    (run-hooks 'htmlize-before-hook)
    (htmlize-make-face-hash (cons 'default (htmlize-faces-in-buffer))))
  (let* ((newbuf (generate-new-buffer "*html*"))
	 next-change face face-object)
    (switch-to-buffer newbuf)
    (buffer-disable-undo)
    (insert (htmlize-method doctype) ?\n
	    (format "<!-- Created by htmlize-%s in %s mode. -->\n"
		    htmlize-version htmlize-output-type))
    (insert "<html>\n  <head>\n    <title>"
	    (htmlize-protect-string (if (stringp buffer) buffer
				      (buffer-name buffer)))
	    "</title>\n" htmlize-head-tags)
    (htmlize-method insert-head)
    (insert "  </head>")
    (insert "\n  "
	    (or (htmlize-method body-tag)
		"<body>")
	    "\n    <pre>\n")
    (with-current-buffer buffer
      (save-excursion
	(goto-char (point-min))
	(while (not (eobp))
	  (setq face (get-text-property (point) 'face)
		next-change (or (next-single-property-change (point) 'face)
				(point-max)))
	  (and (consp face)
	       ;; Choose the first face.
	       (setq face (car face)))
	  (and (eq face 'default)
	       (setq face nil))
	  ;; FSF Emacs allows `face' property to contain arbitrary
	  ;; stuff.
	  (or (htmlize-symbol-face-p face)
	      (setq face nil))
	  (when face
	    (setq face-object (gethash face htmlize-face-hash))
	    (princ (htmlize-method face-prejunk face-object) newbuf))
	  (princ (htmlize-protect-string
		  (buffer-substring-no-properties (point) next-change))
		 newbuf)
	  (when face
	    (princ (htmlize-method face-postjunk face-object) newbuf))
	  (goto-char next-change))))
    (insert "</pre>\n  </body>\n</html>\n")
    (goto-char (point-min))
    (run-hooks 'htmlize-after-hook)
    (buffer-enable-undo)
    ;; We won't be needing the stored data anymore, so allow next gc
    ;; to free up the used conses.
    (clrhash htmlize-face-hash)))

(defun htmlize-make-file-name (file dir)
  (let* ((nondir (file-name-nondirectory file))
	 (extension (htmlize-file-name-extension file))
	 (sans-extension (file-name-sans-extension nondir)))
    (expand-file-name (if (or (equal extension "html")
			      (equal extension "htm")
			      (equal sans-extension ""))
			  (concat nondir ".html")
			(concat sans-extension ".html"))
		      (or dir (file-name-directory file)))))

;;;###autoload
(defun htmlize-file (file &optional target-directory)
  "HTML-ize FILE, and save the result.
If TARGET-DIRECTORY is non-nil, the resulting HTML file will be saved
to that directory, instead of to the FILE's directory."
  (interactive "fHTML-ize file: ")
  (let* ((was-visited (get-file-buffer file))
	 ;; Set these to nil to prevent double fontification; we'll
	 ;; fontify manually below.
	 (font-lock-auto-fontify nil)
	 (global-font-lock-mode nil)
	 (origbuf (set-buffer (find-file-noselect file t))))
    (font-lock-fontify-buffer)
    (htmlize-buffer)
    (run-hooks 'htmlize-file-hook)
    (write-region (point-min) (point-max)
		  (htmlize-make-file-name file target-directory))
    (kill-buffer (current-buffer))
    (unless was-visited
      (kill-buffer origbuf))))

;;;###autoload
(defun htmlize-many-files (files &optional target-directory)
  "HTML-ize files specified by FILES, and save them to `.html' files.
If TARGET-DIRECTORY is specified, the HTML files will be saved to that
directory.  Normally, each HTML file is saved to the directory of the
corresponding source file."
  (interactive
   (list
    (let (list file)
      ;; Check for `ommadawn', because checking against nil doesn't do
      ;; what you'd expect.
      (while (not (eq (setq file (read-file-name "HTML-ize file (RET to finish): "
						 (and list (file-name-directory
							    (car list)))
						 'ommadawn t))
		      'ommadawn))
	(push file list))
      list)))
  (dolist (file files)
    (htmlize-file file target-directory)))

;;;###autoload
(defun htmlize-many-files-dired (arg &optional target-directory)
  "HTMLize dired-marked files."
  (interactive "P")
  (htmlize-many-files (dired-get-marked-files nil arg) target-directory))

(provide 'htmlize)

;;; htmlize.el ends here
