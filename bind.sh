#!/bin/sh

if [ -z `pacman -Qi | grep ': bind'`] ; then pacman -S bind ; fi
if [ -z `pacman -Qi | grep ': dnsutils'`] ; then pacman -S dnsutils ; fi

# INSTALL BIND
cp ./bind/named.conf.local ./
cp ./bind/named.conf.options ./
cp ./bind/db.dev ./
