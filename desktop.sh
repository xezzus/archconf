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

# CONFIG VIM
cp ./files/vide /usr/bin
cp ./files/jellybeans.vim /usr/share/vim/vim73/colors
cp ./files/vimrc /etc
cp ./files/mc.ext /etc/mc

# CONFIG USER
mkdir -p /home/web/.config
cp ./files/xinitrc $user/.xinitrc
cp ./files/conkyrc $user/.conkyrc
cp ./files/gitconfig $user/.gitconfig
cp -r ./files/config/sakura $user/.config
cp -r ./files/dzen $user/.dzen
cp -r ./files/mplayer $user/.mplayer

# CONFIG RTORRENT
cp ./files/rtorrect.rc $user/.rtorrect.rc
mkdir -p /media/torrent/session
mkdir -p /media/torrent/image
mkdir -p /media/torrent/books
mkdir -p /media/torrent/audio
mkdir -p /media/torrent/video
mkdir -p /media/image
mkdir -p /media/books
mkdir -p /media/audio
mkdir -p /media/video
mkdir -p /media/loads
ln -s /media/image $user
ln -s /media/books $user
ln -s /media/audio $user
ln -s /media/video $user
ln -s /media/loads $user

# CONFIG THEMES
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
