{ config, lib, pkgs, ... }:

{
  require = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix> 
    ../pc
  ];

  networking.hostName = "bobdoge";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1a064801-57a8-4291-b598-a0d0b120562f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/BAED-B97B";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/7cadd929-11c9-41f1-842f-348e90712b46";
      fsType = "ext4";
    };

  swapDevices = [ ];

  networking.wireless.enable = true;

  services.acpid.enable = true;
  powerManagement.enable = true;

  nix.maxJobs = 4;
}
