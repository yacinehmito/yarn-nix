{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ 
    (steam.override {
      newStdcpp = true;
      withJava = true;
    })
    eve-online
    discord
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
