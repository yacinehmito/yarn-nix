{
  boot = {
    kernelParams = [ "quit loglevel=3 vga=current"];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
