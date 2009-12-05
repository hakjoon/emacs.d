#!/bin/bash

LISPDIR="$HOME/.emacs.d/vendor"
PROGDIR="$LISPDIR/cedet"
BACKUPDIR="$PROGDIR.backup"

echo "remove old slime backup dir $BACKUPDIR"
rm -r $BACKUPDIR
echo "backup current slime"
mv $PROGDIR $BACKUPDIR
echo "create cedet dir"
mkdir $PROGDIR
echo "switch to vendor dir"
cd $LISPDIR
echo "exporting new cedet snapshot"
cvs -d:pserver:anonymous@cedet.cvs.sourceforge.net:/cvsroot/cedet login
cvs -z3 -d:pserver:anonymous@cedet.cvs.sourceforge.net:/cvsroot/cedet export -DNOW cedet
echo "touch Makefile"
cd $PROGDIR
touch `find . -name Makefile`
make EMACS=emacs
