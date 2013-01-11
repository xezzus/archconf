#!/bin/sh

# DATA
user=web

# INSTALL
cp ./files/mirrorlist /etc/pacman.d
pacman -Syy && pacman -Syu && pacman -S gvim terminus-font wicd sudo mc

# CONFIG
cp ./files/fstab /etc
cp ./files/locale.conf /etc
cp ./files/vconsole.conf /etc
cp ./files/sudoers /etc

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
if [ -z `systemctl | grep wicd` ]
then
  systemctl enable wicd.service
fi
