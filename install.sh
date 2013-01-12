#!/bin/sh

# METHOD INSTALL
user=web
install='pacman --noconfirm -S'

# UPDATE
cp ./files/mirrorlist /etc/pacman.d
pacman -Syy && pacman -Syu

# INSTALL
if [ `pacman -Qi | grep 'lilo' | wc -l` -eq 0 ] ; then $install lilo ; fi
if [ `pacman -Qi | grep 'gvim' | wc -l` -eq 0 ] ; then $install gvim ; fi
if [ `pacman -Qi | grep 'terminus-font' | wc -l` -eq 0 ] ; then $install terminus-font ; fi
if [ `pacman -Qi | grep 'wicd' | wc -l` -eq 0 ] ; then $install wicd ; fi
if [ `pacman -Qi | grep 'sudo' | wc -l` -eq 0 ] ; then $install sudo ; fi
if [ `pacman -Qi | grep 'mc' | wc -l` -eq 0 ] ; then $install mc ; fi

# CONFIG ROOT
cp ./files/fstab /etc
cp ./files/locale.conf /etc
cp ./files/vconsole.conf /etc
cp ./files/sudoers /etc
cp ./files/vide /usr/bin
cp ./files/jellybeans.vim /usr/share/vim/vim73/colors
cp ./files/vimrc /etc
cp ./files/mc.ext /etc/mc

# COMMAND
if [ -z `locale | grep 'LANG=ru_RU'` ]
then
  cp ./files/locale.gen /etc
  locale-gen
fi

# ADD USERS
if [ `cat /etc/passwd | grep $user | wc -l` -eq 0 ] 
then
  useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video,network -s /bin/bash $user
  passwd && passwd $user
fi

# ADD SERVICES
if [ -z `systemctl | grep 'wicd.service' | awk '{print($1)}'` ]
then
  systemctl enable wicd.service
fi
