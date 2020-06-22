# Path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.local/bin

# Variables
export BROWSER="firefox"
export EDITOR="nvim"
export FILE="ranger"
export HISTFILE="/home/amcg/.config/zsh/.zsh_history"
export LC_COLLATE=C
export READER="zathura"
export STATUSBAR="polybar"
export TERMINAL="termite"
export VISUAL="nvim"
export ZDOTDIR="$HOME/.config/zsh"

# Keep HOME clean
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESS=-R
export LESSHISTFILE="-"
export XDG_CONFIG_HOME="$HOME/.config"

# exec startx 2> $HOME/.xsession-errors
# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx -- -keeptty &> /dev/null
