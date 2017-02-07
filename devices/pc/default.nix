# A profile for my personnal computers.
{ config, pkgs, ... }:

{
  imports = [
    ./misc.nix
    ./zsh
    ./i3
    ./gaming.nix
    ./palette.nix
    ./hosts.nix
    ./programs.nix
    ./fonts.nix
    ./gpyh.nix
    ./keyboard.nix
    ./boot.nix
    ];

  services.ncd = {
    enable = true;
    domain = "ncd";
    address = "127.0.0.1";
  };

  # networking.interfaces = {
  #   "lo:1" = {
  #     ip4 = [ { address = "127.0.02"; prefixLength = 32; } ];
  #   };
  # };

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

  # # Enable docker
  # virtualisation.docker = {
  #   enable = true;
  # };

}
