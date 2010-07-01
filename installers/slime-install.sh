#!/bin/bash

LISPDIR="$HOME/.emacs.d/vendor"
SLIMEDIR="$LISPDIR/slime"
BACKUPDIR="$SLIMEDIR.backup"

echo "remove old slime backup dir $BACKUPDIR"
rm -r $BACKUPDIR
echo "backup current slime"
mv $SLIMEDIR $BACKUPDIR
echo "switch to lisp dir"
cd $LISPDIR
echo "exporting new slime snapshot"
cvs -d :pserver:anonymous:anonymous@common-lisp.net:/project/slime/cvsroot export -DNOW slime 
