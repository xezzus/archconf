#!/bin/sh

# METHOD INSTALL
user=/home/web
image=/media/image
books=/media/books
audio=/media/audio
video=/media/video
loads=/media/loads

# INSTALL
if [ `pacman -Qi rtorrent | wc -l` -eq 0 ] ; then $install rtorrect ; fi
if [ `pacman -Qi screen | wc -l` -eq 0 ] ; then $install screen ; fi

# CONFIG
cp ./files/rtorrent /etc/rc.s
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
if ! [ -f $user/image ] ; then ln -s $image $user ; fi
if ! [ -f $user/books ] ; then ln -s $books $user ; fi
if ! [ -f $user/audio ] ; then ln -s $audio $user ; fi
if ! [ -f $user/video ] ; then ln -s $video $user ; fi
if ! [ -f $user/loads ] ; then ln -s $loads $user ; fi

