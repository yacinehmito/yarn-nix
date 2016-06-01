# Software to install and use.
{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  # Flash
  nixpkgs.config = {
    allowUnfree = true;
    firefox = {
      enableAdobeFlash = true;
    };
    chromium = {
      enablePepperFlash = true;
    };
  };


  environment.systemPackages = with pkgs ; [
    # idrisPackages.argparse
    idrisPackages.posix
    libwebsockets-master

    # CLI utilies
    zip unzip
    pstree # See processes
    htop # Monitor ressources
    silver-searcher # Search pattern in source code (ag)
    jq # JSON processor
    go-pup # HTML processor (pup)
    ghostscript # PS/PDF processor
    gnumake # Make

    # Image viewer
    imv

    # Document authoring
    asciidoctor
    # xelatex

    # Nix helpers
    nix-prefetch-scripts

    # Security
    gnupg

    # Version control
    git
    
    # Music
    beets
    # mpd
    # ncmpcpp

    # Media
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
    # firefox-wrapper
    chromium

    # Pdf
    zathura

    # IRC
    weechat

    # Graphics
    # inkscape
    graphviz

    # Runtimes/Compilers
    # openjdk8
    nodejs-5_x
    python3
    R
  ];
}
