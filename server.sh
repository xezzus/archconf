#!/bin/sh

# INSTALL BIND
if [ `pacman -Qi | grep 'bind' | wc -l` -eq 0 ] ; then pacman -S bind ; fi
if [ `pacman -Qi | grep 'dnsutils' | wc -l` -eq 0 ] ; then pacman -S dnsutils ; fi
if ! [ -f '/var/named/dev.zone' ] ; then cp ./bind/dev.zone /var/named && chown root:named /var/named/dev.zone ; fi

# INSTALL NGINX
if [ `pacman -Qi | grep 'nginx' | wc -l` -eq 0 ] ; then pacman -S nginx ; fi
