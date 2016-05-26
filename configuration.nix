# This is the configuration.nix file as I use it.
# It is located under /etc/nixos. Use it as an example.
{ config, pkgs, lib, ... }:

let 
  # The location of the yarn repo
  yarn = (import /home/gpyh/yarn) lib;
in

{
  imports = [
    # My device
    yarn.nicoletta
  ];
  
  nix.nixPath = [
    # Where to get the top-level nix file, i.e. this one
    "nixos-config=/etc/nixos/configuration.nix"
    # The channel to be subscribed on
    # "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixpkgs=/home/gpyh/nixpkgs"
  ];
  
  system.stateVersion = "15.09";
}
