let
  fusion = pkgs: pkgs //
    import ./all-packages.nix (import <nixpkgs/lib>) pkgs;
  yarnpkgs = args: fusion (import <nixpkgs> args);
in
  
yarnpkgs { }
