alias real='. ~/.bash_aliases'
alias vial='vi ~/.bash_aliases; real;'

alias  l='ls -alCFs'
alias lt='ls -lAt'
alias lm='lt | more'
alias la='ls -lAt'
alias lh='lt | head -20'
alias lha='la | head'
alias  m='more '
alias cd..='cd ..'
alias dc='cd'
alias grpe='grep'
alias iv='vi'
alias dir='ls -lAt | grep ^d'
alias lnk='ls -lAt | grep ^l'
alias ulb='cd /usr/local/bin; lh;'
alias ull='cd /usr/local/lib; lh;'

alias hh='fc -l'
alias  r='fc -s'
alias fnd='find . -name'

alias lnz='la | grep -v "   0 "' # lnonzero
alias lz='la | grep    "   0 "'
alias lhnz='lnz | head'
alias  bysize=' sort -k +4 -n '  # +2=byowner

alias files='grep "^\-" | cut -c55-'
alias txtfiles='file * | egrep "text|script"'

alias ruler='echo ...................................................................................................1...................................................................................................2; echo .........1.........2.........3.........4.........5.........6.........7.........8.........9.........0.........1.........2.........3.........4.........5.........6.........7.........8.........9.........0; echo 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'

alias ruler22='echo ...................................................................................................1.................................................................; echo .........1.........2.........3.........4.........5.........6.........7.........8.........9.........0.........1.........2.........3.........4.........5.........6.....; echo 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345'



alias red='echo "^[[0;31;40mRED ON"'
alias yellow='echo "^[[1;33;40mYELLOW ON"'
alias green='echo "^[[1;32;40mGREEN ON"'

# Jump Aliases (CD)
alias myc='cd /cygdrive/c'
alias myd='cd /cygdrive/d'

alias drives='cd /cygdrive/'
alias mine='cd "/cygdrive/c/users/jwfbw/"'
alias pers='cd "/cygdrive/c/users/jwfbw/Documents/2. Personal/"'
alias dnld='cd "/cygdrive/c/users/jwfbw/downloads/"'
alias avt='cd /cygdrive/d/Storage/ZBook/Documents/1/ASRS/asrs_repo'
alias evl='cd  "/cygdrive/c/users/jwfbw/Documents/1. Avnet/EVOLVE/"'
alias  rp='cd  "/cygdrive/c/users/jwfbw/Documents/1. Avnet/RP/"'
alias phx='cd "/cygdrive/c/users/jwfbw/Documents/1. Avnet/EVOLVE/ASRS/ASRS_repo/phx/branches/1.0"'
export CDPATH="/cygdrive/c/users/jwfbw/Documents/1. Avnet/EVOLVE/ASRS/ASRS_repo/phx/branches/1.0"


## Server Connect
#
# BOXWORKS
#
threem=192.168.192.44   # 3M
essity=192.168.192.77   # bw-gre-64
hager=192.168.192.46
bwhager=$hager
hagerco=10.10.3.87
mgm0=10.20.3.20
mgm1=10.20.3.21
mgm2=10.20.3.22
guitarctr=192.168.192.43
mouser=192.168.192.45
fanuc=192.168.192.52
gfs=192.168.192.
cocacola=10.10.11.15
trnnee64=10.192.56.23
bwnee64=192.168.192.71

#    local directories
alias clients='cd "/cygdrive/c/users/jwfbw/Documents/1. Boxworks/Clients"'
alias bw=' cd "/cygdrive/c/users/jwfbw/Documents/1. Boxworks"'

#
alias 3m='echo Connecting to 3M \($threem\)...; ssh johnf@$threem'
alias hager='echo Connecting to HAGER \($hager\)...; ssh johnf@$hager'
alias hagerco='echo Connecting to HAGER CO \($hagerco\)...; ssh johnf@$hagerco'
alias fanuc='echo Connecting to FANUC \($fanuc\)...; ssh reed@$fanuc'
alias go='function _go() { echo Connecting to $1...; ssh johnf@$1; }; _go'

#
# RED PRAIRIE
alias r1d='host=rplschd1d; echo Connecting To $host...; ssh rplswm@$host'
alias r2d='host=rplschd1d; echo Connecting To $host...; ssh rplswm@$host'
alias r1t='host=rplschd1d; echo Connecting To $host...; ssh rplswm@$host'
alias r2t='host=rplschd1d; echo Connecting To $host...; ssh rplswm@$host'
#
# ASRS
#
#    - NOGALES
alias ant='host=nogasrst; echo Connecting to $host...; ssh jfierke@$host'
alias anp='host=nogasrsp; echo Connecting to $host...; ssh jfierke@$host'
alias nrp='host=nogasrpt2; echo Connecting to $host...; ssh jfierke@$host'
alias nrp2='host=nogasrpt2; echo Connecting to $host...; ssh asrsrpt@$host'
#
#    - LINUX
alias ald='host=lnxasrsd; echo Connecting to $host...; ssh jfierke@$host'
alias alt='host=lnxasrst; echo Connecting to $host...; ssh jfierke@$host'
alias alp='host=lnxasrsp; echo Connecting to $host...; ssh jfierke@$host'
#
#    - EVOLVE
alias aed='host=evlasrsd; echo Connecting to $host...; ssh jfierke@$host'
alias aet='host=evlasrst; echo Connecting to $host...; ssh jfierke@$host'
alias aes='host=evlasrss; echo Connecting to $host...; ssh jfierke@$host'
alias aep='host=evlasrsp; echo Connecting to $host...; ssh jfierke@$host'
alias stw='host=stewie; echo Connecting to $host...; ssh jfierke@stewie'
#
alias mc1='host=mcconveyor1; echo Connecting to $host...; ssh jfierke@$host'
alias mc2='host=mcconveyor2; echo Connecting to $host...; ssh jfierke@$host'
#
#    - FIERKE.NET
alias jwf='host=fierke.net; echo Connecting to $host...; ssh jwf@$host'

alias galaga='host=192.168.0.26; echo Connecting to $host...; ssh ferkee@$host'
alias mac='host=192.168.0.10; echo Connecting to $host...; ssh samantha@$host'
alias macadmin='host=192.168.0.10; echo Connecting to $host; ssh admin@host'

alias emacs2='/usr/bin/emacs-nox'


alias xamp='cd /cygdrive/c/xampp/'
alias htd='cd /cygdrive/c/xampp/htdocs/'
alias weblog='cd /cygdrive/c/xampp/apache/logs'
alias appdata='cd /cygdrive/c/Users/jwfbw/AppData'

alias send.fix='function _send.fix() { scp $1 jfierke@evlasrsp:/pri/sap/; }; _send.fix'

alias a2b='function _a2b() { what=$1; what_dir=`dirname $what`; from_host=$2; to_host=$3; to_dir=${4:-$what_dir}; cmd="scp -3 -v johnf@$from_host:$what johnf@$to_host:$to_dir"; ays "$cmd"; if [ $? -eq 0 ]; then echo SKIPPING;return 0; else $cmd; return 1; fi ; }; _a2b '


alias wcs='cd /cygdrive/c/Boxworks/BoxWorksWCS/BoxWorksWcsSvc'

