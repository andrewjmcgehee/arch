#!/usr/bin/env sh

# xinitrc runs automatically when startx is run

# Some important commands are in ~/.xprofile so it is sourced here 
[ -f ~/.xprofile ] && . ~/.xprofile

# start window manager 
exec bspwm
