{ lib, termite, writeText }:

termite.override {
  configFile = writeText "termite-config" (builtins.readFile ./config );
}
