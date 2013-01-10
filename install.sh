#!/bin/sh

# INSTALL
pacman -Syu && pacman -S gvim terminus-font

# COPY CONFIG FILES
cp ./files/fstab /etc
cp ./files/locale.gen /etc
cp ./files/locale.conf /etc
cp ./files/vconsole.conf /etc
cp ./files/mirrorlist /etc/pacman.d

# COMMAND
locale-gen
