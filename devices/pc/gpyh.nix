# My user configuration.
{ config, pkgs, ... }:

{
  users.extraUsers.gpyh = {
      isNormalUser = true;
      home = "/home/gpyh";
      extraGroups = [ "wheel" ];
      uid = 1000;
    };
}

