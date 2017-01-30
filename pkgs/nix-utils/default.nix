{ stdenv }:

stdenv.mkDerivation rec {
  name = "nix-utils";
  src = ./.;

  buildPhases = [ "unpackPhase" "installPhase" ];
  
  installPhase = ''
    install -D -t $out/bin nsh
  '';

  meta = with stdenv.lib; {
    description = "Some utility functions to make Nix more agreable";
    homepage = https://github.com/gpyh/yarn;
    maintainers = with maintainers; [ gpyh ];
    platforms = stdenv.lib.platforms.linux;
    license = stdenv.lib.licenses.mit;
  };
}
