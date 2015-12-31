# Software to install and use.
{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs ; [
    # Compression
    zip
    unzip

    # Theming
    gtk-engine-murrine
    numix-gtk-theme
    numix-icon-theme-circle

    # CLI utilies
    pstree
    silver-searcher

    # Nix helpers
    nix-prefetch-scripts

    # Security
    gnupg

    # Version control
    git

    # Xorg
    xsel

    # Music
    beets
    mpd
    ncmpcpp

    # Media
    mpv
    pavucontrol

    # Downloads
    transmission
    curl
    wget

    # Block devices
    ntfs3g

    # Terminal emulation
    termite

    # Editors & IDEs
    neovim
    idea.idea-community

    # Browsers
    firefox
    chromium

    # Pdf
    zathura

    # Languages
    nodejs
    openjdk
    gcc
    clang

    # Build tools
    gradle
    gnumake
    cmake

    # IRC
    weechat

    # Graphics
    inkscape
    graphviz
  ];
}
