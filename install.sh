#!/bin/sh

user=web

# INSTALL
pacman -Syy && pacman -Syu && pacman -S gvim terminus-font wicd sudo

# ADD USERS
useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video -s /bin/bash $user
passwd && passwd $user

# COMMAND
locale-gen
