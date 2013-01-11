#!/bin/sh

cp ./files/mirrorlist /etc/pacman.d
pacman -Syy && pacman -Syu && pacman -S gvim terminus-font wicd sudo mc xorg-server dmenu dzen2 chromium sakura slim base-devel abs
