# # !!! This file belongs to the yarn framework. !!!
# # !!! Do not change unless you know what you're doing. !!!

lib:

let
  # This function takes the path of a device module as an argument
  # and returns a complete module to be imported in configuration.nix
  makeDevice = 
    devicePath:
    { config, pkgs, lib, ... }:

    {
      imports = [
        # ...the device module holding the system configuration...
        devicePath
      ] ++ (import ./modules/module-list.nix) lib; # ...and all the extra modules.
      nixpkgs.config = {
        packageOverrides = (import ./pkgs/all-packages.nix) lib;
      };

      nix.nixPath = [
        (lib.concatStrings [ "yarnpkgs=" (./.) "/pkgs/yarnpkgs.nix" ])
      ];
    };
  deviceModules = lib.mapAttrs
    (name: value: makeDevice value)
    ((import ./devices/all-devices.nix) lib);
in

deviceModules
