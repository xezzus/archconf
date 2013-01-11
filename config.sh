#!/bin/sh

user=web

cp ./files/fstab /etc
cp ./files/locale.gen /etc
cp ./files/locale.conf /etc
cp ./files/vconsole.conf /etc
cp ./files/sudoers /etc
cp ./files/mirrorlist /etc/pacman.d
