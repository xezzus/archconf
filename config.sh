#!/bin/sh

# DATA
user=web
conf=/root/archconf

# INSTALL

# DWM
abs community/dwm
cp -r /var/abs/community/dwm/* $conf
cp $conf/files/dwm.c $conf
cp $conf/files/config.h $conf
makepkg -i --skipinteg --asroot



# CONFIG ROOT
cp ./files/fstab /etc
cp ./files/locale.conf /etc
cp ./files/vconsole.conf /etc
cp ./files/sudoers /etc

# CONFIG USER
cp ./files/xinitrc /home/$user/.xinitrc

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
