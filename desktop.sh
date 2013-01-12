#!/bin/sh

# METHOD INSTALL
install='pacman --noconfirm -S'
user=/home/web

if [ `pacman -Qi | grep 'xorg-server' | wc -l` -eq 0 ] ; then $install xorg-server ; fi
if [ `pacman -Qi | grep 'dmenu' | wc -l` -eq 0 ] ; then $install dmenu ; fi
if [ `pacman -Qi | grep 'dzen2' | wc -l` -eq 0 ] ; then $install dzen2 ; fi
if [ `pacman -Qi | grep 'conky' | wc -l` -eq 0 ] ; then $install conky ; fi
if [ `pacman -Qi | grep 'gthumb' | wc -l` -eq 0 ] ; then $install gthumb ; fi
if [ `pacman -Qi | grep 'chromium' | wc -l` -eq 0 ] ; then $install chromium ; fi
if [ `pacman -Qi | grep 'sakura' | wc -l` -eq 0 ] ; then $install sakura ; fi
if [ `pacman -Qi | grep 'slim' | wc -l` -eq 0 ] ; then $install slim ; fi
if [ `pacman -Qi | grep 'slim-themes' | wc -l` -eq 0 ] ; then $install slim-themes ; fi

# DWM
abs community/dwm
cp -r /var/abs/community/dwm/* ./
cp ./files/dwm.c ./
cp ./files/config.h ./
makepkg -i --skipinteg --asroot --clean && rm *.tar.*

# CONFIG USER
mkdir -p /home/web/.config
cp ./files/xinitrc $user/.xinitrc
cp ./files/conkyrc $user/.conkyrc
cp -r ./files/config/sakura $user/.config
cp -r ./files/dzen $user/.dzen
cp -r ./files/mplayer $user/.mplayer

# CONFIG THEMES
cp ./files/gtkrc /etc/gtk-2.0
cp -r ./files/BSMsdm /usr/share/themes
cp -r ./files/Xeonyx /usr/share/icons
cp -r ./files/default /usr/share/icons
cp -r ./files/elementary /usr/share/icons
