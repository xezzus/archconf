#!/bin/sh

# METHOD INSTALL
install='pacman --noconfirm -S'

# INSTALL
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
if [ `pecl list | grep mongo | wc -l` -eq 0 ] ; then pecl install mongo ; fi

# CONFIG
mkdir -p /home/web/public
cp -r ./files/info /home/web/public
cp ./files/php.ini /etc/php
cp ./files/php-fpm.conf /etc/php
cp ./files/dev.zone /var/named && chown root:named /var/named/dev.zone
cp ./files/nginx.conf /etc/nginx

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
