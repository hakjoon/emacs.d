#!/bin/bash

LISPDIR="$HOME/.emacs.d/elisp/vendor"
SRC="$LISPDIR/emacs-w3m"
BUILDDIR="$SRC/build"
DIR="$LISPDIR/w3m"
EMACSAPPDIR="/Applications/Emacs.app/Contents"
EMACSBINDIR="$EMACSAPPDIR/MacOs"
INFODIR="$EMACSAPPDIR/Resources/info"

echo "removing old src folder"
rm -r $SRC
cd $LISPDIR
echo "checkout src"
cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot login  # just press enter for the pw
cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot co emacs-w3m
echo "removing old w3m folder"
rm -r $DIR
echo "switching to src folder: $SRC"
cd $SRC
echo "runinng autoconf"
autoconf
echo "creating and switching to build folder"
rm -r $BUILDDIR
mkdir $BUILDDIR
cd $BUILDDIR
echo "configuring"
$SRC/configure --with-emacs=emacs --with-lispdir=$DIR --infodir=$INFODIR
echo "make"
make
echo "make install"
make install