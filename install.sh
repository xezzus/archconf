#!/bin/sh

# COPY CONFIG FILES
cp ./files/fstab /etc
cp ./files/locale.gen /etc

# COMMAND
locale-gen
