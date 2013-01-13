#!/bin/sh

dwm=/var/abs/community/dwm
abs community/dwm
patch $dwm/PKGBUILD ./patch/PKGBUILD.patch
cp ./files/dwm.c $dwm
cp ./files/config.h $dwm
cd $dwm && makepkg -i --skipinteg --asroot --clean && rm *.tar.*
