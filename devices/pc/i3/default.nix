{ config, pkgs, ... }:

let
  i3status-config = pkgs.writeText "i3status-config"
    (builtins.readFile ./i3status.conf);
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
      configFile = pkgs.writeText "i3-config" (
        (builtins.readFile ./config) +
        "bar {
           status_command ${pkgs.i3status}/bin/i3status -c ${i3status-config}
         }
        "
      );
    };
  };
}

