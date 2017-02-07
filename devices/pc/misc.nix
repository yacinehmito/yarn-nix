# My user configuration.
{ config, lib, pkgs, ... }:

{
  services.mongodb = {
    enable = true;
  };
}

