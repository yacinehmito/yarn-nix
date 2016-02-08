{ stdenv, lib, bundlerEnv, ruby_2_2, curl }:

bundlerEnv rec {
  name = "asciidoctor-${version}";
  version = "0.1";

  ruby = ruby_2_2;
  gemfile = ./Gemfile;
  lockfile = ./Gemfile.lock;
  gemset = ./gemset.nix;

  meta = with lib; {
    description = "Asciidoctor";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
