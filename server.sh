#!/bin/sh

# INSTALL BIND
if [ `pacman -Qi | grep 'bind' | wc -l` -eq 0 ] ; then pacman -S bind ; fi
if [ `pacman -Qi | grep 'dnsutils' | wc -l` -eq 0 ] ; then pacman -S dnsutils ; fi
cp ./files/dev.zone /var/named && chown root:named /var/named/dev.zone

# INSTALL NGINX
if [ `pacman -Qi | grep 'nginx' | wc -l` -eq 0 ] ; then pacman -S nginx ; fi
cp ./files/nginx.conf /etc/nginx

# INSTALL PHP
if [ `pacman -Qi | grep 'php' | wc -l` -eq 0 ] ; then pacman -S php ; fi
if [ `pacman -Qi | grep 'php-fpm' | wc -l` -eq 0 ] ; then pacman -S php-fpm ; fi
if [ `pacman -Qi | grep 'php-gd' | wc -l` -eq 0 ] ; then pacman -S php-gd ; fi
if [ `pacman -Qi | grep 'php-mcrypt' | wc -l` -eq 0 ] ; then pacman -S php-mcrypt ; fi
if [ `pacman -Qi | grep 'php-pear' | wc -l` -eq 0 ] ; then pacman -S php-pear ; fi
if [ `pacman -Qi | grep 'php-pgsql' | wc -l` -eq 0 ] ; then pacman -S php-pgsql ; fi
if [ `pacman -Qi | grep 'php-sqlite' | wc -l` -eq 0 ] ; then pacman -S php-sqlite ; fi
if [ `pacman -Qi | grep 'php-xsl' | wc -l` -eq 0 ] ; then pacman -S php-xsl ; fi
pecl install mongo
