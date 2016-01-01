# A profile for my personnal computers.
{ config, pkgs, ... }:

{
  imports = [
    # Software to install
    ./programs.nix
    # Fonts to install
    ./fonts.nix
    # User configuration
    ./gpyh.nix
    ];

  # Silent boot
  boot.kernelParams = [ "quiet loglevel=3 vga=current" ];

  # EFI boot
  boot.loader = {
    gummiboot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # I like to live dangerously
  security.sudo.wheelNeedsPassword = false;

  # Use Pulseaudio for sound
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  environment.variables.GTK_THEME = "Numix:dark";
  environment.variables.GTK2_RC_FILES =
    "/run/current-system/sw/share/themes/Numix/gtk-2.0/gtkrc";

  # Virtual console
  i18n = {
    consoleFont = "Lat2-Terminus16";
    defaultLocale = "en_US.UTF-8";
  };

  # Set time zone
  time.timeZone = "Europe/Paris";
  
  services.sway.enable = true;
  services.sway.terminal = "2";
  services.sway.user = "gpyh";

  # Keyboard layout
  i18n.consoleKeyMap = "fr";
  # services.xserver.layout = "fr";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

}
