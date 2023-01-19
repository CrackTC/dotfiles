#!/usr/bin/sh
sudo pacman -S samba
sudo mv ./home-chen-smb.mount /etc/systemd/system/
mkdir -p /etc/samba/credentials
sudo mv ./vps-smb /etc/samba/credentials/
