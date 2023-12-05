;; my-sql-stuff.el
;;        "Mode for editing SQL files and running SQL interpretor." t)

   ;=================================================================
   ; SQL Stuff                                                      ;
   ;=================================================================

(setq sql-dataserver-type "oracle")
(setq sql-abbrev-mode t)

;**************************************************

(setq sql-connection-alist
      '((server1 (sql-product 'sqlplus)
                  (sql-server "OraServer")
                  (sql-user "asrs")
                  (sql-password "venum15")
                  (sql-database "avp68db"))
        (server2 (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "localhost")
                  (sql-user "user")
                  (sql-password "password")
                  (sql-database "db2"))))


(defun my-sql-server1 ()
  (interactive)
  (my-sql-connect 'postgres 'server1))

(defun my-sql-server2 ()
  (interactive)
  (my-sql-connect 'postgres 'server2))

(defun my-sql-connect (product connection)
  ;; remember to set the sql-product, otherwise, it will fail for the first time
  ;; you call the function
  (setq sql-product product)
  (sql-connect connection))


;; (setq sql-oracle-login-params
;;       '((user :default "asrs")
;;         (database :default "avp68db")
;;         (server :default "avp68db_S")
;; 	))

  (defvar sql-server "avp89db")
  (defvar sql-server-name nil)
  (defvar sql-user "asrs")
  (defvar sql-password "blahmoo")
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
; && ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY HH24:MI:SS'
;; (fset 'sql-init
;;    [?s ?e ?t ?  ?t ?a ?b ?  ?o ?f ?f return ?s ?e ?t ?  ?l ?i ?n ?e ?s ?i ?z ?e ?  ?1 ?3 ?0 ?0 ?; return ?s ?e ?t ?  ?p ?a ?g ?e ?s ?i ?z ?e ?  ?6 ?0 return ?s ?e ?t ?  ?e ?c ?h ?o ?  ?o ?n return ?A ?L ?T ?E ?R ?  ?S ?E ?S ?S ?I ?O ?N ?  ?S ?E ?T ?  ?N ?L ?S ?_ ?D ?A ?T ?E ?_ ?F ?O ?R ?M ?A ?T ?= ?\ ?' ?M ?M ?/ ?D ?D ?/ ?Y ?Y ?Y ?Y ?  ?H ?H ?2 ?4 ?: ?M ?I ?: ?S ?S ?\ ?' ?; return])

(fset 'sql-init
   "set echo on\C-mset tab off\C-mset linesize 2000\C-mset pagesize 60\C-mALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY HH24:MI:SS';\C-mCOLUMN LOCATION FORMAT A45\C-m")


 (global-set-key "\M-i" 'sql-init)

 (defalias 'sql-get-login 'ignore)

