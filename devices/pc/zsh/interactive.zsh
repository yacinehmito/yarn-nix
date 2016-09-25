# Zgen plugin manager
source "/home/gpyh/.local/share/zgen.git/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"
  
  zgen oh-my-zsh
  
  # Vi keybindings
  zgen oh-my-zsh plugins/vi-mode
  
  # Fish-like experience
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen oh-my-zsh themes/fishy

  # Colored man page
  zgen oh-my-zsh plugins/colored-man-pages
  
  zgen save
fi

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

# Menu interface to select completion
zstyle ':completion:*' menu select=1

# Cache auto-completion
mkdir -p $HOME/.zsh/cache
export CACHEDIR="$HOME/.zsh/cache"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $CACHEDIR
compinit -d $CACHEDIR/zcompdump

# Accept autosuggestion
bindkey '^f' autosuggest-accept
