
export OMD_SITE=###SITE###
export OMD_ROOT=###ROOT###

PATH=~/local/bin:~/bin:~/local/lib/perl5/bin:$PATH
export LD_LIBRARY_PATH=$OMD_ROOT/local/lib:$OMD_ROOT/lib

# enable local perl env
perlarch=$(perl -e 'use Config; print $Config{archname}')
export PERL5LIB="$OMD_ROOT/lib/perl5/lib/perl5/${perlarch}:$OMD_ROOT/lib/perl5/lib/perl5:$PERL5LIB"
export PERL5LIB="$OMD_ROOT/local/lib/perl5/lib/perl5/${perlarch}:$OMD_ROOT/local/lib/perl5/lib/perl5:$PERL5LIB"
export PATH="$OMD_ROOT/lib/perl5/bin:$PATH"
export MODULEBUILDRC="$OMD_ROOT/.modulebuildrc"
export PERL_MM_OPT=INSTALL_BASE="$OMD_ROOT/local/lib/perl5/"
export MANPATH="$OMD_ROOT/share/man:$MANPATH"
export PYTHONPATH="$OMD_ROOT/lib/python:$OMD_ROOT/local/lib/python"


if [ -f ~/etc/environment ] 
then
    eval $(egrep -v '^[[:space:]]*(#|$)' < ~/etc/environment | sed 's/^/export /')
fi

# Only load bashrc when in a bash shell and not loaded yet.
# The load once is ensured by the variable $BASHRC.
if [ "$BASH" -a -s ~/.bashrc -a -z "$BASHRC" ]; then
    . ~/.bashrc
fi
