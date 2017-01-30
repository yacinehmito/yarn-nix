{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.st;

  palette = config.theming.palette;
  font = config.theming.font;

  macros = ''
    #define COLOR_NORMAL_BLACK "${palette.normal.black}"
    #define COLOR_NORMAL_RED "${palette.normal.red}"
    #define COLOR_NORMAL_GREEN "${palette.normal.green}"
    #define COLOR_NORMAL_YELLOW "${palette.normal.yellow}"
    #define COLOR_NORMAL_BLUE "${palette.normal.blue}"
    #define COLOR_NORMAL_MAGENTA "${palette.normal.magenta}"
    #define COLOR_NORMAL_CYAN "${palette.normal.cyan}"
    #define COLOR_NORMAL_WHITE "${palette.normal.white}"
    #define COLOR_BRIGHT_BLACK "${palette.bright.black}"
    #define COLOR_BRIGHT_RED "${palette.bright.red}"
    #define COLOR_BRIGHT_GREEN "${palette.bright.green}"
    #define COLOR_BRIGHT_YELLOW "${palette.bright.yellow}"
    #define COLOR_BRIGHT_BLUE "${palette.bright.blue}"
    #define COLOR_BRIGHT_MAGENTA "${palette.bright.magenta}"
    #define COLOR_BRIGHT_CYAN "${palette.bright.cyan}"
    #define COLOR_BRIGHT_WHITE "${palette.bright.white}"
    #define COLOR_FOREGROUND "${palette.foreground}"
    #define COLOR_BACKGROUND "${palette.background}"
    #define FONT_TYPEFACE "${font.typeface}"
    #define FONT_SIZE "${toString cfg.fontSize}"
  '';


  stPackage = pkgs.st.override {
    conf = macros + (builtins.readFile ./config.def.h);
    patches = [ ./st-scrollback.patch ];
  };

in

{
  options = {
    
    programs.st = {
      enable = mkOption {
        default = false;
        type = types.bool;
      };
      fontSize = mkOption {
        default = font.size;
        type = types.int;
      };
    };

  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ stPackage ];
  };
}

