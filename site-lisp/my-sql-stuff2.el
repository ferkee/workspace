;; my-sql-stuff.el
;;        "Mode for editing SQL files and running SQL interpretor." t)

   ;=================================================================
   ; SQL Stuff                                                      ;
   ;=================================================================

(setq sql-dataserver-type "oracle")
(setq sql-abbrev-mode t)

;**************************************************
  (defvar sql-server nil)
  (defvar sql-server-name nil)
  (defvar sql-user nil)
  (defvar sql-password nil)
  (defvar sql-database nil)
  (defvar sql-database-name nil)
  (defvar sql-server-table nil)
  (defvar sql-user-table nil)
  (defvar sql-table-list nil)
  (defvar sql-database-list nil)
  (defvar sql-column-list nil)
  (defvar sql-value-list nil)
  (defvar sql-stored-procedure-list nil)
  (defvar sql-user-list nil)
;  (defvar sql-secure-passwords t
;	 "*Make password entry invisible if non-nil.")
;**************************************************

(defun my-sql-mode-hook ()
  "My SQL-mode customized hooks"
  (interactive)
	(turn-on-font-lock)
 ;;   (modify-syntax-entry ?\_ "w") ;; make _ a regular "in-word" char
  (setq-default abbrev-mode t)
  (setq-default truncate-partial-width-windows nil)
  (setq-default truncate-lines 2010)

  (make-local-variable 'comment-start)
  (setq comment-start "/* ")
  (make-local-variable 'comment-end)
  (setq comment-end " */")
  (turn-on-hscroll)
)

(require 'sql-mode)
; (sql-initialize)

(autoload 'sqlplus "sql-mode" 
   "Run an interactive SQL*plus session in a separate buffer." t)
(autoload 'sql-mode "sql-mode"
   "Major mode for editing SQL*plus batch files." t)

(add-hook 'sqlplus-mode-hook 'my-sql-mode-hook)

(add-hook 'sql-mode-hook 'my-sql-mode-hook)


; This will run the 'set tab off, set echo on, set linesize 2000, and set pagesize 60'
(fset 'sql-init
   [?s ?e ?t ?  ?t ?a ?b ?  ?o ?f ?f return ?s ?e ?t ?  ?l ?i ?n ?e ?s ?i ?z ?e ?  ?2 ?0 ?0 ?0 ?; return ?s ?e ?t ?  ?p ?a ?g ?e ?s ?i ?z ?e ?  ?6 ?0 return ?s ?e ?t ?  ?e ?c ?h ?o ?  ?o ?n return ?A ?L ?T ?E ?R ?  ?S ?E ?S ?S ?I ?O ?N ?  ?S ?E ?T ?  ?N ?L ?S ?_ ?D ?A ?T ?E ?_ ?F ?O ?R ?M ?A ?T ?= ?\ ?' ?M ?M ?/ ?D ?D ?/ ?Y ?Y ?Y ?Y ?  ?H ?H ?2 ?4 ?: ?M ?I ?: ?S ?S ?\ ?' ?; return])

;(fset 'sql-init
;   [?s ?e ?t ?  ?t ?a ?b ?  ?o ?f ?f return ?s ?e ?t ?  ?l ?i ?n ?e ?s ?i ?z ?e ?  ?2 ?0 ?0 ?0 ?; return ?s ?e ?t ?  ?p ?a ?g ?e ?s ?i ?z ?e ?  ?6 ?0 return ?s ?e ?t ?  ?e ?c ?h ?o ?  ?o ?n return])

; ?A ?L ?T ?E ?R ?  ?S ?E ?S ?S ?I ?O ?N ?  ?S ?E ?T ?  ?N ?L ?S ?_ ?D ?A ?T ?E ?_ ?F ?O ?R ?M ?A ?T ?= ?\ ?' ?M ?M ?/ ?D ?D ?/ ?Y ?Y ?Y ?Y ?  ?H ?H ?2 ?4 ?: ?M ?I ?: ?S ?S ?\ ?' ?; return])

 (global-set-key "\M-i" 'sql-init)

