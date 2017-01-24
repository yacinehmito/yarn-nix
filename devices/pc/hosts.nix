# My user configuration.
{ config, pkgs, ... }:

{
  networking.extraHosts = ''
    137.74.195.122 thibvps
    192.168.0.15 bobdoge
    192.168.0.34 nicoletta
  '';
}

