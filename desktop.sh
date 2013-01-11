#!/bin/sh

# DATA
user=/home/web
image=/media/image
books=/media/books
audio=/media/audio
video=/media/video
loads=/media/loads

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
cp ./files/rtorrent.rc $user/.rtorrent.rc
mkdir -p /media/torrent/session
mkdir -p /media/torrent/image
mkdir -p /media/torrent/books
mkdir -p /media/torrent/audio
mkdir -p /media/torrent/video
mkdir -p $image
mkdir -p $books
mkdir -p $audio
mkdir -p $video
mkdir -p $loads
if ! [ -d $image ] ; then ln -s $image $user ; fi
if ! [ -d $books ] ; then ln -s $books $user ; fi
if ! [ -d $audio ] ; then ln -s $audio $user ; fi
if ! [ -d $video ] ; then ln -s $video $user ; fi
if ! [ -d $loads ] ; then ln -s $loads $user ; fi

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
