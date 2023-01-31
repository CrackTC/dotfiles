#!/usr/bin/sh
sudo pacman -S --noconfirm samba

path="$(cd "$(dirname $0)";cd ..;pwd)"

sudo cp --remove-destination $path/systemd/home-chen-smb.mount /etc/systemd/system/home-chen-smb.mount
sudo cp --remove-destination $path/systemd/home-chen-smb.automount /etc/systemd/system/home-chen-smb.automount

mkdir -p /etc/samba/credentials
sudo ln -snf $path/systemd/vps-smb /etc/samba/credentials/vps-smb

sudo systemctl daemon-reload
sudo systemctl enable home-chen-smb.automount
sudo systemctl start home-chen-smb.automount
