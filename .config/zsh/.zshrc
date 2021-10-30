# Luke's config for the Zoomer Shell
ZSH_THEME="dracula"

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
setopt SHARE_HISTORY
HISTSIZE=100000
SAVEHIST=100000
#HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
# zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

eval `dircolors ~/.dir_colors`

# Load aliases and shortcuts if existent.
[[ ! -f ~/.config/.aliasrc ]] || source ~/.config/.aliasrc
[[ ! -f ~/.config/.fsanitizerrc ]] || source ~/.config/.fsanitizerrc

# dbus-update-activation-environment --all

alias ls='ls --color=always'
alias dir='dir --color=always'
alias vdir='vdir --color=always'

alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "^ " autosuggest-accept

# Load zsh-syntax-highlighting; should be last.
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
