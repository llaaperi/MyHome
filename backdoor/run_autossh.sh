#!/bin/sh

autossh -M 50000 -N -f -o "ServerAliveInterval 20" -o "ServerAliveCountMax 3" -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -i /home/pi/vekarus.key -R 50001:127.0.0.1:80 vekarus@sg.laaperi.fi
