#!/bin/sh

abs community/dwm
cp -r /var/abs/community/dwm/* ./
cp ./files/dwm.c ./
cp ./files/config.h ./
makepkg -i --skipinteg --asroot --clean && rm *.tar.*
