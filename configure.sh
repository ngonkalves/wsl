#!/usr/bin/env sh

# removes existing resolv.conf
sudo rm /etc/resolv.conf

# copy new configuration files to /etc
cp ./etc/* /etc