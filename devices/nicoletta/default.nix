{ config, lib, pkgs, ... }:

{
  require = [ 
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ../pc
  ];

  networking.hostName = "nicoletta";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" ];
  boot.kernelModules = [ "kvm-intel radeon" ];
  boot.extraModulePackages = [ ];

  environment.systemPackages = [ pkgs.xorg.xf86videoati ];

  swapDevices = [ ];

  nix.maxJobs = 4;

  fileSystems =  {
    "/boot" = {
      device = "/dev/disk/by-uuid/D8D8-4E87";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "ext4";
      options = [ "relatime" ];
    };
    "/mnt/arch" = {
      device = "/dev/disk/by-label/arch";
      fsType = "ext4";
      options = [ "relatime" ];
    };
    "/home" = {
      device = "/dev/disk/by-label/home";
      fsType = "ext4";
      options = [ "relatime" ];
    };
    "/mnt/storage" = {
      device = "/dev/disk/by-label/storage";
      fsType = "ext4";
    };
  };

}
