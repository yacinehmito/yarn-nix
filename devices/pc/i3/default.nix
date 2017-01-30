{ config, pkgs, ... }:

with builtins;

let
  font = config.theming.font;
  i3status-config = pkgs.writeText "i3status-config"
    (readFile ./i3status.conf);
  i3config = replaceStrings
    [ "@typeface@" "@fontsize@"]
    [ font.typeface (toString font.size) ]
    (readFile ./config);
in
{
  environment.systemPackages = with pkgs; [
    # For i3
    i3status
    dmenu
    xclip

    # Theming
    gtk-engine-murrine
    numix-gtk-theme
  ];
  
  environment.variables = {
    GTK_THEME = "Numix:dark";
    GTK2_RC_FILES = "/run/current-system/sw/share/themes/Numix/gtk-2.0/gtkrc";
  };

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager.lightdm.enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = pkgs.writeText "i3-config" (i3config + ''
        bar {
           status_command ${pkgs.i3status}/bin/i3status -c ${i3status-config}
        }
      '');
    };
  };
}

