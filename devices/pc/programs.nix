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
    asciidoctor
    # Compression
    zip
    unzip

    # CLI utilies
    pstree
    silver-searcher
    jq
    go-pup
    ghostscript

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
    firefox-wrapper
    chromium

    # Pdf
    zathura

    # IRC
    weechat

    # Graphics
    inkscape
    graphviz
  ];
}
