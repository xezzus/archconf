#!/bin/sh

# ADD USERS
#useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video -s /bin/bash archie

# COPY CONFIG FILES
cp ./files/fstab /etc
cp ./files/locale.gen /etc
cp ./files/locale.conf /etc
cp ./files/vconsole.conf /etc
cp ./files/mirrorlist /etc/pacman.d

# COMMAND
locale-gen

# INSTALL
#pacman -Syy && pacman -Syu && pacman -S gvim terminus-font
