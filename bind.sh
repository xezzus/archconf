#!/bin/sh

if [ -z `pacman -Qi | grep ': bind'`] ; then pacman -S bind ; fi
if [ -z `pacman -Qi | grep ': dnsutils'`] ; then pacman -S dnsutils ; fi

# INSTALL BIND
cp ./files/named.conf.local ./
cp ./files/named.conf.options ./
cp ./files/db.dev ./
