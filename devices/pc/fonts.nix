# My fonts configuration.
{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      inconsolata
      ubuntu_font_family
      dejavu_fonts
      noto-fonts
      noto-fonts-emoji
      gyre-fonts
      xits-math
      lmodern
      lmmath
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["Noto Mono"];
        sansSerif = ["Noto Sans"];
        serif = ["Noto Serif"];
      };
    };
  };
}
