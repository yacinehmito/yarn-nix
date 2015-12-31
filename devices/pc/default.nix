# A profile for my personnal computers.
{ config, pkgs, ... }:

{
  imports = [
    ./programs.nix
    ./fonts.nix
    ./gpyh.nix
    ./steam.nix
    ./keyboard.nix
    ./wm.nix
    ./boot.nix
    ];

  # I like to live dangerously
  security.sudo.wheelNeedsPassword = false;

  # Use Pulseaudio for sound
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  # Virtual console
  i18n = {
    consoleFont = "Lat2-Terminus16";
    defaultLocale = "en_US.UTF-8";
  };

  # Set time zone
  time.timeZone = "Europe/Paris";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

}
