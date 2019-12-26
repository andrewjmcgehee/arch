# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Colors
autoload -U colors && colors

# NOTE: The order of sourcing is important. First, ZSH related vars which Oh My Zsh will use, then
#       Oh My Zsh itself, then aliases which will override Oh My Zsh aliases, then Zsh syntax 
#       highlighting

# Path to your oh-my-zsh installation.
export ZSH="/home/amcg/.oh-my-zsh"
export ZDOTDIR="/home/amcg/.config/zsh"

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

## USER CONFIG ##
git_branch() {
  git branch 2>/dev/null | sed '/^[^*]/d; s/* \(.*\)/ ⎇ \1/'
}

git_modified() {
  if [[ "$(git_branch)" != "" ]]; then
    git status 2>/dev/null | grep 1>/dev/null 'working tree clean' || printf '*'
  fi
}

# Prompt
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%b%{$fg[yellow]%}\$(git_branch)\$(git_modified)%B%{$fg[red]%}]%{$reset_color%}$%b "

# Aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Variables
export EDITOR="/usr/bin/nvim"
export HISTFILE="/home/amcg/.config/zsh/.zsh_history"
export LC_COLLATE=C
export VISUAL="/usr/bin/nvim"

# Vim keys for menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null

# Silence beep
amixer sset 'Beep' 0% >/dev/null
