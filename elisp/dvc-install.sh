#!/bin/bash

LISPDIR="$HOME/.emacs.d/elisp/vendor"
DVCSRC="$LISPDIR/dvc-src"
BUILDDIR="DVCSRC/build"
DVCDIR="$LISPDIR/dvc"
EMACSAPPDIR="/Applications/Emacs.app/Contents"
EMACSBINDIR="$EMACSAPPDIR/MacOs"
INFODIR="$EMACSAPPDIR/Resources/info"

echo "removing old src folder"
rm -r $DVCSRC
echo "checkout src"
bzr get http://bzr.xsteve.at/dvc/ $DVCSRC
echo "removing old dvc folder"
rm -r $DVCDIR
echo "switching to src folder: $DVCSRC"
cd $DVCSRC
echo "runinng autoconf"
autoconf
echo "creating and switching to build folder"
rm -r $BUILDDIR
mkdir $BUILDDIR
cd $BUILDDIR
echo "configuring"
$DVCSRC/configure --with-emacs=emacs --with-lispdir=$DVCDIR --infodir=$INFODIR
echo "make"
make
echo "make install"
make install
echo "removing src folder"
rm -r $DVCSRC
echo "installation finished"



