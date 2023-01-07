#!/usr/bin/env bash

# Copied from https://www.roboleary.net/2021/09/02/linux-change-wallpaper.html
# See also https://help.gnome.org/admin/system-admin-guide/stable/desktop-background.html.en

# Usage:
#     Make this executable
#     `crontab -e` and add entry:
#     0 * * * * env DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /path/to/this/script

folder="${HOME}/Pictures/desktop_backgrounds"
pic=$(ls $folder/* | shuf -n1)

gsettings set org.gnome.desktop.background picture-options 'zoom'
gsettings set org.gnome.desktop.background picture-uri "file://$pic"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$pic"
