{
  boot = {
    kernelParams = [ "quit loglevel=3 vga=current"];

    loader = {
      gummiboot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
