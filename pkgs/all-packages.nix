lib: pkgs:

with pkgs;

# Lists the packages as attribute sets as if you were in
# `<nixpkgs/pkgs/top-level/all-packages.nix>`.
# They will be added to `pkgs` or override the existing ones.
# Of course, packages can depend on each other, as long as there is no cycle.
let
  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // yarnpkgs);
  yarnpkgs = rec
{
  wlc = callPackage ./wlc { };
  sway = callPackage ./sway { };

  idea = lib.mapAttrs
    (name: value: value.override {
      oraclejdk8 = openjdk8;
    }) 
    (pkgs.idea);

  asciidoctor = callPackage ./asciidoctor { };
};

in yarnpkgs
