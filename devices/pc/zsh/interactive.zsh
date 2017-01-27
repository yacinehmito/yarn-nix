# Fix problems between tiling WM and IntelliJ Idea
export _JAVA_AWT_WM_NONREPARENTING=1

# Enable colors
autoload -U colors
colors

## App specifics

# Default apps in environment variables
export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export MANPAGER=$PAGER

# =======================================

# Enable auto-cd
setopt autocd

# Don't wait to much for an input when pressing <ESC>
export KEYTIMEOUT=1

# Support for "advanced" prompt
setopt promptsubst
autoload -U promptinit
promptinit

# Bash completion compatibility mode
autoload bashcompinit
bashcompinit

# Menu interface to select completion
zstyle ':completion:*' menu select=1

# Cache auto-completion
mkdir -p $HOME/.zsh/cache
export CACHEDIR="$HOME/.zsh/cache"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $CACHEDIR

# Accept autosuggestion
bindkey '^f' autosuggest-accept

function rgl {
  rg --color=always --heading -n $@ | less -R
}

function rgf {
  rg --files -g $@
}

function rgfl {
  rg --color=always --heading -n --files -g $@ | less -R
}

