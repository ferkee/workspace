;64:  How can I create or modify new pull-down menu options?

;  Each menu title (e.g., Buffers, File, Edit) represents a local or global
;  keymap.  Selecting a menu title with the mouse displays that keymap's
;  non-nil contents in the form of a menu.

;  So to add a menu option to an existing menu, all you have to do is add a
;  new definition to the appropriate keymap.  Adding a "forward word"
;  command to the "Edit" menu thus requires the following Lisp code:

;    (define-key global-map           
;      [menu-bar edit forward]        
;      '("Forward word" . forward-word))

;  The first line adds the entry to the global keymap, which includes global
;  menu bar entries.  Replacing the reference to "global-map" with a local
;  keymap would add this menu option only within a particular mode.

;  The second line describes the path from the menu-bar to the new entry.
;  Placing this menu entry underneath the "File" menu would mean changing
;  the word "edit" in the second line to "file."

;  The third line is a cons cell whose first element is the title that will
;  be displayed, and whose second element is the function that will be
;  called when that menu option is invoked.

;  To add a new menu, rather than a new option to an existing menu, we must
;  define an entirely new keymap:

;    (define-key global-map [menu-bar words]
;      (cons "Words" (make-sparse-keymap "Words")))

;  The above code creates a new sparse keymap, gives it the name "Words",
;  and attaches it to the global menu bar.  Adding the "forward word"
;  command to this new menu would thus require the following code:

;    (define-key global-map
;      [menu-bar words forward]
;      '("Forward word" . forward-word))

;  Note that because of the way keymaps work, menu options are displayed
;  with the more recently defined items at the top.  Thus if you were to
;  define menu options "foo", "bar", and "baz" (in that order), menu option
;  "baz" would appear at the top, and "foo" would be at the bottom.

;  One way to avoid this problem is to use the function define-key-after,
;  which works the same as define-key, but lets you modify where items
;  appear.  The following Lisp code would insert the "forward word" function
;  in the "edit" menu immediately following the "undo" option:

;    (define-key-after
;      (lookup-key global-map [menu-bar edit])
;      [forward]
;      '("Forward word" . forward-word)
;      'undo)

;  Note how the second and third arguments to define-key-after are different
;  from those of define-key, and that we have added a new (final) argument,
;  the function after which our new key should be defined.

;  To move a menu option from one position to another, simply evaluate
;  define-key-after with the appropriate final argument.

;  More detailed information -- and more examples of how to create and
;  modify menu options -- are in the Emacs Lisp Reference Manual, under
;  "Menu Keymaps."  (See question 16 for information on this manual.)

;  Note that Emacs 20.3 introduced a better (`extended') format for menu
;  items, described in the NEWS file and the Lisp Manual.  The "easymenu"
;  package provides support for defining menus conveniently with some
;  portability amongst Emacs versions.

;65:  How do I delete menus and menu options?

;  The simplest way to remove a menu is to set its keymap to nil.  For
;  example, to delete the "Words" menu (from question 64), use:

;    (define-key global-map [menu-bar words] nil)

;  Similarly, removing a menu option requires redefining a keymap entry to
;  nil.  For example, to delete the "Forward word" menu option from the
;  "Edit" menu (we added it in question 64), use:

;    (define-key global-map [menu-bar edit forward] nil)

