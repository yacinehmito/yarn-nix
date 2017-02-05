# Software to install and use.
{ config, pkgs, ... }:

{

  programs.zsh.enable = true;
  programs.st.enable = true;

  environment.systemPackages = with pkgs ; [
    # CLI utilies
    zip unzip
    pstree # See processes
    htop # Monitor ressources
    ripgrep # Search pattern in source code (rg)
    jq # JSON processor
    go-pup # HTML processor (pup)
    ghostscript # PS/PDF processor
    gnumake # Make
    file # Guess the type
    nix-utils # My own nix aliases

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
    xterm
    alacritty

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
    nodejs-6_x
    python3
    R
  ];
}
