with (import <nixpkgs> {});
(import ./default.nix) { inherit stdenv; }

