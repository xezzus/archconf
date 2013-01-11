#!/bin/sh

# DATA
user=/home/web

# DWM
abs community/dwm
cp -r /var/abs/community/dwm/* ./
cp ./files/dwm.c ./
cp ./files/config.h ./
makepkg -i --skipinteg --asroot --clean && rm *.tar.*

# CONFIG ROOT
cp ./files/fstab /etc
cp ./files/locale.conf /etc
cp ./files/vconsole.conf /etc
cp ./files/sudoers /etc
cp ./files/gtkrc /etc/gtk-2.0

# CONFIG USER
cp ./files/xinitrc $user/.xinitrc
cp ./files/conkyrc $user/.conkyrc
cp -r ./files/config $user/.config
cp -r ./files/dzen $user/.dzen
cp -r ./files/mplayer $user/.mplayer
cp -r ./files/BSMsdm /usr/share/themes
cp -r ./files/Xeonyx /usr/share/icons
cp -r ./files/default /usr/share/icons
cp -r ./files/elementary /usr/share/icons

# COMMAND
if [ -z `locale | grep 'LANG=ru_RU'` ]
then
  cp ./files/locale.gen /etc
  locale-gen
fi

# ADD USERS
if [ -z `cat /etc/passwd | grep $user` ] 
then
  useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video,network -s /bin/bash $user
  passwd && passwd $user
fi

# ADD SERVICES
if [ -z `systemctl | grep 'wicd.service' | awk '{print($1)}'` ]
then
  systemctl enable wicd.service
fi
