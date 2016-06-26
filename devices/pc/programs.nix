# Software to install and use.
{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs ; [

    # CLI utilies
    zip unzip
    pstree # See processes
    htop # Monitor ressources
    silver-searcher # Search pattern in source code (ag)
    jq # JSON processor
    go-pup # HTML processor (pup)
    ghostscript # PS/PDF processor
    gnumake # Make

    # Document authoring
    asciidoctor

    # Nix helpers
    nix-prefetch-scripts

    # Security
    gnupg

    # Version control
    git

    # Media
    beets
    mpd
    ncmpcpp
    mpv
    pavucontrol

    # Downloads
    # transmission
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
    # idris
    nodejs-5_x
    python3
    R
  ];
}
