{ config, lib, pkgs, ... }:

with lib;

let 

  cfg = config.theming;

  stdPalette = mode: {
    black = mkOption {
      type = types.str;
      default = "#000000";
      description = "Black color (${mode})";
    };
    red = mkOption {
      type = types.str;
      default = "#ff0000";
      description = "Black color (${mode})";
    };
    green = mkOption {
      type = types.str;
      default = "#00ff00";
      description = "Green color (${mode})";
    };
    yellow = mkOption {
      type = types.str;
      default = "#ffff00";
      description = "Yellow color (${mode})";
    };
    blue = mkOption {
      type = types.str;
      default = "#0000ff";
      description = "Blue color (${mode})";
    };
    magenta = mkOption {
      type = types.str;
      default = "#ff00ff";
      description = "Magenta color (${mode})";
    };
    cyan = mkOption {
      type = types.str;
      default = "#00ffff";
      description = "Cyan color (${mode})";
    };
    white = mkOption {
      type = types.str;
      default = "#ffffff";
      description = "White color (${mode})";
    };
  };
in

{
  options = {
    theming = {
      palette = {
        normal = stdPalette "normal";
        bright = stdPalette "bright";
        foreground = mkOption {
          type = types.str;
          default = cfg.palette.normal.white;
          defaultText = "palette.normal.white";
          description = ''
            Foreground color
          '';
        };
        background = mkOption {
          type = types.str;
          default = cfg.palette.normal.black;
          defaultText = "palette.normal.black";
          description = ''
            Background color
          '';
        };
      };
      font = {
        typeface = mkOption {
          type = types.str;
          default = "monospace";
          description = ''
            Default typeface
          '';
        };
        size = mkOption {
          type = types.int;
          default = 10;
          description = ''
            Default font size
          '';
        };
      };
    };
  };
}
