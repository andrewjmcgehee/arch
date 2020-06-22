# Colors
autoload -U colors && colors

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

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
