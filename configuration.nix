# This is the configuration.nix file as I use it.
# It located under /etc/nixos. Use it as an example.
{ config, pkgs, ... }:

{
  imports = [
    (import /home/gpyh/yarn "nicoletta")
  ];

  nix.nixPath = [
    "nixos-config=/etc/nixos/configuration.nix"
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
  ];

  system.stateVersion = "15.09";
}
