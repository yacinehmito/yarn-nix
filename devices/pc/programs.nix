# Software to install and use.
{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs ; [
    # Compression
    zip
    unzip

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

    # Browsers
    firefox-wrapper
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
