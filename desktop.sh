#!/bin/sh

# METHOD INSTALL
install='pacman --noconfirm -S'
user=/home/web

if [ `pacman -Qi xorg-xsetroot | wc -l` -eq 0 ] ; then $install xorg-xsetroot ; fi
if [ `pacman -Qi xorg-server | wc -l` -eq 0 ] ; then $install xorg-server ; fi
if [ `pacman -Qi xorg-xinit | wc -l` -eq 0 ] ; then $install xorg-xinit ; fi
if [ `pacman -Qi dmenu | wc -l` -eq 0 ] ; then $install dmenu ; fi
if [ `pacman -Qi dzen2 | wc -l` -eq 0 ] ; then $install dzen2 ; fi
if [ `pacman -Qi conky | wc -l` -eq 0 ] ; then $install conky ; fi
if [ `pacman -Qi gtk-engines | wc -l` -eq 0 ] ; then $install gtk-engines ; fi
if [ `pacman -Qi gtk-aurora-engine | wc -l` -eq 0 ] ; then $install gtk-aurora-engine ; fi
if [ `pacman -Qi gthumb | wc -l` -eq 0 ] ; then $install gthumb ; fi
if [ `pacman -Qi chromium | wc -l` -eq 0 ] ; then $install chromium ; fi
if [ `pacman -Qi sakura | wc -l` -eq 0 ] ; then $install sakura ; fi
if [ `pacman -Qi slim | wc -l` -eq 0 ] ; then $install slim ; fi
if [ `pacman -Qi slim-themes | wc -l` -eq 0 ] ; then $install slim-themes ; fi
if [ `pacman -Qi ttf-droid | wc -l` -eq 0 ] ; then $install ttf-droid ; fi
if [ `pacman -Qi flashplugin | wc -l` -eq 0 ] ; then $install flashplugin ; fi
if [ `pacman -Qi alsa-utils | wc -l` -eq 0 ] ; then $install alsa-utils ; fi
if [ `pacman -Qi alsa-lib | wc -l` -eq 0 ] ; then $install alsa-lib ; fi
if [ `pacman -Qi alsa-oss | wc -l` -eq 0 ] ; then $install alsa-oss ; fi
if [ `pacman -Qi alsa-plugin | wc -l` -eq 0 ] ; then $install alsa-plugin ; fi
if [ `pacman -Qi libflashsupport-oss | wc -l` -eq 0 ] ; then $install libflashsupport-oss ; fi

# CONFIG USER
mkdir -p /home/web/.config
cp ./files/vide /usr/bin
cp ./files/xinitrc $user/.xinitrc
cp ./files/conkyrc $user/.conkyrc
cp ./files/slim.conf /etc
cp ./files/fonts.conf /etc/fonts
cp ./files/20-keyboard-layout.conf /etc/X11/xorg.conf.d
cp -r ./files/config/sakura $user/.config
cp -r ./files/config/mc $user/.config
cp -r ./files/dzen $user/.dzen
cp -r ./files/mplayer $user/.mplayer

# CONFIG THEMES
cp ./files/gtkrc /etc/gtk-2.0
cp -r ./files/BSMsdm /usr/share/themes
cp -r ./files/Xeonyx /usr/share/icons
cp -r ./files/default /usr/share/icons
cp -r ./files/elementary /usr/share/icons

chown -R web:users $user

# DWM
./dwm.sh
