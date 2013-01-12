#!/bin/sh

if [ `pacman -Qi | grep 'bind' | wc l ` -eq 0 ] ; then pacman -S bind ; fi
if [ `pacman -Qi | grep 'dnsutils' | wc l` -eq 0 ] ; then pacman -S dnsutils ; fi

# INSTALL BIND
cp ./bind/named.conf.local ./
cp ./bind/named.conf.options ./
cp ./bind/db.dev ./
