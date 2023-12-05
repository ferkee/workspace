(require 'color-theme)
(setq my-color-themes (list 'color-theme-billw 'color-theme-jsc-dark 
			    'color-theme-sitaramv-solaris 'color-theme-resolve
			    'color-theme-classic 'color-theme-jonadabian-slate
			    'color-theme-kingsajz 'color-theme-shaman
			    'color-theme-subtle-blue 'color-theme-snowish
			    'color-theme-sitaramv-nt 'color-theme-wheat))

(setq doremi-color-themes my-color-themes) ; Otherwise, cycles among _all_ themes.  (defun doremi-color-themes ()
"Successively cycle among color themes."
(interactive)
(doremi (lambda (newval) (funcall newval) newval) ; update fn - just call theme
	(car (last doremi-color-themes)) ; start with last theme
	nil                           ; ignored
	nil                           ; ignored
	doremi-color-themes))         ; themes to cycle through
