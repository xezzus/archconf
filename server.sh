#!/bin/sh

# METHOD INSTALL
install='pacman --noconfirm -S'

# INSTALL
if [ `pacman -Qi | grep 'autoconf' | wc -l` -eq 0 ] ; then $install autoconf ; fi
if [ `pacman -Qi | grep 'automake' | wc -l` -eq 0 ] ; then $install automake ; fi
if [ `pacman -Qi | grep 'binutils' | wc -l` -eq 0 ] ; then $install binutils ; fi
if [ `pacman -Qi | grep 'bison' | wc -l` -eq 0 ] ; then $install bison ; fi
if [ `pacman -Qi | grep 'fakeroot' | wc -l` -eq 0 ] ; then $install fakeroot ; fi
if [ `pacman -Qi | grep 'flex' | wc -l` -eq 0 ] ; then $install flex ; fi
if [ `pacman -Qi | grep 'gawk' | wc -l` -eq 0 ] ; then $install gawk ; fi
if [ `pacman -Qi | grep 'gcc' | wc -l` -eq 0 ] ; then $install gcc ; fi
if [ `pacman -Qi | grep 'gettext' | wc -l` -eq 0 ] ; then $install gettext ; fi
if [ `pacman -Qi | grep 'libtool' | wc -l` -eq 0 ] ; then $install libtool ; fi
if [ `pacman -Qi | grep 'm4' | wc -l` -eq 0 ] ; then $install m4 ; fi
if [ `pacman -Qi | grep 'make' | wc -l` -eq 0 ] ; then $install make ; fi
if [ `pacman -Qi | grep 'patch' | wc -l` -eq 0 ] ; then $install patch ; fi
if [ `pacman -Qi | grep 'pkg-config' | wc -l` -eq 0 ] ; then $install pkg-config ; fi
if [ `pacman -Qi | grep 'bind' | wc -l` -eq 0 ] ; then $install bind ; fi
if [ `pacman -Qi | grep 'dnsutils' | wc -l` -eq 0 ] ; then $install dnsutils ; fi
if [ `pacman -Qi | grep 'nginx' | wc -l` -eq 0 ] ; then $install nginx ; fi
if [ `pacman -Qi | grep 'php' | wc -l` -eq 0 ] ; then $install php ; fi
if [ `pacman -Qi | grep 'php-fpm' | wc -l` -eq 0 ] ; then $install php-fpm ; fi
if [ `pacman -Qi | grep 'php-gd' | wc -l` -eq 0 ] ; then $install php-gd ; fi
if [ `pacman -Qi | grep 'php-mcrypt' | wc -l` -eq 0 ] ; then $install php-mcrypt ; fi
if [ `pacman -Qi | grep 'php-pear' | wc -l` -eq 0 ] ; then $install php-pear ; fi
if [ `pacman -Qi | grep 'php-pgsql' | wc -l` -eq 0 ] ; then $install php-pgsql ; fi
if [ `pacman -Qi | grep 'php-sqlite' | wc -l` -eq 0 ] ; then $install php-sqlite ; fi
if [ `pacman -Qi | grep 'php-xsl' | wc -l` -eq 0 ] ; then $install php-xsl ; fi
if [ `pacman -Qi | grep 'vim' | wc -l` -eq 0 ] ; then $install gvim ; fi
if [ `pacman -Qi | grep 'mc' | wc -l` -eq 0 ] ; then $install mc ; fi
if [ `pecl list | grep mongo | wc -l` -eq 0 ] ; then pecl install mongo ; fi

# CONFIG
mkdir -p /home/web/public
cp -r ./files/info /home/web/public
cp ./files/php.ini /etc/php
cp ./files/php-fpm.conf /etc/php
cp ./files/dev.zone /var/named
cp ./files/nginx.conf /etc/nginx
cp ./files/vimrc /etc
cp ./files/vide /usr/bin
cp ./files/jellybeans.vim /usr/share/vim/vim73/colors
cp ./files/mc.ext /etc/mc

# ADD PHP-FPM
if [ `systemctl | grep 'php-fpm.service' | wc -l` -eq 0 ]
then
  systemctl enable php-fpm.service
fi

# ADD NGINX
if [ `systemctl | grep 'nginx.service' | wc -l` -eq 0 ]
then
  systemctl enable nginx.service
fi

# ADD BIND
if [ `systemctl | grep 'named.service' | wc -l` -eq 0 ]
then
  systemctl enable named.service
fi

# CHOWN
chown -R web:users /home/web
chown root:named /var/named/dev.zone
