{ stdenv, lib, bundlerEnv, ruby_2_2, curl }:

bundlerEnv rec {
  name = "asciidoctor-${version}";
  version = "1.5.4";

  ruby = ruby_2_2;
  gemfile = ./Gemfile;
  lockfile = ./Gemfile.lock;
  gemset = ./gemset.nix;

  meta = with lib; {
    description = "Asciidoctor";
    homepage = http://asciidoctor.org/;
    license = licenses.mit;
    #maintainers = with maintainers; [ gpyh ];
    platforms = platforms.unix;
  };
}
