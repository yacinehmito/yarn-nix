# My fonts configuration.
{ config, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      inconsolata
      ubuntu_font_family
      unifont
      gyre-fonts
      xits-math
      lmodern
      lmmath
      dejavu_fonts
    ];
  };
}

