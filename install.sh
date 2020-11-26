#!/usr/bin/bash
rm -rf ~/.config/alacritty
rm -rf ~/.config/i3
rm -rf ~/.config/polybar
rm -rf ~/.config/ranger
rm -rf ~/.config/rofi

ln -s ~/repos/config.manjaro/alacritty ~/.config/alacritty
ln -s ~/repos/config.manjaro/i3 ~/.config/i3
ln -s ~/repos/config.manjaro/polybar ~/.config/polybar
ln -s ~/repos/config.manjaro/ranger ~/.config/ranger
ln -s ~/repos/config.manjaro/rofi ~/.config/rofi

rm ~/.config/compton.conf
ln -s ~/repos/config.manjaro/compton.conf ~/.config/compton.conf
