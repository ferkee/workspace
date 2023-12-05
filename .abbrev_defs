;;-*-coding: utf-8;-*-
(define-abbrev-table 'Buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'Custom-mode-abbrev-table '())

(define-abbrev-table 'ada-mode-abbrev-table '())

(define-abbrev-table 'apropos-mode-abbrev-table '())

(define-abbrev-table 'asm-mode-abbrev-table '())

(define-abbrev-table 'awk-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'bib-mode-abbrev-table '())

(define-abbrev-table 'bibtex-mode-abbrev-table '())

(define-abbrev-table 'c++-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'c-mode-abbrev-table
  '(
    ("alvr" "alvrec->alv" nil 0)
    ("ashr" "ashrec->ash" nil 0)
    ("bayr" "bayrec->bay" nil 0)
    ("binr" "binrec->bin" nil 0)
    ("blk" "{
@@
}" nil 1)
    ("catr" "catrec->cat" nil 0)
    ("celr" "celrec->cel" nil 0)
    ("cfgr" "cfgrec->cfg" nil 0)
    ("cidr" "cidrec->cid" nil 0)
    ("cmtr" "cmtrec->cmt" nil 0)
    ("cnfr" "cnfrec->cnf" nil 0)
    ("ctlr" "ctlrec->ctl" nil 0)
    ("devr" "devrec->dev" nil 0)
    ("df" "#define     " nil 0)
    ("dot-h" "~(dmacro masthead t)~(dmacro hifndef)" dmacro-expand 0)
    ("dspscrn" "dispscrn(~(prompt constant \"Screen: \"), CLRSCR, FALSE);" dmacro-indent 0)
    ("eqer" "eqerec->eqe" nil 0)
    ("fdesc" "/*******************************************************************************
Function Name: ~(prompt name \"Function: \")      
Description:   ~@

Function Return Type: int
Returned Value Desc.: ER_NONE -    successful
                      ER_xxxx - 

INPUT  Parameters: ~mark
OUTPUT Parameters: ~mark
*******************************************************************************/
~(prompt type \"Function type: \") ~(prompt name)()
{

    return(ER_NONE);
}
" nil 0)
    ("fori" "for (i = 0; i < @@; ++i)
{

}
" nil 0)
    ("foriefficient" "for (i = ~@; --i >= 0; )
{
 ~mark
}
" nil 0)
    ("func" "~(prompt type \"Function type: \") ~(prompt name \"Function name: \")(~@)
{
~mark
} /* ~(prompt name) */
" nil 2)
    ("hifndef" "#ifndef ~((file-name) :up)
#define ~((file-name) :up)

~@

#endif /* ~((file-name) :up) */" dmacro-expand 0)
    ("hstr" "hstrec->hst" nil 0)
    ("ifd" "#ifdef @@
~(mark)
#endif 
" nil 0)
    ("ifddebug" "#ifdef DEBUG
if (debuglevel >= ~(prompt debug \"Debug level: \") {
 (void) fprintf(stderr, \"DEBUG: ~@\\n\");
 (void) fflush (stderr);
 (void) getch ();
}
#endif /* DEBUG */" dmacro-indent 0)
    ("ifdnever" "#ifdef NEVER
~@
#endif /* NEVER */
" dmacro-expand 0)
    ("ife" "if (~(prompt expr \"Expression: \"))
    {
        ~@
    }
    else
    {
        ~(mark)
    }
" dmacro-indent 0)
    ("ifmal" "if ((~@ = (~(prompt type \"Variable type: \") *) ~(dmacro malloc)(~(mark)sizeof(~(prompt)))) == NULLP(~(prompt)))
" dmacro-indent 0)
    ("ifor" "for (~(prompt var \"Variable: \") = 0; ~prompt < ~@; ++~prompt)
{
 ~mark
}
" dmacro-indent 0)
    ("ifrn" "if (ret_val == ER_NONE" nil 0)
    ("ifrnn" "if (ret_val != ER_NONE" nil 2)
    ("iifd" "#ifdef ~(prompt constant \"#ifdef condition: \")
~@
#endif /* ~(prompt) */
" dmacro-expand 0)
    ("iifed" "#ifdef ~(prompt constant \"#ifdef condition: \")
~@
#else
 ~(mark)
#endif /* ~(prompt) */
" dmacro-expand 0)
    ("iifnd" "#ifndef ~(prompt constant \"#ifndef condition: \")
~@
#endif /* ~(prompt) */
" dmacro-expand 0)
    ("iinclude" "#ifndef ~((prompt file \"Header file name: \") :up)
# include <~(prompt file).h>
#endif /* ~((prompt file) :up) */
" dmacro-expand 0)
    ("invr" "invrec->inv" nil 0)
    ("irn" "if (ret_val == ER_NONE" nil 0)
    ("irnn" "if (ret_val != ER_NONE" nil 0)
    ("itmr" "itmrec->itm" nil 0)
    ("lm" "log_msg2(ret_val, @@)" nil 15)
    ("locr" "locrec->loc" nil 0)
    ("mal" "= (~(prompt type \"Variable type: \") *) ~(dmacro malloc)(~@sizeof(~(prompt)));
" dmacro-indent 0)
    ("masthead" "/******************************************************************************

Module Name : ~(file)                                Date Written: ~(month-num)/~(date-num)/~year

Description: ~(prompt desc \"Module Description: \")

Author: ~((user-id): up) (~(user-name))

Expected Parameters
     INPUTS :
    OUTPUTS :

External Data References (variables,queus,tables)
    ~mark

Inclusions: 
******************************************************************************/
/*        STANDARD DEFINES             */
#define    DEBUGIT


/*   GLOBAL VARIABLE DECLARATIONS      */


/*****************************************************************************
 Main function for this program module.
******************************************************************************/
main(argc, argv)
int    argc;
char  *argv[];
{

}


" dmacro-expand 0)
    ("mcmp" "memcmp(@@,BBB,LLL) == 0" nil 2)
    ("nt" "int         " nil 1)
    ("numr" "numrec->num" nil 0)
    ("oprr" "oprrec->opr" nil 0)
    ("plcr" "plcrec->plc" nil 0)
    ("podr" "podrec->pod" nil 0)
    ("pohr" "pohrec->poh" nil 0)
    ("ptlr" "ptlrec->ptl" nil 0)
    ("refr" "refrec->ref" nil 0)
    ("rodr" "rodrec->rod" nil 0)
    ("rohr" "rohrec->roh" nil 0)
    ("rsnr" "rsnrec->rsn" nil 0)
    ("scnr" "scnrec->scn" nil 0)
    ("sesr" "sesrec->ses" nil 0)
    ("sitr" "sitrec->sit" nil 0)
    ("snpr" "snprec->snp" nil 0)
    ("sodr" "sodrec->sod" nil 0)
    ("sohr" "sohrec->soh" nil 17)
    ("ssh" "ss_log(hi_ss,0,\"@@\")" nil 2)
    ("sshi" "ss_log(hi_ss,0,\"@@\")" nil 10)
    ("toir" "toirec->toi" nil 0)
    ("trnr" "trnrec->trn" nil 0)
    ("typr" "typrec->typ" nil 0)
    ("uomr" "uomrec->uom" nil 0)
    ("valr" "valrec->val" nil 0)
    ("wrkr" "wrkrec->wrk" nil 0)
   ))

(define-abbrev-table 'calculator-mode-abbrev-table '())

(define-abbrev-table 'calendar-mode-abbrev-table '())

(define-abbrev-table 'change-log-mode-abbrev-table '())

(define-abbrev-table 'comint-mode-abbrev-table '())

(define-abbrev-table 'completion-list-mode-abbrev-table '())

(define-abbrev-table 'conf-colon-mode-abbrev-table '())

(define-abbrev-table 'conf-javaprop-mode-abbrev-table '())

(define-abbrev-table 'conf-ppd-mode-abbrev-table '())

(define-abbrev-table 'conf-space-mode-abbrev-table '())

(define-abbrev-table 'conf-unix-mode-abbrev-table '())

(define-abbrev-table 'conf-windows-mode-abbrev-table '())

(define-abbrev-table 'conf-xdefaults-mode-abbrev-table '())

(define-abbrev-table 'cperl-mode-abbrev-table
  '(
    ("continue" "continue" cperl-electric-else 0)
    ("do" "do" cperl-electric-keyword 1)
    ("else" "else" cperl-electric-else 0)
    ("elsif" "elsif" cperl-electric-keyword 0)
    ("for" "for" cperl-electric-keyword 0)
    ("foreach" "foreach" cperl-electric-keyword 0)
    ("foreachmy" "foreachmy" cperl-electric-keyword 0)
    ("formy" "formy" cperl-electric-keyword 0)
    ("head1" "head1" cperl-electric-pod 0)
    ("head2" "head2" cperl-electric-pod 0)
    ("if" "if" cperl-electric-keyword 1)
    ("over" "over" cperl-electric-pod 0)
    ("pod" "pod" cperl-electric-pod 0)
    ("prst" "print STDOUT" nil 0)
    ("unless" "unless" cperl-electric-keyword 1)
    ("until" "until" cperl-electric-keyword 1)
    ("while" "while" cperl-electric-keyword 1)
   ))

(define-abbrev-table 'cpp-edit-mode-abbrev-table '())

(define-abbrev-table 'cvs-mode-abbrev-table '())

(define-abbrev-table 'diff-mode-abbrev-table '())

(define-abbrev-table 'display-time-world-mode-abbrev-table '())

(define-abbrev-table 'ebrowse-electric-list-mode-abbrev-table '())

(define-abbrev-table 'ebrowse-electric-position-mode-abbrev-table '())

(define-abbrev-table 'ebrowse-member-mode-abbrev-table '())

(define-abbrev-table 'ebrowse-tree-mode-abbrev-table '())

(define-abbrev-table 'eieio-custom-mode-abbrev-table '())

(define-abbrev-table 'electric-buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-byte-code-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-mode-abbrev-table '())

(define-abbrev-table 'flycheck-error-list-mode-abbrev-table '())

(define-abbrev-table 'fortran-mode-abbrev-table
  '(
    (";au" "automatic" nil 0)
    (";b" "byte" nil 0)
    (";bd" "block data" nil 0)
    (";c" "continue" nil 0)
    (";ch" "character" nil 0)
    (";cl" "close" nil 0)
    (";cm" "common" nil 0)
    (";cx" "complex" nil 0)
    (";dc" "double complex" nil 0)
    (";df" "define" nil 0)
    (";di" "dimension" nil 0)
    (";do" "double" nil 0)
    (";dp" "double precision" nil 0)
    (";dw" "do while" nil 0)
    (";e" "else" nil 0)
    (";ed" "enddo" nil 0)
    (";el" "elseif" nil 0)
    (";en" "endif" nil 0)
    (";eq" "equivalence" nil 0)
    (";ew" "endwhere" nil 0)
    (";ex" "external" nil 0)
    (";ey" "entry" nil 0)
    (";f" "format" nil 0)
    (";fa" ".false." nil 0)
    (";fu" "function" nil 0)
    (";g" "goto" nil 0)
    (";ib" "implicit byte" nil 0)
    (";ic" "implicit complex" nil 0)
    (";ich" "implicit character" nil 0)
    (";ii" "implicit integer" nil 0)
    (";il" "implicit logical" nil 0)
    (";im" "implicit" nil 0)
    (";in" "integer" nil 0)
    (";inc" "include" nil 0)
    (";intr" "intrinsic" nil 0)
    (";ir" "implicit real" nil 0)
    (";l" "logical" nil 0)
    (";n" "namelist" nil 0)
    (";o" "open" nil 0)
    (";p" "print" nil 0)
    (";pa" "parameter" nil 0)
    (";pr" "program" nil 0)
    (";ps" "pause" nil 0)
    (";r" "read" nil 0)
    (";rc" "record" nil 0)
    (";re" "real" nil 0)
    (";rt" "return" nil 0)
    (";rw" "rewind" nil 0)
    (";s" "stop" nil 0)
    (";sa" "save" nil 0)
    (";sc" "static" nil 0)
    (";st" "structure" nil 0)
    (";su" "subroutine" nil 0)
    (";tr" ".true." nil 0)
    (";ty" "type" nil 0)
    (";vo" "volatile" nil 0)
    (";w" "write" nil 0)
    (";wh" "where" nil 0)
   ))

(define-abbrev-table 'fundamental-mode-abbrev-table '())

(define-abbrev-table 'gdb-breakpoints-mode-abbrev-table '())

(define-abbrev-table 'gdb-disassembly-mode-abbrev-table '())

(define-abbrev-table 'gdb-frames-mode-abbrev-table '())

(define-abbrev-table 'gdb-locals-mode-abbrev-table '())

(define-abbrev-table 'gdb-memory-mode-abbrev-table '())

(define-abbrev-table 'gdb-registers-mode-abbrev-table '())

(define-abbrev-table 'gdb-script-mode-abbrev-table '())

(define-abbrev-table 'gdb-threads-mode-abbrev-table '())

(define-abbrev-table 'global-abbrev-table
  '(
    ("cant" "can't" nil 1)
    ("cr" "datbuf[ strlen(datbuf) ] = CR" nil 0)
    ("dont" "don't" nil 1)
    ("doreal" ". ~/.aliases" nil 2)
    ("dstamp" " -~((user-initials) :down)~dn/~dd/~dy." dmacro-expand 0)
    ("dtstamp" " -~((user-initials) :down)~dn/~dd/~dy ~((hour) :pad nil):~min~ampm." dmacro-expand 0)
    ("entk" "enter_key(NULL)" nil 9)
    ("f1f" "f1;h1;w1" nil 0)
    ("ginit" "set print pretty
 set print null-stop" nil 3)
    ("grp" "grp" nil 0)
    ("if777" "if (memcmp (ordrec->op_rlsnum, REP_RLS_C, L_RLSNUM) == 0)" nil 3)
    ("isnt" "isn't" nil 0)
    ("isym" "if (symterm)" nil 2)
    ("pritn" "print" nil 0)
    ("recieve" "receive" nil 0)
    ("ruler1" "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
" nil 1)
    ("ruler2" ".........1.........2.........3.........4.........5.........6.........7.........8.........9.........0
1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
" nil 3)
    ("ruler3" "...................................................................................................1
.........1.........2.........3.........4.........5.........6.........7.........8.........9.........0
1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
" nil 0)
    ("ruler4" "...................................................................................................1
1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
.........1.........2.........3.........4.........5.........6.........7.........8.........9.........0
" nil 0)
    ("stf" "strcat(fmtbuf" nil 0)
    ("teh" "the" nil 0)
    ("thats" "that's" nil 0)
    ("thier" "their" nil 0)
   ))

(define-abbrev-table 'grep-mode-abbrev-table '())

(define-abbrev-table 'gud-mode-abbrev-table
  '(
    ("blah" "moo" nil 1)
    ("init" "set print pretty
 set print null-stop" nil 0)
   ))

(define-abbrev-table 'help-mode-abbrev-table '())

(define-abbrev-table 'html-helper-mode-abbrev-table
  '(
    ("ctline" "  <tr height=\"1\">
    <td width=\"750\" colspan=\"~(prompt colspan)\" bgcolor=\"#000000\"></td>
  </tr>
" dmacro-indent 0)
    ("expires" "<META HTTP-EQUIV=\"expires\" CONTENT=\"now\">" nil 0)
    ("hru" "<HR !------------------------------------------------------------->
" nil 2)
    ("ibt" "<INPUT TYPE=\"button\" NAME=\"btnName\" VALUE=\"btnValue\" onClick\"\">" nil 0)
    ("ichk" "<INPUT TYPE=\"checkbox\" NAME=\"checkName\" VALUE=\"\" OnClick=\"\">" nil 0)
    ("iform" "<FORM NAME=\"frmName\" METHOD=\"POST\" ACTION=\"frmAction\" onSubmit=\"\">



</FORM>" nil 0)
    ("ihd" "<INPUT TYPE=\"hidden\" NAME=\"hdnName\" VALUE=\"\">" nil 0)
    ("irad" "<INPUT TYPE=\"radio\" NAME=\"radioName\" VALUE=\"\" onClick=\"\">" nil 0)
    ("ires" "<INPUT TYPE=\"reset\" VALUE=\"RESET\">" nil 0)
    ("isl" "<SELECT NAME=\"selName\" SIZE=\"1\" CLASS=\"select\">
	<OPTION VALUE=\"optVal\">optLabel</OPTION>
</SELECT>" nil 0)
    ("isub" "<INPUT TYPE=\"submit\" NAME=\"subName\" VALUE=\"SUBMIT\">" nil 1)
    ("itx" "<INPUT TYPE=\"text\" NAME=\"txtName\" SIZE=\"20\" VALUE=\"\" CLASS=\"txtfld\">" nil 1)
    ("jsc" "" nil 0)
    ("jscript" "<SCRIPT>
<!--
~@
 
//-->
</SCRIPT>

" dmacro-indent 0)
    ("redirect" "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;url=http://~(prompt url \"http://\"  )\">" dmacro-indent 2)
    ("tb" "<!--------------------------------------------------------->
<TABLE WIDTH=\"100%\" BORDER=\"0\">
	<TR>
		<TD ALIGN=\"left\">

		</TD>
		<TD ALIGN=\"left\">

		</TD>
	</TR>
</TABLE>
<!--------------------------------------------------------->
" nil 0)
   ))

(define-abbrev-table 'html-mode-abbrev-table '())

(define-abbrev-table 'icon-mode-abbrev-table '())

(define-abbrev-table 'idl-mode-abbrev-table '())

(define-abbrev-table 'inferior-python-mode-abbrev-table
  '(
    ("blah" "MOOOOO" nil 0)
   ))

(define-abbrev-table 'internal-ange-ftp-mode-abbrev-table '())

(define-abbrev-table 'java-mode-abbrev-table
  '(
    ("csi" "(Integer)" nil 1)
    ("css" "(String)" nil 0)
    ("eic" "equalsIgnoreCase" nil 1)
    ("prn" "System.out.println" nil 0)
    ("sagv" "SaGetValueByGroup" nil 0)
    ("sagvs" "SaGetValueByGroupSafe" nil 0)
    ("sop" "System.out.println" nil 0)
    ("sout" ["System.out.println(\"\")" 2 nil nil] expand-abbrev-hook 0)
   ))

(define-abbrev-table 'jde-mode-abbrev-table
  '(
    ("ab" "abstract" nil 0)
    ("bo" "boolean" nil 0)
    ("br" "break" nil 0)
    ("brk" "break" nil 0)
    ("by" "byte" nil 0)
    ("byv" "byvalue" nil 0)
    ("ca" "catch" nil 0)
    ("cas" "cast" nil 0)
    ("ch" "char" nil 0)
    ("cl" "class" nil 0)
    ("co" "const" nil 0)
    ("con" "continue" nil 0)
    ("csi" "(Integer)" nil 0)
    ("css" "(String)" nil 0)
    ("de" "default" nil 0)
    ("dou" "double" nil 0)
    ("eic" "equalsIgnoreCase" nil 1)
    ("el" "else" nil 0)
    ("ex" "extends" nil 0)
    ("fa" "false" nil 0)
    ("fi" "final" nil 0)
    ("fin" "finally" nil 0)
    ("fl" "float" nil 0)
    ("fo" "for" nil 0)
    ("fu" "future" nil 0)
    ("ge" "generic" nil 0)
    ("go" "goto" nil 0)
    ("impl" "implements" nil 0)
    ("impo" "import" nil 0)
    ("in" "int" nil 0)
    ("ins" "instanceof" nil 0)
    ("inso" "instanceof" nil 0)
    ("inte" "interface" nil 0)
    ("lo" "long" nil 0)
    ("na" "native" nil 0)
    ("ne" "new" nil 0)
    ("nu" "null" nil 0)
    ("pa" "package" nil 0)
    ("pri" "private" nil 0)
    ("prn" "System.out.println" nil 0)
    ("pro" "protected" nil 0)
    ("pu" "public" nil 0)
    ("re" "return" nil 0)
    ("sagv" "SaGetValueByGroup" nil 0)
    ("sagvs" "SaGetValueByGroupSafe" nil 0)
    ("sh" "short" nil 0)
    ("sop" "System.out.println" nil 4)
    ("st" "static" nil 0)
    ("su" "super" nil 0)
    ("sw" "switch" nil 0)
    ("sy" "synchronized" nil 0)
    ("th" "this" nil 0)
    ("thr" "throw" nil 0)
    ("throw" "throw" nil 0)
    ("tr" "true" nil 0)
    ("tra" "transient" nil 0)
    ("vo" "void" nil 0)
    ("vol" "volatile" nil 0)
    ("wh" "while" nil 0)
   ))

(define-abbrev-table 'jython-mode-abbrev-table '())

(define-abbrev-table 'ld-script-mode-abbrev-table '())

(define-abbrev-table 'lisp-mode-abbrev-table '())

(define-abbrev-table 'log-edit-mode-abbrev-table '())

(define-abbrev-table 'log-view-mode-abbrev-table '())

(define-abbrev-table 'mail-abbrevs
  '(
    ("abercrok" "MSMWHQ01.KABERC01@eds.com" mail-abbrev-expand-hook 0)
    ("abeyer" "Alex Beyer <abeyer@hotmail.com>" mail-abbrev-expand-hook 0)
    ("adams" "Scott Adams <Scott.Adams@Anheuser-Busch.com>" mail-abbrev-expand-hook 0)
    ("afc" "andy@cohan.org" mail-abbrev-expand-hook 0)
    ("aheap" "Andrew Heap <andrew.d.heap@ac.com>" mail-abbrev-expand-hook 0)
    ("alan2" "skydive1@ionet.net" mail-abbrev-expand-hook 0)
    ("all_govt" "forrestg abbotta, whitem, thomass, rummelg, jor, cathyc, \\       whislerp, wyattd, websters, gilbouxt, pearsonp, ellisonl, thompsju, cornelim" mail-abbrev-expand-hook 0)
    ("alum" "me, Chuck Ketterer <KettererC@emotors.com>, Dan Redington <dtr1@flash.net>, Doug Morris <dmorris@ti.com>, Brian Fortman <bfortman@dal.asp.ti.com>, Tim Garvey <TIGARVE@aol.com>, John Grater <QA333O@email.mot.com>, Ed Grimmer <stlepg@am.dames.com>, \\, Scott.Adams@Anheuser-Busch.com (Scott Adams), Jamar Neal <zagros@walden.mvp.net>, Jamey Johnson <jamey@sechq.com>, Mike Luzcak <ZACK@msg.ti.com>, Kyle Metzloff <metzloff@students.wisc.edu>, Doug Nolkemper <NolkemperDJ@bv.com>, Steve Nussbaum <epa4129@epa.state.il.us>, orf, \\, perry, Tom Polcyn <Polcyn@HowellHafer.com>, quinn, Chris Ramsay <cramsay@umr.edu>, Shawn Slattery <Sslatter@CH2M.com>, Brad Stewart <stewartb@Kendallhq.com>, sully, Kurt VanHoogstrate <kvanhoogstrate@olicom.com>, \\, Jeff Vogt <jlvogt@ra.rockwell.com>" mail-abbrev-expand-hook 0)
    ("amr" "rufus@3dfx.com" mail-abbrev-expand-hook 0)
    ("amr2" "rufus@dkmail.dkeep.com" mail-abbrev-expand-hook 0)
    ("barmeier" "Mark Barmeier <mbar02@conagrafrozen.com>" mail-abbrev-expand-hook 0)
    ("barmeir" #("Mark Barmeir  <barmeimj@egr.com>" 0 32 (face font-lock-string-face)) mail-abbrev-expand-hook 0)
    ("bbeyer" "Brian Beyer <beyerb@pweh.com>" mail-abbrev-expand-hook 0)
    ("beard" "Stuart Beard <sbeard@mdc.com>" mail-abbrev-expand-hook 0)
    ("benji" "btcanlas@juno.com" mail-abbrev-expand-hook 0)
    ("benwa" "Benji Canlas <bcanlas@hrznconsulting.com>" mail-abbrev-expand-hook 0)
    ("berry" "Shawn Berry <Shawn.Berry@Bosch-Brakes.com>" mail-abbrev-expand-hook 0)
    ("beth" "jvieth3989@aol.com" mail-abbrev-expand-hook 0)
    ("bhays" "Brady Hays <haysbf@bv.com>" mail-abbrev-expand-hook 0)
    ("bill" "Bill Alexander <balexand@hpmail2.fwrdc.rtsg.mot.com>" mail-abbrev-expand-hook 0)
    ("bina" "bina@shellus.com" mail-abbrev-expand-hook 0)
    ("bingham" "Brian Bingham <bbing@mit.edu>" mail-abbrev-expand-hook 0)
    ("bj" "Burt Juarez <bj@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("bjones" "Brian Jones <brianjones@korteco.com>" mail-abbrev-expand-hook 0)
    ("blaich" "Chris Blaich <rsblaich@qni.com>" mail-abbrev-expand-hook 0)
    ("bls" "Brenda *L* Schlender <SchlenderB@MaryKay.com>" mail-abbrev-expand-hook 0)
    ("boley" "Joe Boley <JBoley@Boleytool.com>" mail-abbrev-expand-hook 0)
    ("boley2" #("Joe Boley  <Boleytool@aol.com>" 0 30 (face font-lock-string-face)) mail-abbrev-expand-hook 0)
    ("borah" "Chad Borah <Chad.W.Borah@ac.com>" mail-abbrev-expand-hook 0)
    ("borgwald" "Brad Borgwald <bborgwald@malisko.com>" mail-abbrev-expand-hook 0)
    ("bossman" "James Bossman <jbossman@srob.com>" mail-abbrev-expand-hook 0)
    ("bossman2" #("James Bossman 2  <jbossman@srob.com>" 0 36 (face font-lock-string-face)) mail-abbrev-expand-hook 0)
    ("brandt" "Michael Brandt <Michael.Brandt@Anheuser-Busch.com>" mail-abbrev-expand-hook 0)
    ("brann" "Jake Brann <jacob.brann@lighting.ge.com>" mail-abbrev-expand-hook 0)
    ("brenda" "bhdesign@brendahowarddesign.com" mail-abbrev-expand-hook 0)
    ("bret" "Bret Senters <bret.senters@exmi01.exch.eds.com>" mail-abbrev-expand-hook 0)
    ("briddell" "Pete Briddell <Pbriddell@aol.com>" mail-abbrev-expand-hook 0)
    ("brooks" "Brooks Harkey <Brooks.Harkey@Avnet.com>" mail-abbrev-expand-hook 0)
    ("brown" "Don Brown <lil_haas@hotmail.com>" mail-abbrev-expand-hook 0)
    ("bucklew" "Bill Bucklew <wbucklew@indak.com>" mail-abbrev-expand-hook 0)
    ("calendar_girls" "graysonb, pylandc, karenk, xkkenton@dskmail.itg.ti.com, hargiss" mail-abbrev-expand-hook 0)
    ("canty" "Scott Canty <scanty@lg.com>" mail-abbrev-expand-hook 0)
    ("canty2" "Scott Canty 2 <scanty69@hotmail.com>" mail-abbrev-expand-hook 0)
    ("cat" "catmorse@oz.sunflower.org" mail-abbrev-expand-hook 0)
    ("ccullen" "Craig Cullen <craig_cullen@chppmeur.army.mil>" mail-abbrev-expand-hook 0)
    ("charles" "Charles.Morgan@Avnet.com" mail-abbrev-expand-hook 0)
    ("cheryl" "cprince@shelton.org" mail-abbrev-expand-hook 0)
    ("chuck" "Chuck Ketterer <KettererC@emotors.com>" mail-abbrev-expand-hook 0)
    ("clark" "Brad Clark <bclark@ehancock.com>" mail-abbrev-expand-hook 0)
    ("como" "Kevin Como <Kcomo@burnsmcd.com>" mail-abbrev-expand-hook 0)
    ("cquinn" "100331.3150@compuserve.com, 74274.1552@compuserve.com, 76202.630@compuserve.com, Golgoroth@bigfoot.com, OSOQuinn@aol.com, arclight@bigfoot.com, c4nquin@sr.pacbell.com, ccardinal@apexmail.com, chriscoa@hotmail.com, chrisq@basic.net, chrisqu@minerva.robadome.com, chrisqu@siemensrolm.com, chrisquinn@OC-NET.COM, ckquinn123@aol.com, cq2@spruce.evansville.edu, cquinn1@msn.com, cquinn3907@aol.com, cquinn4832@aol.com, cquinn7148@aol.com, lord_of_hades@hotmail.com, notclinton@aol.com, pstracha@cln.etc.bc.ca, quinn_c@hotmail.com, quinnchris@hotmail.com, quinn@ns.net, cquinn2050@aol.com, cqster@aol.com, 101537.2546@compuserve.com, 101456.3560@compuserve.com, 75507.2716@compuserve.com, 74752.16@compuserve.com, 74034.373@compuserve.com, 102502.2665@compuserve.com, 104062.3405@compuserve.com, 76476.1766@compuserve.com, 73172.630@compuserve.com, 104741.1451@compuserve.com, quinnchr@pilot.msu.edu, CMQ99@uno.cc.geneseo.edu, Christopher.Quinn@colorado.edu, cfq100@email.psu.edu, CNIIQ@ux1.cso.uiuc.edu, NIIQ@ux1.cso.uiuc.edu, cantona20@hotmail.com, cq@OFFWORLDS.COM" mail-abbrev-expand-hook 0)
    ("dad" "jfierke@nemonet.com (DAD)" mail-abbrev-expand-hook 0)
    ("dah" "Dave Huggins <dah@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("daily_jokes" "Scott.Adams@Anheuser-Busch.com (Scott Adams), jimmie@rmi.net (Jimmie Susan & MacKenzie), jkf1@ix.netcom.com (Jeff Fierke), catmorse@oz.sunflower.org, rufus@3dfx.com, Bret Senters <bret.senters@exmi01.exch.eds.com>, Fabio Costa <Fabio.Costa@COMPAQ.com>, gsanders@3dfx.com (Coo Coo 4 Coco Puffs), Jay Halvorson <jah@c2o.com>, Jerome Obinabo <jobinabo@eriver.com>, Jeff Thompson <jmt@c2o.com>, Jonathan Polk <Jonathan_Polk@amrcorp.com>, Ken Zotigh <ken_zotigh@yahoo.com>, Leonard Crowe <lcrowe@c2o.com>, Len Catanach <lpc@c2o.com>, Michael Kirk <mmk@tpd.eds.com>, Mike Ellis <mse@tpd.eds.com>, Ruston Vickers <rvickers@eriver.com>, Troy Price <trp@tpd.eds.com>, Trent Mushtaler <trent.mushtaler@sybase.com>, Jeff Giesen <jrg@bighorn.dr.lucent.com>, Burt Juarez <bj@tpd.eds.com>, andy@cohan.org, Ginger Gatling <ginger.gatling@sap-ag.de>, Han Chung <han_chung@vantive.com>, Kyle Messerschmitt <kmessers@inm.eds.com>, Russell Scott <rds@tpd.eds.com>, kayj, regmil@swbell.net, bina@shellus.com, tgh@us.prismtechnologies.com, Tom Knodell <TomK@HeatAndControl.com>, wshipley@sunflowr.usd.edu (Whitney Shipley)" mail-abbrev-expand-hook 0)
    ("dampf" "Chris Dampf <Chris.Dampf@Anheuser-Busch.com>" mail-abbrev-expand-hook 0)
    ("dbb" "Dave Beck <dbb@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("dbunch" "Dave Bunch <dbunch-pikes@worldnet.att.net>" mail-abbrev-expand-hook 0)
    ("dcm" "Dave Musgrave <dcm@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("dewayne" "Dewayne Pattison <Dewayne Pattison>" mail-abbrev-expand-hook 0)
    ("djadams" "DJ Adams <djadams@adesa.com>" mail-abbrev-expand-hook 0)
    ("dmorris" "Doug Morris <dmorris@ti.com>" mail-abbrev-expand-hook 0)
    ("dmyers" "Donald Dean Myers <dmyers@shuttle.cc.umr.edu>" mail-abbrev-expand-hook 0)
    ("doctor_lee" "skydivedal@aol.com" mail-abbrev-expand-hook 0)
    ("eball" "Eddie Ball <eball@hiwaay.net>" mail-abbrev-expand-hook 0)
    ("edi_guys" "Jim Duerr <Jim.Duerr@Avnet.com>, Pete Davis <Pete.Davis@Avnet.com>, David Sealey <David.Sealey@Avnet.com>, Dewayne Pattison <Dewayne Pattison>" mail-abbrev-expand-hook 0)
    ("englertb" "MSUSHQ11.BENGLE01@eds.com" mail-abbrev-expand-hook 0)
    ("fac" "Fabio Costa <Fabio.Costa@COMPAQ.com>" mail-abbrev-expand-hook 0)
    ("ferkee" "ferkee@metronet.com" mail-abbrev-expand-hook 0)
    ("fiechtl" "Jim Fiechtl <jfiechtl@utmem1.utmem.edu>" mail-abbrev-expand-hook 0)
    ("fierke" "John Fierke <John.Fierke@Avnet.com>" mail-abbrev-expand-hook 0)
    ("fire_list" "Alex Beyer <abeyer@hotmail.com>, Scott Adams <Scott.Adams@Anheuser-Busch.com>, Brian Beyer <beyerb@pweh.com>, Mark Barmeier <mbar02@conagrafrozen.com>, Stuart Beard <sbeard@mdc.com>, Shawn Berry <Shawn.Berry@Bosch-Brakes.com>, Brian Bingham <bbing@mit.edu>, Chris Blaich <rsblaich@qni.com>, Joe Boley <JBoley@Boleytool.com>, Chad Borah <Chad.W.Borah@ac.com>, Brad Borgwald <bborgwald@malisko.com>, James Bossman <jbossman@srob.com>, Jake Brann <jacob.brann@lighting.ge.com>, Don Brown <lil_haas@hotmail.com>, Scott Canty <scanty@lg.com>, Scott Canty 2 <scanty69@hotmail.com>, Brad Clark <bclark@ehancock.com>, Kevin Como <Kcomo@burnsmcd.com>, Doug Morris <dmorris@ti.com>, Chris Dampf <Chris.Dampf@Anheuser-Busch.com>, Jim Fiechtl <jfiechtl@utmem1.utmem.edu>, John Fierke <John.Fierke@Avnet.com>, Tim Garvey <TIGARVE@aol.com>, Rob Girvan <RobGirvan@hotmail.com>, Ashley Govero <jgovero@cz.jcn1.com>, Ed Grimmer <stlepg@am.dames.com>, Phil Hahn <prhahn@qstmail.com>, Scott Haskenhoff <sh72@chrysler.com>, Mark Helein <Mark.Helein@Gatewaycontrolsinc.com>, Travis Helms <thelms@slate.mines.edu>, Howard Hoffman <hoffmaho@pssch.ps.ge.com>, Kevin Hug <khug@memc.com>, Jamar Neal <zagros@walden.mvp.net>, Jamar Neal 2 <zagros@mo.net>, Pete Lassen <plassen@molex.com>, John Lehmbeck <jlehmbec@usedsmta02.lnushub.eds.com>, Scott Light <kandslight@aol.com>, Greg Loomis <gcloomis@mail.delcoelect.com>, Mark Spence <mark.l.spence@na1.monsanto.com>, Marty Voss <martyvoss@paric.com>, Matt McQuality <mhm@geotechnology.com>, Ralph Minor <Ralph@cybermill.com>, Mike Moran <mmoran@zoltek.com>, Kurt Owings <stlkmo@dames.com>, Pat Johnson <pjohnson@apcc.com>, Craig Pidcock <pidcock@searnet.com>, Matt Radman <mnradman@aol.com>, Dan Redington <dtr1@flash.net>, Kevin Riley <rileyelec@vci.net>, Rollie Johnson <rollie@freewwweb.com>, Rollie and_or Pat Johnson <mmjohnson@freewwweb.com>, Ryan Howell <ryanahowell@hotmail.com>, Clint Rybak <cjrybak@shellus.com>, Bob Schneider <RSchnei963@aol.com>, Nathan Seyer <nathan.seyer@reckitt.com>, Craig Sorenson <craigsor@aol.com>, Dale Spence <spence_dale_a@cat.com>, Jason Spiva <jason.m.spiva@jci.com>, Jarrod Stock <stock_jarrod_p@cat.com>, Darren Sullivan <Darren.Sullivan@Anheuser-Busch.com>, Chris Thornton <thorntoc@husch.com>, Rick Tokar <rtokar@memc.com>, Kurt VanHoogstrate <kvanhoogstrate@olicom.com>, Kevin Webb <Webb_Kevin@hotmail.com>, David Wells <david_wells@illinova.com>, Andrew Heap <andrew.d.heap@ac.com>, Mike Guidry <mikeg@custom-metalcraft.com>, Trace Orf <Tracy.Orf@Anheuser-Busch.com>, Dan Wilson <wilson10@ibm.net>, Brian Fortman <bfortman@dal.asp.ti.com>, Benji Canlas <bcanlas@hrznconsulting.com>, Brian Koelling <bkoelling@massman.net>, Brian Jacobs <Brian.Jacobs@us.mw.com>, Donald Dean Myers <dmyers@shuttle.cc.umr.edu>, Michael Brandt <Michael.Brandt@Anheuser-Busch.com>, Ron Longwell <Ronald.Longwell@Anheuser-Busch.com>, Chris Ramsay <cramsay@umr.edu>, John Grater <QA333O@email.mot.com>, Mike Luzcak <ZACK@msg.ti.com>, Kyle Metzloff <metzloff@students.wisc.edu>, Dennis Mink <dmink@ccmail.howmet.com>, Doug Nolkemper <NolkemperDJ@bv.com>, Steve Nussbaum <epa4129@epa.state.il.us>, perry, Jeff Vogt <jlvogt@ra.rockwell.com>, Shawn Slattery <Sslatter@CH2M.com>, Slattery2, Brad Stewart <stewartb@Kendallhq.com>, Larry Gaydos <lgaydos@humanresource2000.com>, Gary 'Seds' Sedlacek(1976) <gsedlacek@JJMA.com>" mail-abbrev-expand-hook 0)
    ("fortman" "Brian Fortman <bfortman@dal.asp.ti.com>" mail-abbrev-expand-hook 0)
    ("friends" "pfierke@nemonet.com (MOM), Scott.Adams@Anheuser-Busch.com (Scott Adams), catmorse@oz.sunflower.org, Bill Alexander <balexand@hpmail2.fwrdc.rtsg.mot.com>, jkf1@ix.netcom.com (Jeff Fierke), jimmie@rmi.net (Jimmie Susan & MacKenzie), skydivedal@aol.com, Rob Girvan <RobGirvan@hotmail.com>, ruscitto@juno.com (Crumb Cake), andy@cohan.org, rufus@3dfx.com, gsanders@3dfx.com (Coo Coo 4 Coco Puffs), Jamar Neal <zagros@walden.mvp.net>, Brad Stewart <stewartb@Kendallhq.com>, Brian Fortman <bfortman@dal.asp.ti.com>" mail-abbrev-expand-hook 0)
    ("frl" "Rich Lickfold <richl@lwcomm.com>" mail-abbrev-expand-hook 0)
    ("fuzzy" "Ron Longwell <Ronald.Longwell@Anheuser-Busch.com>" mail-abbrev-expand-hook 0)
    ("garvey" "Tim Garvey <TIGARVE@aol.com>" mail-abbrev-expand-hook 0)
    ("gary" "seargent@earthlink.net" mail-abbrev-expand-hook 0)
    ("ggs" "gsanders@3dfx.com (Coo Coo 4 Coco Puffs)" mail-abbrev-expand-hook 0)
    ("girvan" "Rob Girvan <RobGirvan@hotmail.com>" mail-abbrev-expand-hook 0)
    ("glg" "Ginger Gatling <ginger.gatling@sap-ag.de>" mail-abbrev-expand-hook 0)
    ("govero" "Ashley Govero <jgovero@cz.jcn1.com>" mail-abbrev-expand-hook 0)
    ("grater" "John Grater <QA333O@email.mot.com>" mail-abbrev-expand-hook 0)
    ("grater2" "John Grater <jgrater@hpmail2.ftw.mot.com>" mail-abbrev-expand-hook 0)
    ("grater3" "John Grater <jgrater@hpmail2.ftw.mot.com>" mail-abbrev-expand-hook 0)
    ("grater_home" "John Grater <jdcsg@netzero.net>" mail-abbrev-expand-hook 0)
    ("greg" "Greg.Lybrand@Avnet.com" mail-abbrev-expand-hook 0)
    ("gregscott" "Greg Scott <gv_scott@hotmail.com>" mail-abbrev-expand-hook 0)
    ("grimmer" "Ed Grimmer <stlepg@am.dames.com>" mail-abbrev-expand-hook 0)
    ("griz" "Scott.Adams@Anheuser-Busch.com (Scott Adams)" mail-abbrev-expand-hook 0)
    ("guidry" "Mike Guidry <mikeg@custom-metalcraft.com>" mail-abbrev-expand-hook 0)
    ("hahn" "Phil Hahn <prhahn@qstmail.com>" mail-abbrev-expand-hook 0)
    ("harry" "R-Lee-Shar-Pei@worldnet.att.net" mail-abbrev-expand-hook 0)
    ("haskenhoff" "Scott Haskenhoff <sh72@chrysler.com>" mail-abbrev-expand-hook 0)
    ("helein" "Mark Helein <Mark.Helein@Gatewaycontrolsinc.com>" mail-abbrev-expand-hook 0)
    ("helms" "Travis Helms <thelms@slate.mines.edu>" mail-abbrev-expand-hook 0)
    ("hockey" "dwe, Trent Mushtaler <trent.mushtaler@sybase.com>, Jeff Thompson <jmt@c2o.com>, andy@cohan.org, Jeff Giesen <jrg@bighorn.dr.lucent.com>, Michael Kirk <mmk@tpd.eds.com>, davism, PLHCSS01.JOMALLEY@eds.com, CISMAIL5.MMILLE01@eds.com" mail-abbrev-expand-hook 0)
    ("hoffman" "Howard Hoffman <hoffmaho@pssch.ps.ge.com>" mail-abbrev-expand-hook 0)
    ("hsc" "Han Chung <han_chung@vantive.com>" mail-abbrev-expand-hook 0)
    ("hug" "Kevin Hug <khug@memc.com>" mail-abbrev-expand-hook 0)
    ("hywel" "Hywel Francis <Hywel.Francis@Avnet.com>" mail-abbrev-expand-hook 0)
    ("inlaws" "bina@shellus.com, tgh@us.prismtechnologies.com, wghoward@webzone.net, wpartin@motheral.com, cprince@shelton.org, anita, bhdesign@brendahowarddesign.com" mail-abbrev-expand-hook 0)
    ("jacobs" "Brian Jacobs <Brian.Jacobs@us.mw.com>" mail-abbrev-expand-hook 0)
    ("jah" "Jay Halvorson <jah@c2o.com>" mail-abbrev-expand-hook 0)
    ("jamar" "Jamar Neal <zagros@walden.mvp.net>" mail-abbrev-expand-hook 0)
    ("jamar2" "Jamar Neal 2 <zagros@mo.net>" mail-abbrev-expand-hook 0)
    ("jamey" "Jamey Johnson <jamey@sechq.com>" mail-abbrev-expand-hook 0)
    ("jana" "kayj" mail-abbrev-expand-hook 0)
    ("janet" "roznovsj" mail-abbrev-expand-hook 0)
    ("jayell" "Burt Juarez <bj@tpd.eds.com>, Brenda *L* Schlender <SchlenderB@MaryKay.com>, castellt, czekajj, Dave Huggins <dah@tpd.eds.com>, Dave Beck <dbb@tpd.eds.com>, Dave Musgrave <dcm@tpd.eds.com>, Fabio Costa <Fabio.Costa@COMPAQ.com>, Ginger Gatling <ginger.gatling@sap-ag.de>, Han Chung <han_chung@vantive.com>, \\, Jay Halvorson <jah@c2o.com>, Jerome Obinabo <jobinabo@eriver.com>, Jeff Thompson <jmt@c2o.com>, Jonathan Polk <Jonathan_Polk@amrcorp.com>, Jeff Giesen <jrg@bighorn.dr.lucent.com>, Kyle Messerschmitt <kmessers@inm.eds.com>, Ken Zotigh <ken_zotigh@yahoo.com>, x <y>, Leonard Crowe <lcrowe@c2o.com>, Len Catanach <lpc@c2o.com>, Michael Kirk <mmk@tpd.eds.com>, Mike Ellis <mse@tpd.eds.com>, \\, Russell Scott <rds@tpd.eds.com>, Ruston Vickers <rvickers@eriver.com>, x <y>, x <y>, Troy Price <trp@tpd.eds.com>, Trent Mushtaler <trent.mushtaler@sybase.com>" mail-abbrev-expand-hook 0)
    ("jco" "Jerome Obinabo <jobinabo@eriver.com>" mail-abbrev-expand-hook 0)
    ("jeff" "jkf1@ix.netcom.com (Jeff Fierke)" mail-abbrev-expand-hook 0)
    ("jim" "Jim Duerr <Jim.Duerr@Avnet.com>" mail-abbrev-expand-hook 0)
    ("jim2" "JKelly@cgi.com (Jimmie L Kelly)" mail-abbrev-expand-hook 0)
    ("jimmie" "jimmie@rmi.net (Jimmie Susan & MacKenzie)" mail-abbrev-expand-hook 0)
    ("jimmie2" "JKelly@cgi.com (Jimmie L Kelly)" mail-abbrev-expand-hook 0)
    ("jmt" "Jeff Thompson <jmt@c2o.com>" mail-abbrev-expand-hook 0)
    ("jnp" "Jonathan Polk <Jonathan_Polk@amrcorp.com>" mail-abbrev-expand-hook 0)
    ("jokes" "sentersb@tpd.eds.com, rufus@3dfx.com, andy@cohan.org, Ken Zotigh <ken_zotigh@yahoo.com>, Jeff Thompson <jmt@c20.com>, Jonathan Polk <jnp@tpd.eds.com>, x <y>, Mike Ellis <mse@tpd.eds.com>, HendricS@tpd.eds.com, kayj, Michael Kirk <mmk@tpd.eds.com>, catmorse@oz.sunflower.org, jvieth3989@aol.com, balexand@ftw.mot.com (Bill Alexander), jimmie@rmi.net (Jimmie Susan & MacKenzie), jkf1@ix.netcom.com (Jeff Fierke), Chuck Ketterer <KettererC@emotors.com>, Brad Stewart <stewarb6@baxter.com>, Brian Fortman <bfortman@cadence.com>, Jamey Johnson <jamey@sechq.com>, Mike Luzcak <ZACK@msg.ti.com>, Ed Grimmer <stlepg@am.dames.com>, Jamar Neal <zagros@walden.mvp.net>" mail-abbrev-expand-hook 0)
    ("jokes_out" "catmorse@oz.sunflower.org, jimmie@rmi.net (Jimmie Susan & MacKenzie), jkf1@ix.netcom.com (Jeff Fierke)" mail-abbrev-expand-hook 0)
    ("jokes_pika" "Dave Zimmerman <zimmroid@aol.com>, Dan Redington <dtr1@flash.net>, Jamey Johnson <jamey@sechq.com>, Michael Brandt <Michael.Brandt@Anheuser-Busch.com>, Jeff Vogt <jlvogt@ra.rockwell.com>, Mike Luzcak <ZACK@msg.ti.com>, Doug Nolkemper <NolkemperDJ@bv.com>, Trace Orf <Tracy.Orf@Anheuser-Busch.com>, Brian Fortman <bfortman@dal.asp.ti.com>, Chris Thornton <thorntoc@husch.com>, Mark Helein <Mark.Helein@Gatewaycontrolsinc.com>, Rick Tokar <rtokar@memc.com>, Ralph Minor <Ralph@cybermill.com>, Scott Light <kandslight@aol.com>, Tom Polcyn <Polcyn@HowellHafer.com>, Aaron Solomon <aronlayn@pacbell.net>, Brad Stewart <stewartb@Kendallhq.com>, Shawn Slattery <Sslatter@CH2M.com>, Dan Wilson <wilson10@ibm.net>, Kurt VanHoogstrate <kvanhoogstrate@olicom.com>, Pete Lassen <plassen@molex.com>, Keith Webb <kwebb@owenton.rms.slb.com>, Bob Schneider <RSchnei963@aol.com>, Ed Grimmer <stlepg@am.dames.com>, Jamar Neal <zagros@walden.mvp.net>, James Bossman <jbossman@srob.com>, Kevin Riley <rileyelec@vci.net>, Kevin Webb <Webb_Kevin@hotmail.com>, Kurt Owings <stlkmo@dames.com>, Matt Radman <mnradman@aol.com>, Rob Girvan <RobGirvan@hotmail.com>, Scott Adams <Scott.Adams@Anheuser-Busch.com>, Terry Shockley <shockltr@sverdrup.com>, Rob Tokar <robbob@i1.net>, John Grater <jgrater@hpmail2.ftw.mot.com>, Brad Borgwald <bborgwald@malisko.com>, Clint Rybak <cjrybak@shellus.com>, Craig Sorenson <craigsor@aol.com>, Dale Spence <spence_dale_a@cat.com>, Darren Sullivan <Darren.Sullivan@Anheuser-Busch.com>, Kevin Hug <khug@memc.com>, Mark Barmeier <mbar02@conagrafrozen.com>, Mark Spence <mark.l.spence@na1.monsanto.com>, Marty Voss <martyvoss@paric.com>, Matt McQuality <mhm@geotechnology.com>, Mike Moran <mmoran@zoltek.com>, Pat Johnson <pjohnson@apcc.com>, Phil Hahn <prhahn@qstmail.com>, Scott Canty <scanty@lg.com>, Scott Haskenhoff <sh72@chrysler.com>, Benji Canlas <bcanlas@hrznconsulting.com>, Mike Guidry <mikeg@custom-metalcraft.com>, Stuart Beard <sbeard@mdc.com>, Shawn Berry <Shawn.Berry@Bosch-Brakes.com>, Ross Thomas <rthomass@redwood.dn.hac.com>, Craig Cullen <craig_cullen@chppmeur.army.mil>, Ron Longwell <Ronald.Longwell@Anheuser-Busch.com>, Alex Beyer <abeyer@hotmail.com>, Brian Beyer <beyerb@pweh.com>, Chris Blaich <rsblaich@qni.com>, Chris Dampf <Chris.Dampf@Anheuser-Busch.com>, Craig Pidcock <pidcock@searnet.com>, Greg Loomis <gcloomis@mail.delcoelect.com>, Jim Fiechtl <jfiechtl@utmem1.utmem.edu>, Joe Boley <JBoley@Boleytool.com>, Kevin Como <Kcomo@burnsmcd.com>, Ryan Howell <ryanahowell@hotmail.com>, Brian Jacobs <Brian.Jacobs@us.mw.com>, Andrew Heap <andrew.d.heap@ac.com>, Brian Bingham <bbing@mit.edu>, Chad Borah <Chad.W.Borah@ac.com>, Don Brown <lil_haas@hotmail.com>, Brad Clark <bclark@ehancock.com>, Ashley Govero <jgovero@cz.jcn1.com>, Jarrod Stock <stock_jarrod_p@cat.com>, David Wells <david_wells@illinova.com>" mail-abbrev-expand-hook 0)
    ("jokes_pka" "Dave Zimmerman <zimmroid@aol.com>, Dan Redington <redingt@swbell.net>, Jamey Johnson <jamey@sechq.com>, Michael Brandt <Michael.Brandt@Anheuser-Busch.com>, Jeff Vogt <jlvogt@abpost.remnet.ab.com>, Mike Luzcak <ZACK@msg.ti.com>, Doug Nolkemper <NolkemperDJ@bv.com>, Trace Orf <Tracy.Orf@Anheuser-Busch.com>, Brian Fortman <bfortman@cadence.com>, Chris Thornton <chris.thornton@husch.com>, Mark Helein <Mark.Helein@Gatewaycontrolsinc.com>, Rick Tokar <rtokar@memc.com>, Ralph Minor <Ralph@cybermill.com>, Scott Light <kandslight@aol.com>, Tom Polcyn <Polcyn@HowellHafer.com>, Aaron Solomon <aronlayn@pacbell.net>, Brad Stewart <stewarb6@baxter.com>, Shawn Slattery <Sslatter@CH2M.com>, Dan Wilson <wilson10@ibm.net>, Kurt VanHoogstrate <kvanhoogstrate@olicom.com>, Pete Lassen <plassen@molex.com>, Keith Webb <kwebb@owenton.rms.slb.com>, Bob Schneider <schneiderr@hwr.com>, Ed Grimmer <stlepg@am.dames.com>, Jamar Neal <zagros@walden.mvp.net>, James Bossman <jbossman@srob.com>, Kevin Riley <rileyelec@vci.net>, Kevin Webb <Webb_Kevin@hotmail.com>, Kurt Owings <stlkmo@dames.com>, Matt Radman <mnradman@aol.com>, Rob Girvan <RobGirvan@hotmail.com>, Scott Adams <Scott.Adams@Anheuser-Busch.com>, Terry Shockley <shockltr@sverdrup.com>, Rob Tokar <robbob@i1.net>, John Grater <jgrater@hpmail2.ftw.mot.com>, Brad Borgwald <bborgwald@malisko.com>, Clint Rybak <cjrybak@shellus.com>, Craig Sorenson <craigsor@aol.com>, Dale Spence <spence_dale_a@cat.com>, Darren Sullivan <Darren.Sullivan@Anheuser-Busch.com>, Kevin Hug <khug@memc.com>, Mark Barmeier <mbar02@conagrafrozen.com>, Mark Spence <mark.l.spence@monsanto.com>, Marty Voss <mvoss@schnucks.com>, Matt McQuality <mhm@geotechnology.com>, Mike Moran <mmoran@zoltek.com>, Pat Johnson <pjohnson@apcc.com>, Phil Hahn <prhahn@qstmail.com>, Scott Canty <scanty@lg.com>, Scott Haskenhoff <sh72@chrysler.com>, Benji Canlas <Ben_T_Canlas@auto.ittind.com>, Mike Guidry <mikeg@custom-metalcraft.com>, Stuart Beard <sbeard@mdc.com>, Shawn Berry <Shawn.Berry@Bosch-Brakes.com>, Ross Thomas <rthomass@redwood.dn.hac.com>, Craig Cullen <craig_cullen@chppmeur.army.mil>, Ron Longwell <Ron.Longwell@Anheuser-Busch.com>, Alex Beyer <abeyer@hotmail.com>, Brian Beyer <beyerb@pweh.com>, Chris Blaich <rsblaich@qni.com>, Chris Dampf <Chris.Dampf@Anheuser-Busch.com>, Craig Pidcock <pidcock@searnet.com>, Greg Loomis <gcloomis@mail.delcoelect.com>, Jim Fiechtl <jfiechtl@utmem1.utmem.edu>, Joe Boley <JBoley@Boleytool.com>, Kevin Como <Kcomo@burnsmcd.com>, Ryan Howell <ryanahowell@hotmail.com>, Brian Jacobs <Brian.Jacobs@us.mw.com>" mail-abbrev-expand-hook 0)
    ("jokes_tpd" "rufus@3dfx.com, Bret Senters <bret.senters@exmi01.exch.eds.com>, Fabio Costa <Fabio.Costa@COMPAQ.com>, gsanders@3dfx.com (Coo Coo 4 Coco Puffs), Jay Halvorson <jah@c2o.com>, Jerome Obinabo <jobinabo@eriver.com>, Jeff Thompson <jmt@c2o.com>, Jonathan Polk <Jonathan_Polk@amrcorp.com>, Ken Zotigh <ken_zotigh@yahoo.com>, Leonard Crowe <lcrowe@c2o.com>, Len Catanach <lpc@c2o.com>, Michael Kirk <mmk@tpd.eds.com>, Mike Ellis <mse@tpd.eds.com>, Ruston Vickers <rvickers@eriver.com>, Troy Price <trp@tpd.eds.com>, Trent Mushtaler <trent.mushtaler@sybase.com>, Jeff Giesen <jrg@bighorn.dr.lucent.com>, Burt Juarez <bj@tpd.eds.com>, andy@cohan.org, Ginger Gatling <ginger.gatling@sap-ag.de>, Han Chung <han_chung@vantive.com>, Kyle Messerschmitt <kmessers@inm.eds.com>, Russell Scott <rds@tpd.eds.com>, kayj" mail-abbrev-expand-hook 0)
    ("jokes_work" "Greg.Lybrand@Avnet.com, John.Raab@Avnet.com, Charles.Morgan@Avnet.com, Brooks Harkey <Brooks.Harkey@Avnet.com>, Jim Duerr <Jim.Duerr@Avnet.com>, Pete Davis <Pete.Davis@Avnet.com>, David Sealey <David.Sealey@Avnet.com>, Dewayne Pattison <Dewayne Pattison>" mail-abbrev-expand-hook 0)
    ("jrg" "Jeff Giesen <jrg@bighorn.dr.lucent.com>" mail-abbrev-expand-hook 0)
    ("julia" "SkyJulia@aol.com" mail-abbrev-expand-hook 0)
    ("jwf" "John.Fierke@Avnet.com (John Fierke)" mail-abbrev-expand-hook 1)
    ("kara" "kadams@hannibal.k12.mo.us (Kara Adams)" mail-abbrev-expand-hook 0)
    ("karen" "xkkenton@dskmail.itg.ti.com" mail-abbrev-expand-hook 0)
    ("kdwebb" "Keith Webb <kwebb@owenton.rms.slb.com>" mail-abbrev-expand-hook 0)
    ("kim" "ruscitto@juno.com (Crumb Cake)" mail-abbrev-expand-hook 0)
    ("kjm" "Kyle Messerschmitt <kmessers@inm.eds.com>" mail-abbrev-expand-hook 0)
    ("klz" "Ken Zotigh <ken_zotigh@yahoo.com>" mail-abbrev-expand-hook 0)
    ("koelling" "Brian Koelling <bkoelling@massman.net>" mail-abbrev-expand-hook 0)
    ("korbin" "Korbin_King@notes.pw.com" mail-abbrev-expand-hook 0)
    ("landry" "Christopher_J_Landry@kpmg.com" mail-abbrev-expand-hook 0)
    ("lar" "x <y>" mail-abbrev-expand-hook 0)
    ("larry" "MSUSDS01.SCHREILA@eds.com" mail-abbrev-expand-hook 0)
    ("lassen" "Pete Lassen <plassen@molex.com>" mail-abbrev-expand-hook 0)
    ("lehmbeck" "John Lehmbeck <jlehmbec@usedsmta02.lnushub.eds.com>" mail-abbrev-expand-hook 0)
    ("lgaydos" "Larry Gaydos <lgaydos@humanresource2000.com>" mail-abbrev-expand-hook 0)
    ("light" "Scott Light <kandslight@aol.com>" mail-abbrev-expand-hook 0)
    ("llc" "Leonard Crowe <lcrowe@c2o.com>" mail-abbrev-expand-hook 0)
    ("loomis" "Greg Loomis <gcloomis@mail.delcoelect.com>" mail-abbrev-expand-hook 0)
    ("lpc" "Len Catanach <lpc@c2o.com>" mail-abbrev-expand-hook 0)
    ("luczak" "Mike Luzcak <ZACK@msg.ti.com>" mail-abbrev-expand-hook 0)
    ("marji" "Marjorie.Bishir@Avnet.com" mail-abbrev-expand-hook 0)
    ("mark" "CISMAIL5.MMILLE01@eds.com" mail-abbrev-expand-hook 0)
    ("marty" "Marty Voss <martyvoss@paric.com>" mail-abbrev-expand-hook 0)
    ("marty2" "Marty Voss <MAV@schnucks.com>" mail-abbrev-expand-hook 0)
    ("mcquality" "Matt McQuality <mhm@geotechnology.com>" mail-abbrev-expand-hook 0)
    ("metzloff" "Kyle Metzloff <metzloff@students.wisc.edu>" mail-abbrev-expand-hook 0)
    ("mink" "Dennis Mink <dmink@ccmail.howmet.com>" mail-abbrev-expand-hook 0)
    ("minor" "Ralph Minor <Ralph@cybermill.com>" mail-abbrev-expand-hook 0)
    ("mirkes" "mirkes@cs.washington.edu" mail-abbrev-expand-hook 0)
    ("mmk" "Michael Kirk <mmk@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("mocker" "Dave Mocker <Mocker@compuserve.com>" mail-abbrev-expand-hook 0)
    ("mom" "pfierke@nemonet.com (MOM)" mail-abbrev-expand-hook 0)
    ("moose" "pikemoose@aol.com" mail-abbrev-expand-hook 0)
    ("moran" "Mike Moran <mmoran@zoltek.com>" mail-abbrev-expand-hook 0)
    ("mozelakp" "MSUSHQ11.PMOZEL01@eds.com" mail-abbrev-expand-hook 0)
    ("mse" "Mike Ellis <mse@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("mspence" "Mark Spence <mark.l.spence@na1.monsanto.com>" mail-abbrev-expand-hook 0)
    ("mss_coit" "abbotta, ellisonl, thompsju, websters" mail-abbrev-expand-hook 0)
    ("nolkemper" "Doug Nolkemper <NolkemperDJ@bv.com>" mail-abbrev-expand-hook 0)
    ("nussbaum" "Steve Nussbaum <epa4129@epa.state.il.us>" mail-abbrev-expand-hook 0)
    ("obscene" "Scott.Adams@Anheuser-Busch.com (Scott Adams), jimmie@rmi.net (Jimmie Susan & MacKenzie), jkf1@ix.netcom.com (Jeff Fierke), catmorse@oz.sunflower.org" mail-abbrev-expand-hook 0)
    ("obscene_tpd" "rufus@3dfx.com, Bret Senters <bret.senters@exmi01.exch.eds.com>, Fabio Costa <Fabio.Costa@COMPAQ.com>, gsanders@3dfx.com (Coo Coo 4 Coco Puffs), Jay Halvorson <jah@c2o.com>, Jerome Obinabo <jobinabo@eriver.com>, Jeff Thompson <jmt@c2o.com>, Jonathan Polk <Jonathan_Polk@amrcorp.com>, Ken Zotigh <ken_zotigh@yahoo.com>, Leonard Crowe <lcrowe@c2o.com>, Len Catanach <lpc@c2o.com>, Michael Kirk <mmk@tpd.eds.com>, Mike Ellis <mse@tpd.eds.com>, Ruston Vickers <rvickers@eriver.com>, Troy Price <trp@tpd.eds.com>, Trent Mushtaler <trent.mushtaler@sybase.com>, Jeff Giesen <jrg@bighorn.dr.lucent.com>" mail-abbrev-expand-hook 0)
    ("obscene_wk" "x <y>, Burt Juarez <bj@tpd.eds.com>, Jeff Thompson <jmt@c20.com>, Ken Zotigh <ken_zotigh@yahoo.com>, x <y>, Fabio Costa <facosta@amcham.com.br>, Jonathan Polk <jnp@tpd.eds.com>, Mike Ellis <mse@tpd.eds.com>, Michael Kirk <mmk@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("older_alum" "Larry Gaydos <lgaydos@humanresource2000.com>, Gary 'Seds' Sedlacek(1976) <gsedlacek@JJMA.com>" mail-abbrev-expand-hook 0)
    ("omalley" "PLHCSS01.JOMALLEY@eds.com" mail-abbrev-expand-hook 0)
    ("owings" "Kurt Owings <stlkmo@dames.com>" mail-abbrev-expand-hook 0)
    ("pete" "Pete Davis <Pete.Davis@Avnet.com>" mail-abbrev-expand-hook 0)
    ("pidcock" "Craig Pidcock <pidcock@searnet.com>" mail-abbrev-expand-hook 0)
    ("pikelist" "PIKA@SJUVM.STJOHNS.EDU" mail-abbrev-expand-hook 0)
    ("pikes" "me, Chuck Ketterer <KettererC@emotors.com>, Dan Redington <dtr1@flash.net>, Doug Morris <dmorris@ti.com>, Brian Fortman <bfortman@dal.asp.ti.com>, Tim Garvey <TIGARVE@aol.com>, John Grater <QA333O@email.mot.com>, Ed Grimmer <stlepg@am.dames.com>, \\, Scott.Adams@Anheuser-Busch.com (Scott Adams), Jamar Neal <zagros@walden.mvp.net>, Jamey Johnson <jamey@sechq.com>, Mike Luzcak <ZACK@msg.ti.com>, Kyle Metzloff <metzloff@students.wisc.edu>, Doug Nolkemper <NolkemperDJ@bv.com>, Steve Nussbaum <epa4129@epa.state.il.us>, orf, \\, perry, Tom Polcyn <Polcyn@HowellHafer.com>, quinn, Chris Ramsay <cramsay@umr.edu>, Shawn Slattery <Sslatter@CH2M.com>, Brad Stewart <stewartb@Kendallhq.com>, sully, Kurt VanHoogstrate <kvanhoogstrate@olicom.com>, \\, Jeff Vogt <jlvogt@ra.rockwell.com>, undergrads" mail-abbrev-expand-hook 0)
    ("pikes_hq" "74777.3063@compuserve.com" mail-abbrev-expand-hook 0)
    ("pikes_us" "mirkes@cs.washington.edu" mail-abbrev-expand-hook 0)
    ("pj" "Pat Johnson <pjohnson@apcc.com>" mail-abbrev-expand-hook 0)
    ("pjozwiak" "Phil Jozwiak <paj@geotechnology.com>" mail-abbrev-expand-hook 0)
    ("polcyn" "Tom Polcyn <Polcyn@HowellHafer.com>" mail-abbrev-expand-hook 0)
    ("raab" "John.Raab@Avnet.com" mail-abbrev-expand-hook 0)
    ("radman" "Matt Radman <mnradman@aol.com>" mail-abbrev-expand-hook 0)
    ("ramsay" "Chris Ramsay <cramsay@umr.edu>" mail-abbrev-expand-hook 0)
    ("rbay" "Rick Bay <rick.bay@reckitt.com>" mail-abbrev-expand-hook 0)
    ("rds" "Russell Scott <rds@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("redington" "Dan Redington <dtr1@flash.net>" mail-abbrev-expand-hook 0)
    ("redington_wk" "Dan Redington <dtr@fore.com>" mail-abbrev-expand-hook 0)
    ("regina" "regmil@swbell.net" mail-abbrev-expand-hook 0)
    ("rfv" "Ruston Vickers <rvickers@eriver.com>" mail-abbrev-expand-hook 0)
    ("ricktokar" "Rick Tokar <rtokar@memc.com>" mail-abbrev-expand-hook 0)
    ("riley" "Kevin Riley <rileyelec@vci.net>" mail-abbrev-expand-hook 0)
    ("robtokar" "Rob Tokar <robbob@i1.net>" mail-abbrev-expand-hook 0)
    ("rollie" "Rollie Johnson <rollie@freewwweb.com>" mail-abbrev-expand-hook 0)
    ("rollieorpat" "Rollie and_or Pat Johnson <mmjohnson@freewwweb.com>" mail-abbrev-expand-hook 0)
    ("rthomas" "Ross Thomas <rthomass@redwood.dn.hac.com>" mail-abbrev-expand-hook 0)
    ("ryan" "Ryan Howell <ryanahowell@hotmail.com>" mail-abbrev-expand-hook 0)
    ("rybak" "Clint Rybak <cjrybak@shellus.com>" mail-abbrev-expand-hook 0)
    ("schneider" "Bob Schneider <RSchnei963@aol.com>" mail-abbrev-expand-hook 0)
    ("schneider2" "Bob Schneider <schneiderr@hwr.com>" mail-abbrev-expand-hook 0)
    ("schut" "Tom.Schulteis@Avnet.com (Tom Schulteis)" mail-abbrev-expand-hook 2)
    ("sdavis" "Scott Davis <sdavis@burnsmcd.com>" mail-abbrev-expand-hook 0)
    ("sealey" "David Sealey <David.Sealey@Avnet.com>" mail-abbrev-expand-hook 0)
    ("sedlacek" "Gary 'Seds' Sedlacek(1976) <gsedlacek@JJMA.com>" mail-abbrev-expand-hook 0)
    ("seyer" "Nathan Seyer <nathan.seyer@reckitt.com>" mail-abbrev-expand-hook 0)
    ("silgan" "jfierke@silganmfg.com (Jeff Fierke)" mail-abbrev-expand-hook 0)
    ("slattery" "Shawn Slattery <Sslatter@CH2M.com>" mail-abbrev-expand-hook 0)
    ("solomon" "Aaron Solomon <aronlayn@pacbell.net>" mail-abbrev-expand-hook 0)
    ("sorenson" "Craig Sorenson <craigsor@aol.com>" mail-abbrev-expand-hook 0)
    ("spence" "Dale Spence <spence_dale_a@cat.com>" mail-abbrev-expand-hook 0)
    ("spiva" "Jason Spiva <jason.m.spiva@jci.com>" mail-abbrev-expand-hook 0)
    ("spurrg" "x <y>" mail-abbrev-expand-hook 0)
    ("ssmith" "Stacey Smith <ssmith@protein.com>" mail-abbrev-expand-hook 0)
    ("stewey" "Brad Stewart <stewartb@Kendallhq.com>" mail-abbrev-expand-hook 0)
    ("stock" "Jarrod Stock <stock_jarrod_p@cat.com>" mail-abbrev-expand-hook 0)
    ("sullivan" "Darren Sullivan <Darren.Sullivan@Anheuser-Busch.com>" mail-abbrev-expand-hook 0)
    ("susan" "HendricS@tpd.eds.com" mail-abbrev-expand-hook 0)
    ("tdg" "x <y>" mail-abbrev-expand-hook 0)
    ("tdk" "Tom Knodell <TomK@HeatAndControl.com>" mail-abbrev-expand-hook 0)
    ("thetokars" "Tokar <the.tokars@worldnet.att.net>" mail-abbrev-expand-hook 0)
    ("thornton" "Chris Thornton <thorntoc@husch.com>" mail-abbrev-expand-hook 0)
    ("tim" "tgh@us.prismtechnologies.com" mail-abbrev-expand-hook 0)
    ("tokar" #("R Tokar <rtokar@memc.com>" 0 25 (face font-lock-string-face)) mail-abbrev-expand-hook 0)
    ("tom" "Tom Knodell <TomK@HeatandControl.com>" mail-abbrev-expand-hook 0)
    ("trace" "Trace Orf <Tracy.Orf@Anheuser-Busch.com>" mail-abbrev-expand-hook 0)
    ("trish" "Patricia Ruma Spence <pspence@extraprise.com>" mail-abbrev-expand-hook 0)
    ("trp" "Troy Price <trp@tpd.eds.com>" mail-abbrev-expand-hook 0)
    ("tshockley" "Terry Shockley <shockltr@sverdrup.com>" mail-abbrev-expand-hook 0)
    ("tsm" "Trent Mushtaler <trent.mushtaler@sybase.com>" mail-abbrev-expand-hook 0)
    ("unknowns" "John Grater <QA333O@email.mot.com>, Mike Luzcak <ZACK@msg.ti.com>, Kyle Metzloff <metzloff@students.wisc.edu>, Dennis Mink <dmink@ccmail.howmet.com>, Doug Nolkemper <NolkemperDJ@bv.com>, Steve Nussbaum <epa4129@epa.state.il.us>, perry, Jeff Vogt <jlvogt@ra.rockwell.com>, Shawn Slattery <Sslatter@CH2M.com>, Slattery2, Brad Stewart <stewartb@Kendallhq.com>" mail-abbrev-expand-hook 0)
    ("vanhoog" "Kurt VanHoogstrate <kvanhoogstrate@olicom.com>" mail-abbrev-expand-hook 0)
    ("vb2" "Christopher_J_Landry@kpmg.com, CISMAIL5.MMILLE01@eds.com, MSUSDS01.SCHREILA@eds.com, Korbin_King@notes.pw.com, alan" mail-abbrev-expand-hook 0)
    ("vb3" "Burt Juarez <bj@tpd.eds.com>, headleyc, bownesb, davism, beckd" mail-abbrev-expand-hook 0)
    ("vball" "Christopher_J_Landry@kpmg.com, CISMAIL5.MMILLE01@eds.com, MSUSDS01.SCHREILA@eds.com, Korbin_King@notes.pw.com, alan, Burt Juarez <bj@tpd.eds.com>, headleyc, bownesb, davism, beckd, Trent Mushtaler <trent.mushtaler@sybase.com>, Jerome Obinabo <jobinabo@eriver.com>, Jeff Giesen <jrg@bighorn.dr.lucent.com>, Jeff Thompson <jmt@c2o.com>, Jonathan Polk <Jonathan_Polk@amrcorp.com>, hendrics, kayj, Michael Kirk <mmk@tpd.eds.com>, Fabio Costa <Fabio.Costa@COMPAQ.com>, x <y>" mail-abbrev-expand-hook 0)
    ("vogt" "Jeff Vogt <jlvogt@ra.rockwell.com>" mail-abbrev-expand-hook 0)
    ("walth" "wghoward@webzone.net" mail-abbrev-expand-hook 0)
    ("waltp" "wpartin@motheral.com" mail-abbrev-expand-hook 0)
    ("webb" "Kevin Webb <Webb_Kevin@hotmail.com>" mail-abbrev-expand-hook 0)
    ("wells" "David Wells <david_wells@illinova.com>" mail-abbrev-expand-hook 0)
    ("whitney" "wshipley@sunflowr.usd.edu (Whitney Shipley)" mail-abbrev-expand-hook 0)
    ("wilson" "Dan Wilson <wilson10@ibm.net>" mail-abbrev-expand-hook 0)
    ("zimmerman" "Dave Zimmerman <zimmroid@aol.com>" mail-abbrev-expand-hook 0)
   ))

(define-abbrev-table 'makefile-automake-mode-abbrev-table '())

(define-abbrev-table 'makefile-bsdmake-mode-abbrev-table '())

(define-abbrev-table 'makefile-gmake-mode-abbrev-table '())

(define-abbrev-table 'makefile-imake-mode-abbrev-table '())

(define-abbrev-table 'makefile-makepp-mode-abbrev-table '())

(define-abbrev-table 'makefile-mode-abbrev-table '())

(define-abbrev-table 'message-mode-abbrev-table '())

(define-abbrev-table 'meta-mode-abbrev-table '())

(define-abbrev-table 'nroff-mode-abbrev-table '())

(define-abbrev-table 'objc-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'occur-edit-mode-abbrev-table '())

(define-abbrev-table 'occur-mode-abbrev-table '())

(define-abbrev-table 'octave-abbrev-table
  '(
    ("`a" "all_va_args" nil 0)
    ("`b" "break" nil 0)
    ("`c" "continue" nil 0)
    ("`ca" "catch" nil 0)
    ("`cs" "case" nil 0)
    ("`ef" "endfor" nil 0)
    ("`efu" "endfunction" nil 0)
    ("`ei" "endif" nil 0)
    ("`el" "else" nil 0)
    ("`eli" "elseif" nil 0)
    ("`es" "endswitch" nil 0)
    ("`et" "end_try_catch" nil 0)
    ("`eu" "end_unwind_protect" nil 0)
    ("`ew" "endwhile" nil 0)
    ("`f" "for" nil 0)
    ("`fu" "function" nil 0)
    ("`gl" "global" nil 0)
    ("`gp" "gplot" nil 0)
    ("`gs" "gsplot" nil 0)
    ("`if" "if ()" nil 0)
    ("`o" "otherwise" nil 0)
    ("`r" "return" nil 0)
    ("`rp" "replot" nil 0)
    ("`s" "switch" nil 0)
    ("`t" "try" nil 0)
    ("`up" "unwind_protect" nil 0)
    ("`upc" "unwind_protect_cleanup" nil 0)
    ("`w" "while ()" nil 0)
   ))

(define-abbrev-table 'org-mode-abbrev-table '())

(define-abbrev-table 'outline-mode-abbrev-table '())

(define-abbrev-table 'package-menu-mode-abbrev-table '())

(define-abbrev-table 'pascal-mode-abbrev-table '())

(define-abbrev-table 'perl-mode-abbrev-table
  '(
    ("cgicheckbox" "$cgi->checkbox(-name=>'~(prompt name \"Name: \")',
                                -checked=>'~(if (prompt checked \"Checked: [No] \") \"CHECKED\" \"\")',
                                -value=>'~(prompt value \"Checked Value: \")',
                                -label=>'~(prompt label \"Label : \")',
                                -onClick=>''
)~@ 
" dmacro-indent 0)
    ("cgicheckboxgrp" "$cgi->checkbox_group(-name=>'~(prompt group_name \"Name: \")',
                                -values=>[],
                                -default=>[],
                                -size=>'~(prompt size \"Menu Size: \")',
                                -linebreak=>'~(if (prompt break \"Linebreak: [Yes] \") \"false\" \"true\")',
                                -labels=>%labels,
                                -rows=>'~(prompt rows \"Rows: \")', -columns=>'~(prompt cols \"Columns: \")',
                                -rowheader=>'', -colheader=>'',
                                -onClick=>''
)~@ 
" dmacro-indent 0)
    ("cgiform" "$cgi->startform( -name=>'~(prompt form_name \"Name: \")',
                    -action=>'~(prompt action \"Action: \")',
                    -method=>\"POST\",
                    -onSubmit=>'~(prompt onSubmit \"onSubmit: \")',
                    )~@
" dmacro-indent 0)
    ("cgiheader" "$cgi->start_html(-title=>'~(prompt title \"Title: \")',
                            -author=>'John.Fierke@Avnet.com',
                            -target=>'_self',
                            -BGCOLOR=>\"White\",
                            -onLoad=>'',
                            -script=>{ -language=>'JAVASCRIPT', -src=>'' }
);
~@
" dmacro-indent 0)
    ("cgihidden" "$cgi->hidden(-name=>'~(prompt name \"Name: \")', -default=>'~(prompt value \"Value(s): \")'
)~@
" dmacro-indent 0)
    ("cgipopupmenu" "$cgi->popup_menu(-name=>'~(prompt popup_name \"Name: \")',
                                -values=>[],
                                -default=>[],
                                -labels=>%labels,
                                -onChange=>''
)~@ 
" dmacro-indent 0)
    ("cgiradiogrp" "$cgi->radio_group(-name=>'~(prompt group_name \"Name: \")',
                                -values=>[],
                                -default=>'',
                                -linebreak=>'~(if (prompt break \"Linebreak: [Yes] \") \"false\" \"true\")',
                                -labels=>%labels,
                                -rows=>'~(prompt rows \"Rows: \")', -columns=>'~(prompt cols \"Columns: \")',
                                -rowheader=>'', -colheader=>'',
                                -onClick=>''
)~@ 
" dmacro-indent 0)
    ("cgiscrollinglist" "$cgi->scrolling_list(-name=>'~(prompt popup_name \"Name: \")',
                                -values=>[],
                                -default=>[],
                                -size=>'~(prompt size \"Menu Size: \")',
                                -multiple=>'~(if (prompt mult \"Multiple: [No] \") \"true\" \"false\")',
                                -labels=>%labels,
                                -onChange=>''
)~@ 
" dmacro-indent 0)
    ("cgisubmit" "$cgi->submit(-name=>'~(prompt name \"Name: \")', -value=>'~(prompt value \"Value: \")',
                                -onClick=>''
)~@
" dmacro-indent 0)
    ("cgitxtarea" "$cgi->textarea(-name=>'~(prompt area_name \"Name: \")',
                    -default=>'~(prompt default \"Default Value: \")',
                    -rows=>'~(prompt rows \"Rows: \")',
                    -cols=>'~(prompt cols \"Columns: \")',
                    )~@
" dmacro-indent 0)
    ("cgitxtfield" "$cgi->textfield(-name=>'~(prompt field_name \"Name: \")',
                    -default=>'~(prompt default \"Default Value: \")',
                    -override=>1,
                    -size=>'~(prompt size \"Field Size: \")',
                    -maxlength=>'~(prompt max \"Max Length: \")',
                    -onChange=>'', -onFocus=>'', -onBlur=>'', -onSelect=>'' 
                    )~@
" dmacro-indent 0)
    ("jf" "John Fierke" nil 0)
    ("jj" "print" nil 0)
    ("parm" "$cgi->param('~(prompt param)')~@" dmacro-expand 0)
    ("prst" "print STDOUT" nil 0)
    ("sub" "#*******************************************************************************
#* ~(prompt sub \"Function Name: \") - 
#* 
#*******************************************************************************
sub ~(prompt sub) {
my ( ~@ ) = @_;


}  # end ~(prompt sub)

" dmacro-indent 0)
   ))

(define-abbrev-table 'php-mode-abbrev-table
  '(
    ("addbtn" "                  $extra_vars = 
                        \"onclick=\\\"doSomething();\\\"\".
                        \"style=\\\"display:none\\\"\";
                    add_button(array('id'   =>'btnID',
                                     'name' =>'btnID',
                                     'type' =>'button',
                                     'value'=>'DONT PANIC',
                                     'extra'=>$extra_vars));
" nil 0)
    ("ap" "array_ptr" nil 0)
    ("b1" "border=\"1\"" nil 3)
    ("blk" "{
~@
}" dmacro-indent 0)
    ("ci" "current_index" nil 0)
    ("cip" "current_index_ptr" nil 0)
    ("clg" "console.log(@@);" nil 1)
    ("cp" "current_ptr" nil 0)
    ("cpn" "current_ptr->next" nil 0)
    ("dd" "#define " dmacro-expand 0)
    ("defdat" "    $default_data = array(
          'cur_action' => $cur_action_def
         ,@@'foo'        => 'bar'
     );" nil 0)
    ("df" "#define     " nil 0)
    ("fd" "$form_data['@@']" nil 1)
    ("fori" "for (i = 0; i < ~@; ++i)
{
 ~mark
}
" dmacro-indent 0)
    ("foriefficient" "for (i = ~@; --i >= 0; )
{
 ~mark
}
" dmacro-indent 0)
    ("func" "~(prompt type \"Function type: \") ~(prompt name \"Function name: \")(~@)
{
~mark
} /* ~(prompt name) */
" dmacro-indent 0)
    ("hifndef" "#ifndef ~((file-name) :up)
#define ~((file-name) :up)

~@

#endif /* ~((file-name) :up) */" dmacro-expand 0)
    ("ifd" "#ifdef ~@
~(mark)
#endif 
" dmacro-indent 0)
    ("ifdnever" "#ifdef NEVER
~@
#endif /* NEVER */
" dmacro-expand 0)
    ("ife" "if (~(prompt expr \"Expression: \"))
    {
        ~@
    }
    else
    {
        ~(mark)
    }
" dmacro-indent 0)
    ("ifmal" "if ((~@ = (~(prompt type \"Variable type: \") *) ~(dmacro malloc)(~(mark)sizeof(~(prompt)))) == NULLP(~(prompt)))
" dmacro-indent 0)
    ("ifor" "for (~(prompt var \"Variable: \") = 0; ~prompt < ~@; ++~prompt)
{
 ~mark
}
" dmacro-indent 0)
    ("ih" "#include <~@.h>
" dmacro-expand 0)
    ("iifd" "#ifdef ~(prompt constant \"#ifdef condition: \")
~@
#endif /* ~(prompt) */
" dmacro-expand 0)
    ("iifed" "#ifdef ~(prompt constant \"#ifdef condition: \")
~@
#else
 ~(mark)
#endif /* ~(prompt) */
" dmacro-expand 0)
    ("iifnd" "#ifndef ~(prompt constant \"#ifndef condition: \")
~@
#endif /* ~(prompt) */
" dmacro-expand 0)
    ("iinclude" "#ifndef ~((prompt file \"Header file name: \") :up)
# include <~(prompt file).h>
#endif /* ~((prompt file) :up) */
" dmacro-expand 0)
    ("ina" "infinite_array" nil 0)
    ("int" "int      ~(prompt var \"Variable: \");" dmacro-indent 0)
    ("jq" "$('@@')" nil 2)
    ("jsalert" "?>
<script language=\"Javascript\">
    alert('@@');
</script>
<?php" nil 6)
    ("jslng" "<script language=\"Javascript\">
@@
</script>" nil 1)
    ("newvar" "~(prompt type \"Var Type: \")      ~(prompt name \"Var Name: \");" dmacro-indent 0)
    ("pdcl" "EXEC SQL BEGIN DECLARE SECTION; 
    
    
EXEC SQL END DECLARE SECTION;" nil 0)
    ("pex" "EXEC SQL " nil 0)
    ("phpb" "<?php
@@
?>" nil 5)
    ("phpe" "?>
@@
<?php" nil 4)
    ("phps" "<?=@@?>" nil 20)
    ("spcr" "<!-- SPACER -->
<table class=\"spacer\" \\>
<tr><td ></td></tr>
</table>
" nil 0)
    ("switch" "switch (~@)
{

}" dmacro-indent 0)
    ("test" "~(day) ~(month) ~(date), ~(year) : ~(hour24):~(min).~(sec)~(ampm) " dmacro-expand 1)
    ("test2" "~(day), ~(date-num), ~(month-num)" dmacro-expand 0)
    ("void" "(void)" dmacro-indent 0)
   ))

(define-abbrev-table 'pike-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'process-menu-mode-abbrev-table '())

(define-abbrev-table 'prog-mode-abbrev-table '())

(define-abbrev-table 'prolog-mode-abbrev-table '())

(define-abbrev-table 'python-mode-abbrev-table
  '(
    ("blah2" "MOOOOO" nil 0)
   ))

(define-abbrev-table 'python2-mode-abbrev-table
  '(
    ("blah3" "MOOOOO" nil 0)
   ))

(define-abbrev-table 'python3-mode-abbrev-table
  '(
    ("blah4" "MOOOOO" nil 0)
   ))

(define-abbrev-table 'rst-mode-abbrev-table '())

(define-abbrev-table 'rst-toc-mode-abbrev-table '())

(define-abbrev-table 'select-tags-table-mode-abbrev-table '())

(define-abbrev-table 'sgml-mode-abbrev-table '())

(define-abbrev-table 'sh-mode-abbrev-table '())

(define-abbrev-table 'shell-mode-abbrev-table '())

(define-abbrev-table 'sieve-manage-mode-abbrev-table '())

(define-abbrev-table 'sieve-mode-abbrev-table '())

(define-abbrev-table 'snippet-mode-abbrev-table '())

(define-abbrev-table 'special-mode-abbrev-table '())

(define-abbrev-table 'sql-mode-abbrev-table
  '(
    ("Orec" "SELECT uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, operid, stname, pikflg, orlocn, shpvia, contry, ordpri, orddst, custnm, stacod, ptnrnm, cponum, asmbly, ooddat, needat, wstdat, invamt, cstnum, frtchg, grpcod, lotcod, scncmp, scnnum, scnlin, cndcod, modflg, conflg, shfreq, concar, intinv, bldpph, blddys FROM as_order_history WHERE histyp = 'O'" nil 3)
    ("allqty" "expqty, rcvqty, totqty, reqqty, pikqty, xfrqty, qty111, qty222, alcqty" nil 0)
    ("altdt1" "ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY'" nil 2)
    ("altdt2" "ALTER SESSION SET NLS_DATE_FORMAT = \"MM/DD/YYYY HH24:MI:SS\"" nil 0)
    ("altdt3" "ALTER SESSION SET NLS_DATE_FORMAT = \"MM-DD-YYYY HH24:MI:SS\"" nil 0)
    ("aoh" "as_order_history" nil 32)
    ("arec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, operid FROM as_order_history WHERE histyp = 'a'" nil 0)
    ("ascts" "SELECT COUNT(*) FROM as_order_history WHERE" nil 1)
    ("at" "@/home/johnf/sql" nil 0)
    ("avd" "CONNECT asrs/venum15@avd68db" nil 0)
    ("avgen" "CONNECT asrs_gen/venum15@avp68db" nil 0)
    ("avgv" "CONNECT asrs_gv/venum15@avp68db" nil 0)
    ("avp" "CONNECT asrs/venum15@avp68db" nil 2)
    ("avs" "CONNECT asrs/venum15@avs68db" nil 2)
    ("avt" "CONNECT asrs/venum15@avt68db" nil 0)
    ("bcnt" "SELECT linnum, prtnum, btchid, sum(pikqty) FROM as_order_history WHERE histyp = 'P' AND quotnm = 'abc' GROUP BY linnum, prtnum, btchid ORDER BY linnum, btchid" nil 0)
    ("bcode" "SELECT uniqid \"Time Stamp\", vndcod, vndprt, shlocn, quotnm, rlsnum, linnum, prtnum, rcvqty, operid, pslpnm, strgid, toteid, qty111  FROM as_order_history WHERE histyp = 'R' AND uniqid > sysdate - 23 AND qty111 = " nil 30)
    ("bigarec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, operid, stname, strgid, alcqty FROM as_order_history WHERE histyp = 'A'" nil 1)
    ("bigdrec" "SELECT histyp, uniqid, shlocn, quotnm, rlsnum, linnum, prtnum, operid, stname, datqob, strgid, totqty FROM as_order_history WHERE histyp = 'D' " nil 0)
    ("bigorec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, prtnum, operid, stname, btchid, asyqty, parord, issplt as S, isctbk as C, udrind, pikflg, orlocn, shpvia, contry, ordpri, orddst, custnm, stacod, zipcod, ptnrnm, cponum, asmbly, to_char(ooddat, 'MM/DD/YYYY') ooddat, to_char(needat, 'MM/DD/YYYY') needat, to_char(wstdat, 'MM/DD/YYYY') wstdat, addr01, addr02, citycd, invamt, cstnum, frtchg, vndcod, comcod, grpcod, lotcod, scncmp, scnnum, scnlin, cndcod, modflg, conflg, shfreq, concar, intinv, bldpph, blddys FROM as_order_history WHERE histyp = 'O'" nil 18)
    ("bsum" "SELECT quotnm, rlsnum, linnum, prtnum, btchid, sum(pikqty) FROM as_order_history WHERE histyp = 'P' AND quotnm = 'xQUOTNMx' GROUP BY quotnm, rlsnum, linnum, prtnum, btchid ORDER BY linnum, btchid" nil 0)
    ("bwhs" "wh_id = 'WHSE11'" nil 18)
    ("cc" "cc" nil 3)
    ("ccrs" "AND reason like 'Cycle Count%' AND reason NOT LIKE 'Cycle Count to Zero%'" nil 0)
    ("coforec" "SELECT histyp, shlocn, quotnm, rlsnum, linnum, prtnum, operid, strgid, contry, pikqty FROM as_order_history WHERE histyp = 'p'" nil 3)
    ("conrec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, btchid, invtid, operid, stname, frstrg, tostrg FROM as_order_history WHERE histyp = '+'" nil 5)
    ("crec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, prtnum, btchid, invtid, vndcod, vndprt, operid, stname, datqob, cstqob, strgid, rsncod, reason, ststyp, qty111, qty222, qty222 - qty111 Delta FROM as_order_history WHERE histyp = 'C'" nil 5)
    ("crp" "CREATE OR REPLACE PROCEDURE" nil 0)
    ("crt" "CREATE TABLE" nil 0)
    ("ct" "COUNT" nil 4)
    ("cti" "SET pause off
SET echo on
SET linesize 2000
SET pagesize 60
@/home/johnf/sql/db_all_cols.sql" nil 6)
    ("cts" "COUNT(*)" nil 106)
    ("dball" "@/home/johnf/sql/db_itm.sql
@/home/johnf/sql/db_itm.sql
@/home/johnf/sql/db_pod.sql
@/home/johnf/sql/db_poh.sql
@/home/johnf/sql/db_rod.sql
@/home/johnf/sql/db_roh.sql
@/home/johnf/sql/db_soh.sql
@/home/johnf/sql/db_sod.sql
@/home/johnf/sql/db_cmt.sql" nil 1)
    ("dbc" "@/home/johnf/sql/db_all_cols.sql" nil 0)
    ("dbcid" "@/home/johnf/sql/db_cid.sql" nil 0)
    ("dbcmt" "@/home/johnf/sql/db_cmt.sql" nil 2)
    ("dbctl" "@/home/johnf/sql/db_ctl.sql" nil 0)
    ("dbhst" "@/home/johnf/sql/db_hst.sql" nil 5)
    ("dbinb" "@/home/johnf/sql/db_inbound.sql" nil 0)
    ("dbinv" "@/home/johnf/sql/db_inv.sql" nil 4)
    ("dbitm" "@/home/johnf/sql/db_itm.sql" nil 5)
    ("dbloc" "@/home/johnf/sql/db_loc.sql" nil 2)
    ("dbname" "select sys_context('userenv','db_name') from dual" nil 0)
    ("dbpod" "@/home/johnf/sql/db_pod.sql" nil 5)
    ("dbpoh" "@/home/johnf/sql/db_poh.sql" nil 2)
    ("dbref" "@/home/johnf/sql/db_ref.sql" nil 2)
    ("dbrod" "@/home/johnf/sql/db_rod.sql" nil 3)
    ("dbroh" "@/home/johnf/sql/db_roh.sql" nil 2)
    ("dbrsn" "@/home/johnf/sql/db_rsn.sql" nil 4)
    ("dbsess" "@/home/johnf/sql/osess2.sql" nil 2)
    ("dbsess2sql" "SELECT /*+ gather_plan_statistics */ OSUSER, SERIAL#, SID, executions,sql.module, sql.SQL_ID ,sql.child_number, SQL_TEXT FROM V$SESSION sess JOIN V$SQL sql on  (sess.SQL_ID = sql.SQL_ID)" nil 0)
    ("dbso" "@/home/johnf/sql/db_soh.sql  
@/home/johnf/sql/db_sod.sql" nil 2)
    ("dbsod" "@/home/johnf/sql/db_sod.sql" nil 2)
    ("dbsoh" "@/home/johnf/sql/db_soh.sql" nil 3)
    ("dbwrk" "@/home/johnf/sql/db_wrk.sql" nil 0)
    ("details" "SELECT detail_id ID, employee_id EMP, entry_datetime ENTERED, substr(status_detail,0,40) ENTRY, add_date, entry_close_date, persist_flag FROM sts_detail WHERE group_id = 54 AND entry_datetime > sysdate -10 ORDER BY entry_datetime" nil 6)
    ("dimq" "SELECT itm_itmcod,itm_invtyp,itm_stotyp,itm_bintyp,itm_prdzon,itm_celtyp,itm_fitqta,itm_fitqtc,itm_fulqty,itm_caspal,itm_eaccas,itm_caslen,itm_caswid,itm_cashgt,itm_eaclen,itm_eacwid,itm_eachgt FROM itm" nil 0)
    ("drec" "SELECT uniqid, shlocn, quotnm, rlsnum, linnum, prtnum, operid, stname, datqob, strgid, totqty FROM as_order_history WHERE histyp = 'd' " nil 0)
    ("drt" "DROP TABLE" nil 0)
    ("dtfmt" "MM/DD/YYYY HH24:MI" nil 2)
    ("ea" "AND" nil 325)
    ("ebt" "BETWEEN" nil 0)
    ("ecc" ",     " nil 10)
    ("eds" "DESCRIBE" nil 29)
    ("edt" "DISTINCT" nil 8)
    ("ef" "FROM" nil 251)
    ("eg" "GROUP BY" nil 36)
    ("eh" "HAVING" nil 16)
    ("ei" "INSERT INTO" nil 0)
    ("el" "LIKE" nil 12)
    ("erec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, pbfree, isrohs, grnflg, lfpart, operid, stname, rctcod, expqty, pslpnm, dlvnum, custnm, btchid, datqob, lotcod, contry, vndcod, vndprt, cstqob, sernum, datcod, hazard stkcmp, comcod, grpcod, prdgrp, xftype, xftran, xfrlse, xfline, ccsles, cccust, cctran  FROM as_order_history WHERE histyp = 'E'" nil 12)
    ("ers" "SELECT histyp, uniqid, operid, stname, shlocn, quotnm, rlsnum, linnum, prtnum, rctcod, btchid, invtid, vndcod, vndprt, custnm, comcod, grpcod, strgid, toteid, totqty, expqty, rcvqty, qty111, pslpnm, dlvnum, datcod, datqob, contry, cstqob, msgtyp, reason FROM as_order_history WHERE histyp IN ('E','S','R') " nil 10)
    ("es" "SELECT" nil 273)
    ("etod" (format-time-string "uniqid > TO_DATE('%m/%d/%Y 00:00:01', 'MM/DD/YYYY HH24:MI:SS')") nil 1)
    ("etoday" (format-time-string "uniqid > TO_DATE('%m/%d/%Y 00:00:01', 'MM/DD/YYYY HH24:MI:SS')") nil 3)
    ("etr" "TRANSACTION" nil 0)
    ("eu" "UPDATE" nil 58)
    ("ew" "WHERE" nil 193)
    ("exprec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, lfpart, operid, stname, rctcod, expqty, pslpnm, vndcod, vndprt, cstqob, sernum, datcod, hazard stkcmp, comcod, grpcod, prdgrp, xftype, xftran, xfrlse, xfline, ccsles, cccust, cctran  FROM as_order_history WHERE histyp = 'E' AND uniqid > sysdate + 2/24 - .003" nil 1)
    ("frec" "SELECT uniqid \"Time Stamp\", shlocn, prtnum, operid, stname, histyp, vndcod, vndprt, datqob, lotcod, comcod, grpcod, cstqob, trakid, strgid Grapevine, tostrg DEST, to_char(totqty,'999,999,999') totqty, contry, TO_CHAR(ooddat, 'MM/DD/YYYY') ooddat, TO_CHAR(wstdat, 'MM/DD/YYYY') wstdat, rmanum avgpwt, supprt FROM as_order_history WHERE histyp = 'F'" nil 1)
    ("g2ac" "SELECT RECORD_SEQ_NO,TRANSFER_STATUS,RECORD_CREATE_DATE,TRANSACTION_CODE,E_UPCNF_TRANS_TYPE,E_UPIVAC_SKU,E_UPIVAC_BUILD,E_UPIVAC_DATE_TIME,E_UPIVAC_TRANS_CODE,E_UPIVAC_QTY,E_UPIVAC_REF_NO,E_UPPORC_HOLD_ID FROM c_upcnf WHERE E_UPCNF_TRANS_TYPE = 'AC' ORDER BY RECORD_SEQ_NO" nil 3)
    ("g2ac2" "SELECT c_bwummf_seqno,status,upd_date,upd_time,wh_id,tran_type,item_code,qty FROM c_bwummf WHERE tran_type = 'AC' ORDER BY c_bwummf_seqno" nil 0)
    ("g2cc" "SELECT RECORD_SEQ_NO,TRANSFER_STATUS,RECORD_CREATE_DATE,TRANSACTION_CODE,E_UPCNF_TRANS_TYPE,E_UPSHCF_ORDER_NUM,E_UPSHCF_LOC,E_UPCARR_ORDER_NUM,E_UPCARR_CARRIER,E_UPCARR_SHIP_DATE,E_UPCARR_TRACKING_NO,E_UPCARR_FREIGHT,E_UPCARR_SHIP_WT,E_UPCARR_BOXES FROM C_UPCNF WHERE E_UPCNF_TRANS_TYPE = 'CC' ORDER BY RECORD_SEQ_NO" nil 4)
    ("g2ia" "SELECT TRAN_TYPE,C_BWUMMF_SEQNO,STATUS,UPD_DATE,UPD_TIME,WH_ID,INDUCTION_NO,ITEM_CODE,QTY  FROM C_BWUMMF WHERE tran_type = 'IA' @@ ORDER BY C_BWUMMF_SEQNO" nil 2)
    ("g2ih" "SELECT tran_type,c_bwullf_seqno,status,upd_date,upd_time,item_code,qty,reason,wh_id FROM C_BWULLF WHERE tran_type = 'IH' ORDER BY c_bwullf_seqno" nil 1)
    ("g2pf" "SELECT TRAN_TYPE,C_BWUINF_SEQNO,STATUS,UPD_DATE,UPD_TIME,WH_ID,ITEM_CODE,REASON,QTY FROM c_bwuinf WHERE tran_type = 'PF' AND status = 'C' ob C_BWUINF_SEQNO" nil 0)
    ("g2pod" "SELECT host_po_master_id,host_po_detail_id,transaction_code,TO_CHAR(record_create_date,'YYYYMMDD') CREDAT, record_create_time CRETIM,po_number,line_number LINE,item_number,quantity,to_char(delivery_date,'YYYYMMDD') DLVDAT,transfer_status FROM c_bwpxdf WHERE @@ ORDER BY 1,2" nil 1)
    ("g2poh" "SELECT rowid, host_po_master_id, transaction_code, po_number, TO_CHAR(record_create_date,'YYYYMMDD') CREDAT, record_create_time CRETIM, TO_CHAR(created_date,'YYYYMMDD') CREDT2, po_type, vendor_code, status, transfer_status FROM C_BWPXMF WHERE wh_id = 'WHSE11' @@ ORDER BY 2,1" nil 0)
    ("g2pp" "SELECT TRAN_TYPE,C_BWUINF_SEQNO,STATUS,UPD_DATE,UPD_TIME,WH_ID,ITEM_CODE,       QTY FROM c_bwuinf WHERE tran_type = 'PP' AND status = 'C' ORDER BY RECORD_SEQ_NO" nil 0)
    ("g2rc" "SELECT RECORD_SEQ_NO, TRANSFER_STATUS, RECORD_CREATE_DATE, TRANSACTION_CODE,E_UPCNF_TRANS_TYPE, E_UPPORC_REF_NO, E_UPPORC_BUILD,E_UPPORC_DATE_TIME, E_UPPORC_SKU, E_UPPORC_REC_QTY,E_UPPORC_TRANS_CODE, E_UPPORC_LINE_NO FROM c_upcnf WHERE E_UPCNF_TRANS_TYPE = 'RC' ORDER BY transfer_status, record_seq_no" nil 1)
    ("g2reco" "SELECT * FROM c_bwreco WHERE c_bwreco_whid = 'WHSE11' AND ext_date = trunc(sysdate) AND item_code = '@@'" nil 3)
    ("g2rj" "SELECT C_BWULLF_SEQNO,STATUS,TRAN_TYPE,ITEM_CODE,QTY,REASON,INDUCTION_NO,UPD_DATE,UPD_TIME,WH_ID FROM C_BWULLF WHERE tran_type = 'RJ' AND status = 'C' ORDER BY C_BWULLF_SEQNO" nil 0)
    ("g2sc" "SELECT RECORD_SEQ_NO,TRANSFER_STATUS,RECORD_CREATE_DATE,TRANSACTION_CODE,E_UPCNF_TRANS_TYPE,E_UPSHCF_ORDER_NUM,E_UPSHCF_SHIP_DATE_TIME,E_UPSHCF_LOC,E_UPSHCF_SKU,E_UPSHCF_SHIP_QTY,E_UPSHCF_HOST_LINE_NUMBER FROM C_UPCNF WHERE E_UPCNF_TRANS_TYPE = 'SC' ORDER BY RECORD_SEQ_NO" nil 4)
    ("g2scc" "SELECT c_bwucos_seqno,status,tran_type,wh_id,co_no,item_code,qty,line_no,ship_date,ship_time,proc_date,proc_time FROM C_BWUCOS" nil 1)
    ("g2shp" "SELECT RECORD_SEQ_NO,TRANSFER_STATUS,RECORD_CREATE_DATE,TRANSACTION_CODE,E_UPCNF_TRANS_TYPE,E_UPSHCF_ORDER_NUM,    'SC', E_UPSHCF_LOC,E_UPCARR_ORDER_NUM,E_UPCARR_CARRIER,E_UPCARR_SHIP_DATE,E_UPCARR_TRACKING_NO,E_UPCARR_FREIGHT,E_UPCARR_SHIP_WT,E_UPCARR_BOXES,   'ST', E_UPSHTR_ORDER_NUM,E_UPSHTR_SHIP_DATE_TIME,E_UPSHTR_TOT_WEIGHT,E_UPSHTR_CARTONS,E_UPSHTR_SHIP_LOC,E_UPSHTR_CARRIER,E_UPSHTR_FREIGHT_COST,    'CC', E_UPSHCF_SHIP_DATE_TIME,E_UPSHCF_SKU,E_UPSHCF_SHIP_QTY,E_UPSHCF_HOST_LINE_NUMBER   FROM C_UPCNF WHERE E_UPCNF_TRANS_TYPE IN ('SC','ST','CC') ORDER BY ORDER BY RECORD_SEQ_NO" nil 1)
    ("g2sku" "SELECT ROWID, TRANSFER_STATUS, HOST_ITEM_MASTER_ID, TO_CHAR(RECORD_CREATE_DATE,'YYYYMMDD') REC_DATE, RECORD_CREATE_TIME REC_DATE, TRANSACTION_CODE, ITEM_NUMBER,WH_ID, DESCRIPTION, INVENTORY_TYPE, SHELF_LIFE, ALT_ITEM_NUMBER, REVISION, LOT_CONTROL, UPC, UNIT_WEIGHT, TARE_WEIGHT,PICK_PUT_ID, ALT_ITEM_ID1, ALT_ITEM_ID2, ALT_ITEM_ID3,ALT_ITEM_ID4, ALT_ITEM_ID5, HPL, AGC, ABC, MAKE,COUNTRY_OF_ORIGIN, HARMONIZED_TARIFF, STORAGE_TYPE,CAN_HARMONIZED_CODE, EXPORT_ITEM_DESC FROM C_BWITMF WHERE wh_id = 'WHSE11'" nil 1)
    ("g2sod" "SELECT HOST_ORDER_MASTER_ID, host_order_detail_id,TRANSACTION_CODE,to_char(record_create_date,'YYYYMMDD') credat, RECORD_CREATE_TIME CRETIM,order_number, LINE_NUMBER, item_number,ITEM_DESCRIPTION,qty,UNIT_WEIGHT,extended_weight,DISC_PRICE,transfer_status,PEGGED_SO FROM c_bwsodf WHERE wh_id = 'WHSE11' AND @@ ORDER BY 1,2,6,7;" nil 0)
    ("g2soh" "SELECT host_order_master_id MASTER_ID,transaction_code,to_char(RECORD_CREATE_DATE,'YYYYMMDD') CREDAT, record_crate_time,order_number,transfer_status,store_order_number,order_type,customer_code, CUSTOMER_PO_NUMBER, carrier_type cartyp, carrier, service_level srvlvl, carrier_scac scac,freight_terms terms,rush,to_char(order_date,'YYYYMMDD') ORDDAT,to_char(promised_date,'YYYYMMDD') PROMDT, weight,backorder,pre_paid,ship_to_name,ship_to_state STA,ship_to_country_code SCNTRY,ship_to_country_name SHPCNM,delivery_name DLVNAM,delivery_state DLVSTA,bill_to_name BILNAM,bill_to_state BST FROM c_bwsomf WHERE @@" nil 0)
    ("g2st" "SELECT RECORD_SEQ_NO,TRANSFER_STATUS,RECORD_CREATE_DATE,TRANSACTION_CODE,E_UPCNF_TRANS_TYPE,E_UPSHCF_ORDER_NUM,E_UPSHCF_LOC,E_UPSHTR_ORDER_NUM,E_UPSHTR_SHIP_DATE_TIME,E_UPSHTR_TOT_WEIGHT,E_UPSHTR_CARTONS,E_UPSHTR_SHIP_LOC,E_UPSHTR_CARRIER,E_UPSHTR_FREIGHT_COST FROM C_UPCNF WHERE E_UPCNF_TRANS_TYPE = 'ST'" nil 2)
    ("g2tsn" "AND transfer_status = 'N'" nil 0)
    ("g2uom" "SELECT ROWID, TRANSFER_STATUS, HOST_ITEM_UOM_ID, TRANSACTION_CODE, ITEM_NUMBER, UOM, CONVERSION_FACTOR, PACKAGE_WEIGHT, UOM_WEIGHT, LENGTH, WIDTH, HEIGHT FROM C_BWITUF WHERE WH_ID = 'BXWK11'" nil 1)
    ("gupcnf" "SELECT RECORD_SEQ_NO,TRANSFER_STATUS,RECORD_CREATE_DATE,TRANSACTION_CODE,E_UPCNF_TRANS_TYPE,E_UPPORC_REF_NO,E_UPPORC_BUILD,E_UPPORC_DATE_TIME,E_UPPORC_SKU,E_UPPORC_REC_QTY,E_UPPORC_TRANS_CODE,E_UPPORC_LINE_NO FROM C_UPCNF " nil 0)
    ("hcnt" "SELECT histyp, COUNT(*) FROM as_order_history GROUP BY histyp" nil 1)
    ("hdrrec" "SELECT uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, operid, stname, pikflg, orlocn, shpvia, contry, ordpri, orddst, custnm, stacod, ptnrnm, cponum, asmbly, ooddat, needat, wstdat, invamt, cstnum, frtchg, grpcod, lotcod, scncmp, scnnum, scnlin, cndcod, modflg, conflg, shfreq, concar, intinv, bldpph, blddys FROM as_order_history WHERE histyp = 'O'" nil 3)
    ("hitm" "c_bwitmf" nil 5)
    ("hpcm" "c_bwpxcf" nil 0)
    ("hpod" "c_bwpxdf" nil 13)
    ("hpodcnt" "SELECT transfer_status, COUNT(*) FROM c_bwpxdf WHERE wh_id = 'WHSE11' GROUP BY transfer_status" nil 1)
    ("hpoh" "c_bwpxmf" nil 22)
    ("hpohcnt" "SELECT transfer_status, COUNT(*) FROM c_bwpxmf WHERE wh_id = 'WHSE11' GROUP BY transfer_status" nil 1)
    ("hrod" "c_bwpldf" nil 12)
    ("hroh" "c_bwplmf" nil 5)
    ("hscd" "c_bwsolc" nil 1)
    ("hsch" "c_bwsooc" nil 6)
    ("hsod" "c_bwsodf" nil 0)
    ("hsoh" "c_bwsomf" nil 3)
    ("huom" "c_bwituf" nil 3)
    ("krec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, ststyp, operid, stname, shpvia, stanum FROM as_order_history WHERE histyp = 'K'" nil 3)
    ("list_bw" "@/home/johnf/sql/list_bw.sql" nil 1)
    ("list_hager" "@/home/johnf/sql/list_hager.sql" nil 5)
    ("list_hager_err" "@/home/johnf/sql/list_hager_err.sql" nil 2)
    ("list_hager_inb" "@/home/johnf/sql/list_hager_inb.sql" nil 10)
    ("list_hager_itm" "@/home/johnf/sql/list_hager_itm.sql" nil 11)
    ("list_hager_new" "@/home/johnf/sql/list_hager_new.sql" nil 2)
    ("list_hager_shp" "@/home/johnf/sql/list_hager_shp.sql" nil 4)
    ("list_idata" "@/home/johnf/sql/list_idata.sql" nil 16)
    ("list_trk" "SELECT * FROM t_shipment_track ORDER BY shipping_status, ship_date, shipment_track_id" nil 6)
    ("ln" "line_number" nil 7)
    ("logins" "SELECT group_id grp, employee_id emp, substr(last_name || ', ' || first_name, 1, 30) Name, login_id, login_id2, passwd FROM avt_employee /* WHERE group_id IN (1,28,33) */ ORDER BY group_id, last_name" nil 0)
    ("lrec" "SELECT uniqid, shlocn, quotnm, rlsnum, linnum, prtnum, operid, stname, lotcod, strgid, totqty FROM as_order_history WHERE histyp = 'L' " nil 0)
    ("mydesc" "SELECT substr(column_name,1, 30) column_name, substr(data_type,1,15) data_type, substr( data_length, 1, 6) \"LENGTH\", substr( default_length, 1, 8) \"DFLT_LEN\", data_precision \"PRECISION\", substr(nullable, 1, 4) || '   ' \"NULL\", data_default FROM sys.user_tab_columns WHERE table_name = 'AVT_EMPLOYEE'~@" nil 0)
    ("myobj" "SELECT substr(object_name, 1, 30) obj_name, object_type, status FROM user_objects ORDER BY object_type, status, object_name" nil 0)
    ("nrec" "SELECT uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, operid, stname, orlocn, shpvia, trakno, frtqob, weight, codqob, manidt FROM as_order_history WHERE histyp = 'N'" nil 5)
    ("ob" "ORDER BY" nil 40)
    ("obu" "ORDER BY uniqid, usecs" nil 33)
    ("odb" "SELECT SYS_CONTEXT('USERENV','DB_NAME') FROM dual" nil 2)
    ("offon" "SET ECHO OFF  
SET ECHO ON" nil 0)
    ("ora_client" "SELECT DISTINCT s.client_version FROM v$session_connect_info s WHERE s.sid = SYS_CONTEXT('USERENV', 'SID')" nil 0)
    ("ora_server" "SELECT * FROM v$version" nil 0)
    ("orec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, btchid, operid, stname, reqqty, vndcod, vndprt, grpcod FROM as_order_history WHERE histyp = 'o'" nil 8)
    ("osess" "select substr(p.spid,1,9) pid, substr(s.sid,1,5) sid, substr(s.serial#,1,5) ser#, substr(s.machine,1,20) box, substr(s.username,1,16) username, substr(s.osuser,1,8) os_user, substr(s.program,1,30) program,s.status, logon_time, state,substr(wait_class,1,10) w_class,wait_time wt_time,seconds_in_wait sec_in_wt, wait_time_micro, time_remaining_micro,time_since_last_wait_micro, substr(service_name,1,10) service, p.tracefile from v$session s, v$process p where s.paddr = p.addr and type='USER' AND s.username = 'GLOVIA_PROD' AND s.program LIKE 'hits%' ORDER BY status, user" nil 4)
    ("osids" "SELECT s.sid,s.serial#,s.username,s.osuser FROM v$session s,v$process p WHERE s.paddr=p.addr AND s.username LIKE 'G%'" nil 0)
    ("otrace" "SELECT * FROM v$parameter WHERE name = 'user_dump_dest'" nil 1)
    ("pakrec" "SELECT uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, operid, stname, shpvia, stanum FROM as_order_history WHERE histyp = 'K' AND uniqid > sysdate - .2 AND rlsnum = '888'   " nil 1)
    ("parthist1" "SELECT * FROM as_order_history WHERE uniqid > to_date('mm/dd/yyyy', 'MM/DD/YYYY') quotnm = 'abcdefghi' AND prtnum = " nil 1)
    ("pcrec" "SELECT histyp, uniqid, shlocn, quotnm, rlsnum, linnum, prtnum, btchid, invtid, operid, udrind, issplt, isctbk, stname, orlocn, strgid, tostrg, rsncod, totqty, reqqty, pikqty, pckcod, contry, ststyp, qty111, qty222, vndcod, vndprt, cstqob, reason FROM as_order_history WHERE histyp IN ('P', 'C') " nil 4)
    ("pikrec" "SELECT uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, operid, stname, orlocn, datqob, strgid, rsncod, totqty, tostrg, reqqty, pikqty, pckcod FROM as_order_history WHERE histyp = 'P' AND uniqid > sysdate - .2 AND rlsnum = '888' " nil 3)
    ("pipedelim" "set colsep '|' echo off feedback off heading off linesize 32767 pagesize 0 termout off trimspool on verify off" nil 0)
    ("pn" "po_number" nil 3)
    ("pndrec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, operid, coment FROM as_order_history WHERE histyp = '#'" nil 7)
    ("polincnt" "SELECT pod_ordnum,COUNT(*)  FROM pod WHERE pod_ordtyp != 'I' AND pod_ordnum NOT IN (SELECT DISTINCT pod_ordnum FROM pod WHERE pod_ordtyp != 'I' AND pod_rcvqty > 0 ) GROUP BY pod_ordnum ORDER BY 2" nil 1)
    ("pon" "po_number" nil 39)
    ("ponum" "SELECT uniqid \"Time Stamp\", vndcod, vndprt, shlocn, quotnm, rlsnum, linnum, prtnum, rcvqty, operid, pslpnm, strgid, toteid, qty111  FROM as_order_history WHERE histyp = 'R' AND uniqid > sysdate - 23 AND quotnm = " nil 31)
    ("prec" "SELECT histyp, uniqid \"Time Stamp\", udrind, issplt, isctbk, shlocn, quotnm, rlsnum, linnum, prtnum, btchid, invtid, operid, stname, datqob, strgid, orlocn, rsncod, totqty, tostrg, reqqty, pikqty, pckcod, contry FROM as_order_history WHERE histyp = 'P'" nil 21)
    ("prec0" "SELECT uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, operid, stname, orlocn, datqob, strgid, rsncod, totqty, tostrg, reqqty, pikqty, pckcod, contry, avgpwt, trakid FROM as_order_history WHERE histyp = 'P'" nil 8)
    ("procsrc" "SELECT line, substr(text,0,60) text FROM dba_source WHERE name = UPPER( '~(prompt proc_name \"Procedure: \")' );~@" dmacro-indent 0)
    ("psn" "packlist_number" nil 3)
    ("r360orec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, prtnum, operid, stname, btchid, asyqty, parord, issplt, isctbk, udrind, pikflg, orlocn, shpvia, contry, ordpri, orddst, custnm, stacod, zipcod, ptnrnm, cponum, asmbly, to_char(ooddat, 'MM/DD/YYYY') ooddat, to_char(needat, 'MM/DD/YYYY') needat, to_char(wstdat, 'MM/DD/YYYY') wstdat, addr01, addr02, citycd, invamt, cstnum, frtchg, vndcod, comcod, grpcod, lotcod, scncmp, scnnum, scnlin, cndcod, modflg, conflg, shfreq, concar, intinv, bldpph, blddys FROM as_order_history WHERE histyp = 'O' AND histyp = 'O' AND rlsnum ='444' AND custnm = 'R360  ' " nil 17)
    ("rcvbyloc" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm PO_NUM, rlsnum, linnum, prtnum, vndcod, vndprt, operid, stname, datqob, strgid TOTE, toteid LOCATION, contry, rcvqty FROM as_order_history WHERE histyp = 'R' AND uniqid > sysdate + 2/24 - .05 AND toteid = " nil 0)
    ("rcvrec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm PO_NUM, rlsnum, linnum, prtnum, operid, stname, datqob, strgid TOTE, toteid LOCATION, contry, rcvqty FROM as_order_history WHERE histyp = 'R' AND uniqid > sysdate + 2/24 - .05" nil 0)
    ("recent" "uniqid > sysdate + 2/24 - (10/1440)" nil 0)
    ("reset-bw" "@/home/johnf/sql/reset_bw.sql" nil 0)
    ("reset-hager" "@/home/johnf/sql/reset_hager.sql" nil 0)
    ("reset_bw" "@/home/johnf/sql/reset_bw.sql" nil 0)
    ("reset_hager" "@/home/johnf/sql/reset_hager.sql" nil 0)
    ("rlog" "SELECT group_id, open_timestamp \"open\", close_timestamp \"close\" FROM sts_report_log WHERE group_id = ~(prompt groupId \"Group ID: \") ORDER BY group_id, open_timestamp~@" dmacro-indent 5)
    ("rpsd" "rod_pklord" nil 0)
    ("rpsh" "roh_pklord" nil 0)
    ("rrec" "SELECT histyp, rctcod, uniqid \"Time Stamp\", shlocn, quotnm PO_NUM, rlsnum, linnum, prtnum, btchid, invtid, vndcod, vndprt, pslpnm, operid, stname, datqob, strgid TOTE, toteid LOCATION, contry, rcvqty, qty111, avgpwt FROM as_order_history WHERE histyp = 'R'" nil 11)
    ("sdate" "SELECT sysdate FROM dual" nil 1)
    ("shortdate" "to_char(datefld, 'MM/DD/YYYY')" nil 1)
    ("srec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, btchid, invtid, vndcod, vndprt, lfpart, operid, stname, rctcod, datqob, expqty, pslpnm, strgid, totqty, rcvqty, msgtyp, strgcd, reason FROM as_order_history WHERE histyp = 'S'" nil 6)
    ("srtrec" "SELECT uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, operid, stname, strgid, tostrg, invtid, btchid, srtdst FROM as_order_history WHERE histyp = '~'" nil 6)
    ("st" "st" nil 1)
    ("tbn" "table_name" nil 0)
    ("today" ((quote (format-time-string "uniqid > TO_DATE('%m/%d/%Y 00:00:01', 'MM/DD/YYYY HH24:MI:SS')"))) nil 4)
    ("trec" "SELECT histyp, uniqid \"Time Stamp\", shlocn, prtnum, btchid, trakid, invtid, operid, stname, frstrg, tostrg, xfrqty FROM as_order_history WHERE histyp = 'T'" nil 4)
    ("ts" "transfer_status" nil 28)
    ("udr" "uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, linnum, prtnum, operid, stname, strgid, tostrg, rsncod, totqty, reqqty, pikqty " nil 2)
    ("udrrec" "SELECT uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, operid, substr(coment, 5,1) prdlin, substr(coment, 8,3) linnum2, substr(coment, 12,9) prtnum2, substr(coment, 22,2) rsncod2, substr(coment, 25,2) subcod2, substr(coment, 29,6) fpdest2, TO_NUMBER(substr(coment, 36,7)) reqqty2 FROM as_order_history WHERE histyp = '#' AND rlsnum = '777'" nil 0)
    ("ustb" "USER_TABLES" nil 0)
    ("vhst" "SELECT hst_conctn, hst_msgtyp, hst_msgpri, hst_seqnum, hst_msgbdy FROM hst ORDER BY hst_conctn, hst_seqnum" nil 17)
    ("wcat" "SELECT category_id, display_order, category_name, has_projects FROM sts_category WHERE group_id = 54" nil 0)
    ("whereami" "SELECT sys_context('USERENV','SERVICE_NAME') || ' ON ' || sys_context('USERENV','SERVER_HOST') as location FROM DUAL" nil 0)
    ("who" "@ /export/home/jwf/sql/dba/ora_who.sql" nil 0)
    ("who2" "@ /export/home/jwf/sql/dba/ora_who2.sql" nil 0)
    ("wuid" "SELECT employee_id ID, group_id GRP, first_name first, last_name last, login_id2 LOGIN, passwd PW, email FROM avt_employee WHERE group_id = 54 ORDER BY last_name" nil 0)
    ("xrec" "SELECT /* NEW */ histyp, uniqid \"Time Stamp\", shlocn, quotnm, rlsnum, operid, stname FROM as_order_history WHERE histyp = 'X'" nil 0)
    ("y2k_obj" "SELECT SUBSTR(object_name, 0, 30) object, object_type, timestamp   
FROM USER_OBJECTS   
WHERE object_name LIKE '%Y2K%'   
AND object_type IN ('TABLE', 'PROCEDURE', 'FUNCTION', 'INDEX', 'TRIGGER', 'SEQUENCE' );~@  
" dmacro-expand 0)
   ))

(define-abbrev-table 'tabulated-list-mode-abbrev-table '())

(define-abbrev-table 'text-mode-abbrev-table
  '(
    ("cfc" "(Completed RFC)" nil 11)
    ("crfc" "(Completed RFC)" nil 4)
   ))

(define-abbrev-table 'use-package-statistics-mode-abbrev-table '())

(define-abbrev-table 'vc-annotate-mode-abbrev-table '())

(define-abbrev-table 'vc-dir-mode-abbrev-table '())

(define-abbrev-table 'vc-dired-mode-abbrev-table '())

(define-abbrev-table 'vc-git-log-edit-mode-abbrev-table '())

(define-abbrev-table 'vc-git-log-view-mode-abbrev-table '())

(define-abbrev-table 'vc-svn-log-view-mode-abbrev-table '())

(define-abbrev-table 'vhdl-mode-abbrev-table
  '(
    ("--" "" vhdl-display-comment-hook 0)
    ("abs" "" vhdl-default-hook 0)
    ("access" "" vhdl-default-hook 0)
    ("after" "" vhdl-default-hook 0)
    ("alias" "" vhdl-alias-hook 0)
    ("all" "" vhdl-default-hook 0)
    ("and" "" vhdl-default-hook 0)
    ("arch" "" vhdl-architecture-hook 0)
    ("architecture" "" vhdl-architecture-hook 0)
    ("array" "" vhdl-array-hook 0)
    ("assert" "" vhdl-assert-hook 0)
    ("attr" "" vhdl-attribute-hook 0)
    ("attribute" "" vhdl-attribute-hook 0)
    ("begin" "" vhdl-default-indent-hook 0)
    ("block" "" vhdl-block-hook 0)
    ("body" "" vhdl-default-hook 0)
    ("buffer" "" vhdl-default-hook 0)
    ("bus" "" vhdl-default-hook 0)
    ("case" "" vhdl-case-hook 0)
    ("comp" "" vhdl-component-hook 0)
    ("component" "" vhdl-component-hook 0)
    ("conc" "" vhdl-concurrent-signal-assignment-hook 0)
    ("concurrent" "" vhdl-concurrent-signal-assignment-hook 0)
    ("conf" "" vhdl-configuration-hook 0)
    ("configuration" "" vhdl-configuration-hook 0)
    ("cons" "" vhdl-constant-hook 0)
    ("constant" "" vhdl-constant-hook 0)
    ("disconnect" "" vhdl-disconnect-hook 0)
    ("downto" "" vhdl-default-hook 0)
    ("else" "" vhdl-else-hook 0)
    ("elseif" "" vhdl-elsif-hook 0)
    ("elsif" "" vhdl-elsif-hook 0)
    ("end" "" vhdl-default-indent-hook 0)
    ("entity" "" vhdl-entity-hook 0)
    ("exit" "" vhdl-exit-hook 0)
    ("file" "" vhdl-default-hook 0)
    ("for" "" vhdl-for-hook 0)
    ("func" "" vhdl-function-hook 0)
    ("function" "" vhdl-function-hook 0)
    ("gen" "" vhdl-generate-hook 0)
    ("generate" "" vhdl-generate-hook 0)
    ("generic" "" vhdl-generic-hook 0)
    ("group" "" vhdl-default-hook 0)
    ("guarded" "" vhdl-default-hook 0)
    ("header" "" vhdl-header-hook 0)
    ("if" "" vhdl-if-hook 0)
    ("impure" "" vhdl-default-hook 0)
    ("in" "" vhdl-default-hook 0)
    ("inertial" "" vhdl-default-hook 0)
    ("inout" "" vhdl-default-hook 0)
    ("inst" "" vhdl-component-instance-hook 0)
    ("instance" "" vhdl-component-instance-hook 0)
    ("is" "" vhdl-default-hook 0)
    ("label" "" vhdl-default-hook 0)
    ("library" "" vhdl-library-hook 0)
    ("linkage" "" vhdl-default-hook 0)
    ("literal" "" vhdl-default-hook 0)
    ("loop" "" vhdl-loop-hook 0)
    ("map" "" vhdl-map-hook 0)
    ("mod" "" vhdl-default-hook 0)
    ("modify" "" vhdl-modify-hook 0)
    ("nand" "" vhdl-default-hook 0)
    ("new" "" vhdl-default-hook 0)
    ("next" "" vhdl-next-hook 0)
    ("nor" "" vhdl-default-hook 0)
    ("not" "" vhdl-default-hook 0)
    ("null" "" vhdl-default-hook 0)
    ("of" "" vhdl-default-hook 0)
    ("on" "" vhdl-default-hook 0)
    ("open" "" vhdl-default-hook 0)
    ("or" "" vhdl-default-hook 0)
    ("others" "" vhdl-default-hook 0)
    ("out" "" vhdl-default-hook 0)
    ("pack" "" vhdl-package-hook 0)
    ("package" "" vhdl-package-hook 0)
    ("port" "" vhdl-port-hook 0)
    ("postponed" "" vhdl-default-hook 0)
    ("procedure" "" vhdl-procedure-hook 0)
    ("process" "" vhdl-process-hook 0)
    ("pure" "" vhdl-default-hook 0)
    ("range" "" vhdl-default-hook 0)
    ("record" "" vhdl-record-hook 0)
    ("register" "" vhdl-default-hook 0)
    ("reject" "" vhdl-default-hook 0)
    ("rem" "" vhdl-default-hook 0)
    ("report" "" vhdl-default-hook 0)
    ("ret" "" vhdl-return-hook 0)
    ("return" "" vhdl-return-hook 0)
    ("rol" "" vhdl-default-hook 0)
    ("ror" "" vhdl-default-hook 0)
    ("select" "" vhdl-selected-signal-assignment-hook 0)
    ("severity" "" vhdl-default-hook 0)
    ("shared" "" vhdl-default-hook 0)
    ("sig" "" vhdl-signal-hook 0)
    ("signal" "" vhdl-signal-hook 0)
    ("sla" "" vhdl-default-hook 0)
    ("sll" "" vhdl-default-hook 0)
    ("sra" "" vhdl-default-hook 0)
    ("srl" "" vhdl-default-hook 0)
    ("sub" "" vhdl-subtype-hook 0)
    ("subtype" "" vhdl-subtype-hook 0)
    ("then" "" vhdl-default-hook 0)
    ("to" "" vhdl-default-hook 0)
    ("transport" "" vhdl-default-hook 0)
    ("type" "" vhdl-type-hook 0)
    ("unaffected" "" vhdl-default-hook 0)
    ("units" "" vhdl-default-hook 0)
    ("until" "" vhdl-default-hook 0)
    ("use" "" vhdl-use-hook 0)
    ("var" "" vhdl-variable-hook 0)
    ("variable" "" vhdl-variable-hook 0)
    ("wait" "" vhdl-wait-hook 0)
    ("warning" "" vhdl-default-hook 0)
    ("when" "" vhdl-when-hook 0)
    ("while" "" vhdl-while-loop-hook 0)
    ("with" "" vhdl-selected-signal-assignment-hook 0)
    ("xnor" "" vhdl-default-hook 0)
    ("xor" "" vhdl-default-hook 0)
   ))

(define-abbrev-table 'visual-basic-mode-abbrev-table
  '(
    ("add" "Add" nil 0)
    ("aggregate" "Aggregate" nil 0)
    ("and" "And" nil 0)
    ("app" "App" nil 2)
    ("appactivate" "AppActivate" nil 0)
    ("application" "Application" nil 0)
    ("array" "Array" nil 0)
    ("as" "As" nil 1)
    ("asc" "Asc" nil 0)
    ("ascb" "AscB" nil 0)
    ("atn" "Atn" nil 0)
    ("attribute" "Attribute" nil 0)
    ("beep" "Beep" nil 0)
    ("begin" "Begin" nil 0)
    ("begintrans" "BeginTrans" nil 0)
    ("boolean" "Boolean" nil 0)
    ("byref" "ByRef" nil 0)
    ("byval" "ByVal" nil 0)
    ("call" "Call" nil 0)
    ("case" "Case" nil 0)
    ("cbool" "CBool" nil 0)
    ("cbyte" "CByte" nil 0)
    ("ccur" "CCur" nil 0)
    ("cdate" "CDate" nil 0)
    ("cdbl" "CDbl" nil 0)
    ("character" "Character" nil 0)
    ("chdir" "ChDir" nil 0)
    ("chdrive" "ChDrive" nil 0)
    ("choose" "Choose" nil 0)
    ("chr" "Chr" nil 0)
    ("chrb" "ChrB" nil 0)
    ("cint" "CInt" nil 0)
    ("classmodule" "ClassModule" nil 0)
    ("clipboard" "Clipboard" nil 0)
    ("clng" "CLng" nil 0)
    ("close" "Close" nil 5)
    ("collection" "Collection" nil 0)
    ("column" "Column" nil 0)
    ("columns" "Columns" nil 0)
    ("command" "Command" nil 0)
    ("committrans" "CommitTrans" nil 0)
    ("compactdatabase" "CompactDatabase" nil 0)
    ("component" "Component" nil 0)
    ("components" "Components" nil 0)
    ("const" "Const" nil 0)
    ("container" "Container" nil 0)
    ("containers" "Containers" nil 0)
    ("cos" "Cos" nil 0)
    ("createdatabase" "CreateDatabase" nil 0)
    ("createobject" "CreateObject" nil 0)
    ("csng" "CSng" nil 0)
    ("cstr" "CStr" nil 0)
    ("curdir" "CurDir" nil 0)
    ("currency" "Currency" nil 0)
    ("cvar" "CVar" nil 0)
    ("cverr" "CVErr" nil 0)
    ("data" "Data" nil 0)
    ("database" "Database" nil 0)
    ("databases" "Databases" nil 0)
    ("date" "Date" nil 0)
    ("dateadd" "DateAdd" nil 0)
    ("datediff" "DateDiff" nil 0)
    ("datepart" "DatePart" nil 0)
    ("dateserial" "DateSerial" nil 0)
    ("datevalue" "DateValue" nil 0)
    ("day" "Day" nil 0)
    ("dbengine" "DBEngine" nil 0)
    ("ddb" "DDB" nil 0)
    ("debug" "Debug" nil 0)
    ("declare" "Declare" nil 0)
    ("deftype" "Deftype" nil 0)
    ("deletesetting" "DeleteSetting" nil 0)
    ("dim" "Dim" nil 1)
    ("dir" "Dir" nil 0)
    ("do" "Do" nil 0)
    ("doevents" "DoEvents" nil 0)
    ("domain" "Domain" nil 0)
    ("double" "Double" nil 0)
    ("dynaset" "Dynaset" nil 0)
    ("each" "Each" nil 0)
    ("else" "Else" nil 2)
    ("end" "End" nil 4)
    ("endproperty" "EndProperty" nil 0)
    ("enum" "Enum" nil 0)
    ("environ" "Environ" nil 0)
    ("eof" "EOF" nil 0)
    ("erase" "Erase" nil 0)
    ("err" "Err" nil 0)
    ("error" "Error" nil 0)
    ("exit" "Exit" nil 1)
    ("exp" "Exp" nil 0)
    ("false" "False" nil 3)
    ("field" "Field" nil 0)
    ("fields" "Fields" nil 0)
    ("fileattr" "FileAttr" nil 0)
    ("filecopy" "FileCopy" nil 0)
    ("filedatetime" "FileDateTime" nil 0)
    ("filelen" "FileLen" nil 0)
    ("fix" "Fix" nil 0)
    ("font" "Font" nil 0)
    ("for" "For" nil 4)
    ("form" "Form" nil 0)
    ("format" "Format" nil 0)
    ("forms" "Forms" nil 0)
    ("formtemplate" "FormTemplate" nil 0)
    ("freefile" "FreeFile" nil 0)
    ("freelocks" "FreeLocks" nil 0)
    ("friend" "Friend" nil 0)
    ("function" "Function" nil 0)
    ("fv" "FV" nil 0)
    ("get" "Get" nil 1)
    ("getallsettings" "GetAllSettings" nil 0)
    ("getattr" "GetAttr" nil 0)
    ("getobject" "GetObject" nil 0)
    ("getsetting" "GetSetting" nil 0)
    ("global" "Global" nil 0)
    ("gosub" "GoSub" nil 0)
    ("goto" "GoTo" nil 0)
    ("group" "Group" nil 0)
    ("groups" "Groups" nil 0)
    ("hex" "Hex" nil 0)
    ("hour" "Hour" nil 0)
    ("if" "If" nil 29)
    ("iif" "IIf" nil 0)
    ("imestatus" "IMEStatus" nil 0)
    ("implements" "Implements" nil 0)
    ("input" "Input" nil 0)
    ("instr" "InStr" nil 0)
    ("int" "Int" nil 0)
    ("integer" "Integer" nil 1)
    ("ipmt" "IPmt" nil 0)
    ("irr" "IRR" nil 0)
    ("is" "Is" nil 0)
    ("isarray" "IsArray" nil 0)
    ("isdate" "IsDate" nil 0)
    ("isempty" "IsEmpty" nil 0)
    ("iserror" "IsError" nil 0)
    ("ismissing" "IsMissing" nil 0)
    ("isnull" "IsNull" nil 0)
    ("isnumeric" "IsNumeric" nil 0)
    ("isobject" "IsObject" nil 0)
    ("kill" "Kill" nil 0)
    ("lbound" "LBound" nil 0)
    ("lcase" "LCase" nil 0)
    ("left" "Left" nil 1)
    ("len" "Len" nil 0)
    ("let" "Let" nil 0)
    ("like" "Like" nil 0)
    ("line" "Line" nil 0)
    ("load" "Load" nil 0)
    ("loadpicture" "LoadPicture" nil 0)
    ("loadresdata" "LoadResData" nil 0)
    ("loadrespicture" "LoadResPicture" nil 0)
    ("loadresstring" "LoadResString" nil 0)
    ("loc" "Loc" nil 1)
    ("lock" "Lock" nil 0)
    ("lof" "LOF" nil 0)
    ("log" "Log" nil 0)
    ("long" "Long" nil 0)
    ("loop" "Loop" nil 0)
    ("lset" "LSet" nil 0)
    ("ltrim" "LTrim" nil 0)
    ("mdiform" "MDIForm" nil 0)
    ("me" "Me" nil 0)
    ("menuitems" "MenuItems" nil 0)
    ("menuline" "MenuLine" nil 0)
    ("mid" "Mid" nil 0)
    ("minute" "Minute" nil 0)
    ("mirr" "MIRR" nil 0)
    ("mkdir" "MkDir" nil 0)
    ("month" "Month" nil 0)
    ("msgbox" "MsgBox" nil 0)
    ("name" "Name" nil 0)
    ("new" "New" nil 0)
    ("next" "Next" nil 1)
    ("not" "Not" nil 0)
    ("nothing" "Nothing" nil 0)
    ("now" "Now" nil 0)
    ("nper" "NPer" nil 0)
    ("npv" "NPV" nil 0)
    ("object" "Object" nil 0)
    ("oct" "Oct" nil 0)
    ("on" "On" nil 0)
    ("open" "Open" nil 0)
    ("opendatabase" "OpenDatabase" nil 0)
    ("operator" "Operator" nil 0)
    ("option" "Option" nil 0)
    ("optional" "Optional" nil 0)
    ("or" "Or" nil 0)
    ("parameter" "Parameter" nil 0)
    ("parameters" "Parameters" nil 0)
    ("partition" "Partition" nil 0)
    ("picture" "Picture" nil 0)
    ("pmt" "Pmt" nil 0)
    ("ppmt" "PPmt" nil 0)
    ("print" "Print" nil 0)
    ("printer" "Printer" nil 0)
    ("printers" "Printers" nil 0)
    ("private" "Private" nil 0)
    ("projecttemplate" "ProjectTemplate" nil 0)
    ("properties" "Properties" nil 0)
    ("property" "Property" nil 0)
    ("public" "Public" nil 0)
    ("put" "Put" nil 0)
    ("pv" "PV" nil 0)
    ("qbcolor" "QBColor" nil 0)
    ("querydef" "QueryDef" nil 0)
    ("querydefs" "QueryDefs" nil 0)
    ("randomize" "Randomize" nil 0)
    ("rate" "Rate" nil 0)
    ("recordset" "Recordset" nil 0)
    ("recordsets" "Recordsets" nil 0)
    ("redim" "ReDim" nil 0)
    ("registerdatabase" "RegisterDatabase" nil 0)
    ("relation" "Relation" nil 0)
    ("relations" "Relations" nil 0)
    ("rem" "Rem" nil 0)
    ("repairdatabase" "RepairDatabase" nil 0)
    ("reset" "Reset" nil 0)
    ("resume" "Resume" nil 0)
    ("return" "Return" nil 0)
    ("right" "Right" nil 0)
    ("rmdir" "RmDir" nil 0)
    ("rnd" "Rnd" nil 0)
    ("rollback" "Rollback" nil 0)
    ("rowbuffer" "RowBuffer" nil 0)
    ("rset" "RSet" nil 0)
    ("rtrim" "RTrim" nil 0)
    ("savepicture" "SavePicture" nil 0)
    ("savesetting" "SaveSetting" nil 0)
    ("screen" "Screen" nil 0)
    ("second" "Second" nil 0)
    ("seek" "Seek" nil 0)
    ("selbookmarks" "SelBookmarks" nil 0)
    ("select" "Select" nil 0)
    ("selectedcomponents" "SelectedComponents" nil 0)
    ("sendkeys" "SendKeys" nil 0)
    ("set" "Set" nil 0)
    ("setattr" "SetAttr" nil 0)
    ("setdataaccessoption" "SetDataAccessOption" nil 0)
    ("setdefaultworkspace" "SetDefaultWorkspace" nil 0)
    ("sgn" "Sgn" nil 0)
    ("shell" "Shell" nil 0)
    ("sin" "Sin" nil 0)
    ("single" "Single" nil 0)
    ("sln" "SLN" nil 0)
    ("snapshot" "Snapshot" nil 0)
    ("space" "Space" nil 0)
    ("spc" "Spc" nil 0)
    ("sqr" "Sqr" nil 0)
    ("static" "Static" nil 0)
    ("step" "Step" nil 0)
    ("stop" "Stop" nil 0)
    ("str" "Str" nil 0)
    ("strcomp" "StrComp" nil 0)
    ("strconv" "StrConv" nil 0)
    ("string" "String" nil 0)
    ("sub" "Sub" nil 2)
    ("submenu" "SubMenu" nil 0)
    ("switch" "Switch" nil 0)
    ("syd" "SYD" nil 0)
    ("tab" "Tab" nil 0)
    ("table" "Table" nil 0)
    ("tabledef" "TableDef" nil 0)
    ("tabledefs" "TableDefs" nil 0)
    ("tan" "Tan" nil 0)
    ("then" "Then" nil 16)
    ("time" "Time" nil 0)
    ("timer" "Timer" nil 0)
    ("timeserial" "TimeSerial" nil 0)
    ("timevalue" "TimeValue" nil 0)
    ("to" "To" nil 1)
    ("trim" "Trim" nil 0)
    ("true" "True" nil 0)
    ("type" "Type" nil 0)
    ("typename" "TypeName" nil 0)
    ("ubound" "UBound" nil 0)
    ("ucase" "UCase" nil 0)
    ("unload" "Unload" nil 0)
    ("unlock" "Unlock" nil 0)
    ("val" "Val" nil 0)
    ("variant" "Variant" nil 0)
    ("vartype" "VarType" nil 0)
    ("verb" "Verb" nil 0)
    ("weekday" "Weekday" nil 0)
    ("wend" "Wend" nil 0)
    ("while" "While" nil 0)
    ("width" "Width" nil 0)
    ("with" "With" nil 0)
    ("workspace" "Workspace" nil 0)
    ("workspaces" "Workspaces" nil 0)
    ("write" "Write" nil 0)
    ("year" "Year" nil 0)
   ))

(define-abbrev-table 'web-mode-abbrev-table '())

