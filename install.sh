#!/bin/sh

cp ./files/mirrorlist /etc/pacman.d
pacman -Syy && pacman -Syu && pacman -S gvim terminus-font wicd sudo mc xorg-server dmenu dzen2 conky gthumb chromium sakura slim base-devel abs rtorrent
