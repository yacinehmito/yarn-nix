# My user configuration.
{ config, pkgs, ... }:

{
  theming.palette = rec {
    normal = {
      black = "#282828";
      red = "#c5152f";
      green = "#9faa00";
      yellow = "#ffc24b";
      blue = "#73cef4";
      magenta = "#c5158f";
      cyan = "#335261";
      white = "#999999";
    };
    bright = {
      black = "#666666";
      red = "#f43753";
      green = "#c9d05c";
      yellow = "#ffdf5f";
      blue = "#b3deef";
      magenta = "#f437a3";
      cyan = "#44778d";
      white = "#eeeeee";
    };
    foreground = bright.white;
    background = normal.black;
  };
}

