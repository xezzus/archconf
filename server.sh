#!/bin/sh

# WORKSPACE
mkdir -p /home/web/public

# METHOD INSTALL
install='pacman --noconfirm -S'

# INSTALL BIND
if [ `pacman -Qi | grep 'bind' | wc -l` -eq 0 ] ; then $install bind ; fi
if [ `pacman -Qi | grep 'dnsutils' | wc -l` -eq 0 ] ; then $install dnsutils ; fi
cp ./files/dev.zone /var/named && chown root:named /var/named/dev.zone

# INSTALL NGINX
if [ `pacman -Qi | grep 'nginx' | wc -l` -eq 0 ] ; then $install nginx ; fi
cp ./files/nginx.conf /etc/nginx

# INSTALL PHP
if [ `pacman -Qi | grep 'php' | wc -l` -eq 0 ] ; then $install php ; fi
if [ `pacman -Qi | grep 'php-fpm' | wc -l` -eq 0 ] ; then $install php-fpm ; fi
if [ `pacman -Qi | grep 'php-gd' | wc -l` -eq 0 ] ; then $install php-gd ; fi
if [ `pacman -Qi | grep 'php-mcrypt' | wc -l` -eq 0 ] ; then $install php-mcrypt ; fi
if [ `pacman -Qi | grep 'php-pear' | wc -l` -eq 0 ] ; then $install php-pear ; fi
if [ `pacman -Qi | grep 'php-pgsql' | wc -l` -eq 0 ] ; then $install php-pgsql ; fi
if [ `pacman -Qi | grep 'php-sqlite' | wc -l` -eq 0 ] ; then $install php-sqlite ; fi
if [ `pacman -Qi | grep 'php-xsl' | wc -l` -eq 0 ] ; then $install php-xsl ; fi
if [ `pecl list | grep mongo | wc -l` -eq 0 ] ; then pecl install mongo ; fi
cp ./files/php.ini /etc/php
cp ./files/php-fpm.conf /etc/php
