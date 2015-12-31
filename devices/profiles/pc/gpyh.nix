# My user configuration.
{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  users.extraUsers.gpyh = {
      isNormalUser = true;
      shell = "/run/current-system/sw/bin/zsh";
      home = "/home/gpyh";
      extraGroups = [ "wheel" ];
      uid = 1000;
    };
}

