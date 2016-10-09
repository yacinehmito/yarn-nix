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
    file # Guess the type

    # Hardware info
    hwinfo
    lshw
    lsscsi
    usbutils
    pciutils
    dmidecode
    hdparm

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

    # Editors
    (callPackage ./neovim { })

    # Downloads
    # transmission
    curl
    wget

    # Terminal emulation
    (callPackage ./termite { })

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
