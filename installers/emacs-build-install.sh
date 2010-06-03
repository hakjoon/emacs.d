#!/bin/bash

VERSION="23.2"
LISPDIR="$HOME/.emacs.d/installers"
SRCDIR="$LISPDIR/emacs-src"
VERSIONFOLDER="$SRCDIR/emacs-$VERSION"
NSDIR="$VERSIONFOLDER/nextstep"

echo "removing old src folder"
rm -Rf $SRCDIR
echo "create src directory"
mkdir $SRCDIR
cd $SRCDIR
echo "get package"
curl -O http://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.gz
echo "unpack"
tar -zxvf emacs-$VERSION.tar.gz
echo "switch to version folder"
cd $VERSIONFOLDER
echo "configure"
./configure --with-ns --without-dbus
echo "make"
make
echo "make install"
make install
echo "Open folder"
open $NSDIR