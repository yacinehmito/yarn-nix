{ config, lib, pkgs, ... }:

{
  require = [ 
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ../pc
  ];

  networking.hostName = "nicoletta";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  environment.systemPackages = [ pkgs.ntfs3g ];

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

  # Nvidia drivers
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true; 
}
