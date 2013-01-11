#!/bin/sh
user=web

# INSTALL
pacman -Syy && pacman -Syu && pacman -S gvim terminus-font wicd sudo

# ADD USERS
useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video -s /bin/bash $user
passwd && passwd $user

# COPY CONFIG FILES
cp ./files/fstab /etc
cp ./files/locale.gen /etc
cp ./files/locale.conf /etc
cp ./files/vconsole.conf /etc
cp ./files/sudoers /etc
cp ./files/mirrorlist /etc/pacman.d

# COMMAND
locale-gen
