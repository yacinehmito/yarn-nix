{ config, lib, pkgs, ... }:

{

  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ahci" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/661898e9-20b9-4a98-8e55-cdfb906379e0";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/6e94f1d5-2bd9-464d-8a33-5b599c61f227";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/c75ac1e5-ba18-4798-99ac-b267be7365c6"; }
    ];

  nix.maxJobs = lib.mkDefault 4;

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking = {
    hostName = "ns359913";
    interfaces.enp1s0 = {
      ip4 = [{
        address = "91.121.160.63";
        prefixLength = 24;
      }];
      ip6 = [{
        address = "2001:41d0:0001:e13f::1";
        prefixLength = 128;
      }];
    };

    defaultGateway = "91.121.160.254";
    defaultGateway6 = "2001:41d0:0001:e1ff:ff:ff:ff:ff";

    nameservers = [
      "213.186.33.99"
      "2001:41d0:3:1c7::1"
    ];
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "fr";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Paris";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  users.extraUsers.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCXKi840s2JzU+yy4V5UzD0HcEv6BA5eJf/M2CoAwqdEerNSUgegjhuMXOY5NtY+gqLSX7Y8jQlnPXwYaOtH+CznrX5HHLwTslAzTCNVYFzsOC/ZXEWZkBHK4jtJ/pXU5/XMAraKIFLyCUoUhojWgCa9aiUlpwLWAUod7WeMWgYGFCn6M2Ix/4//zXSmd4qdA/B+xei2giEW/eGX4w5nbkUgigNWXTQ5MQEMfAMHcIuNFmBM/Xmuftg6RRf75qbo6UeFo+msqwWpnldom2wC8Hto2jEdTPWfcpvjGJ/TeTFzjCQF84I5T9STqRaszsEE5kNhuItMSl10h3FNDjNIvtLAD8rAmE6at2S7WlD77RpoasObvHIPrDC0ffPVmF6YMfqJnyFFw/mUn+GGxMSrFr+Hzh2VOXk+DveJH1psZTZVwye8cgzPXC+RoV92A1vQxJaEQoR2ifF/ddzyi1dTRxoseE9eBcalQvcQDpbqry4qwfI0tYDiiIqPCDBEiQUdNTtWyf0cCaxxiSfMlzjdZi7bv3x/ZgXbcS/v10NrAn35XEhbeB4TJlgDPhRaeAGweLqIbQ0BdOJ8iMiDsobOLL61E/PARh/zgHnXlBqRO87h0mWQfMUzHaQ33A/tQ14HImmbQUY3CUIi7uSkkX6TjlCSvyrmCxKE+sDrpYHyMHnyw== yacine.hmito@gmail.com"
  ];

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}

