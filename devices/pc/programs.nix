# Software to install and use.
{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs ; [

    # C and Unix stuff
    stdenv

    # CLI utilies
    zip unzip
    pstree # See processes
    htop # Monitor ressources
    silver-searcher # Search pattern in source code (ag)
    jq # JSON processor
    go-pup # HTML processor (pup)
    ghostscript # PS/PDF processor

    # Document authoring
    asciidoctor
    xelatex

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

    # Terminal emulation
    termite

    # Editors
    neovim

    # Browsers
    firefox
    chromium

    # Pdf
    zathura

    # IRC
    weechat

    # Graphics
    inkscape
    graphviz

    # Runtimes
    openjdk8
    nodejs-5_x
    python3
    R
  ];
}
