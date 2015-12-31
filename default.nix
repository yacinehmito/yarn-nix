# !!! This file belongs to the yarn framework. !!!
# !!! Do not change unless you know what you're doing. !!!

# This is a closure that takes the name of the device and returns a module.
deviceName:

{ config, pkgs, lib, ... }:

{
  imports = [
    # Importing the packages module that will override pkgs.
    ./packages
    # Importing the current device's module holding the system configuration.
    (import ./devices/all-devices.nix)."${deviceName}"
  ] ++ (import ./modules/module-list.nix); # Importing all the custom modules.
}
