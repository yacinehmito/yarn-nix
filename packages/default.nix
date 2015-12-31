# !!! This file belongs to the yarn framework. !!!
# !!! Do not change unless you know what you're doing. !!!

# This set is imported by yarn as a module so it overrides `pkgs`
# with the content of `all-packages.nix`.
{
  nixpkgs.config.packageOverrides = (import ./all-packages.nix);
}
