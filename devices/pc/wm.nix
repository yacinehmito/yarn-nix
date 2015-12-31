{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # For i3
    i3status
    dmenu

    # Wayland
    sway
    
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
    windowManager.i3.enable = true;
  };
}

