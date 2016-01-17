{ config, lib, pkgs, ... }:

{

  environment.systemPackages = [ 
    (pkgs.steam.override { newStdcpp = true; })
  ];
  nixpkgs.config.allowUnfree = true;

  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
  };

}
