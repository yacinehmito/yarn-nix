lib: pkgs:

with pkgs;

# Lists the packages as attribute sets as if you were in
# `<nixpkgs/pkgs/top-level/all-packages.nix>`.
# They will be added to `pkgs` or override the existing ones.
# Of course, packages can depend on each other, as long as there is no cycle.
rec {
  # SirCmpwn's Wayland window manager and Cloudef's library wlc
  sway = callPackage ./sway { };
  wlc = callPackage ./wlc { };

  idea = lib.mapAttrs
    (name: value: value.override {
      oraclejdk8 = openjdk8;
    }) 
    (pkgs.idea);
}
