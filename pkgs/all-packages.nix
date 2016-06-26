lib: pkgs:

with pkgs;

# Lists the packages as attribute sets as if you were in
# `<nixpkgs/pkgs/top-level/all-packages.nix>`.
# They will be added to `pkgs` or override the existing ones.
# Of course, packages can depend on each other, as long as there is no cycle.
let
  yarnpkgs = rec
{
  callPackage = newScope yarnpkgs;
  # Custom xelatex collection
  xelatex = texlive.combine {
    # FIXME: No xelatex for now because Nix derivations seem out of date
    inherit (texlive) scheme-medium;
  };
  
  # Use openjdk with JetBrains IDEs
  idea = lib.mapAttrs
    (name: value: value.override {
      oraclejdk8 = openjdk8;
    }) 
    (pkgs.idea);

  # Wayland stuff
  wlc = callPackage ./wlc { };
  sway = callPackage ./sway { };
  mpv-wayland = pkgs.mpv.override {
    vaapiSupport = true;
    waylandSupport = true;
  };

  
  # Custom idris packages collection
  idris = pkgs.haskell.packages.ghc7103.idris;
  idrisPackages = import ./idris-packages (pkgs.idrisPackages.override {
    inherit idris;
  });
  
  # Dev stuff
  dev = {
    # Enables the use of last OpenGL versions
    mesa_drivers = mesaDarwinOr (
      let mo = mesa_noglu.override {
        enableTextureFloats = true;
        llvmPackages = llvmPackages_36; # various problems with 3.7; see #11367, #11467
      };
      in mo.drivers
    );
    
    # Git snapshot of libwebsockets
    libwebsockets = callPackage ./libwebsocket { };
  };
  
  # Stuff that I maintain
  maintenance = {
    asciidoctor = callPackage ./asciidoctor { };
  };
  
};

in yarnpkgs
