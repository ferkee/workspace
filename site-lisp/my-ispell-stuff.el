;; my-ispell-stuff.el

   ;=================================================================
   ; ISPELL4 Stuff                                                  ;
   ;=================================================================

(autoload 'ispell-word "c:/emacs/bin/ispell/ispell"
  "Check spelling of word at or before point" t)
(autoload 'ispell-complete-word "c:/emacs/bin/ispell/ispell"
  "Complete word at or before point" t)
(autoload 'ispell-region "c:/emacs/bin/ispell/ispell"
  "Check spelling of every word in the region" t)
(autoload 'ispell-buffer "c:/emacs/bin/ispell/ispell"
  "Check spelling of every word in the buffer" t)
(setq ispell-command "c:/emacs/bin/ispell/ispell.exe"
      ispell-look-dictionary "c:/emacs/bin/ispell/ispell.words"
      ispell-look-command "c:/emacs/bin/ispell/look.exe"
      ispell-command-options (list "-d"
				   "c:/emacs/bin/ispell/ispell.dict"))

(setq ispell-dictionary "c:/emacs/bin/ispell/ispell.dict")

