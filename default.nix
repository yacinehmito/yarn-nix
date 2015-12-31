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
        # Importing the packages module that will override pkgs...
        ({
          nixpkgs.config = {
            packageOverrides = (import ./packages/all-packages.nix) lib;
          };
        })
        # ...the device module holding the system configuration...
        devicePath
      ] ++ (import ./modules/module-list.nix) lib; # ...and all the extra modules.
    };
in

{
  devices = lib.mapAttrs 
    (name: value: makeDevice value)
    ((import ./devices/all-devices.nix) lib);
}

