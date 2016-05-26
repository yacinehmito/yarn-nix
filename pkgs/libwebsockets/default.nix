{ fetchgit, stdenv, cmake, openssl, zlib }:

stdenv.mkDerivation rec {
  name = "libwebsockets-master";

  src = fetchgit {
    url = "https://github.com/warmcat/libwebsockets.git";
    rev = "822b3f6b2d762abe07ae6d058dd5ccd98155d273";
    sha256 = "12ify3wcssmlkcv59h1is39sqysdvsdx33w3xbbnf3db2dy4drq4";
  };

  buildInputs = [ cmake openssl zlib ];

  meta = {
    description = "Light, portable C library for websockets";
    longDescription = ''
      Libwebsockets is a lightweight pure C library built to
      use minimal CPU and memory resources, and provide fast
      throughput in both directions.
    '';
    homepage = https://libwebsockets.org/trac/libwebsockets;
    # See http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/tree/LICENSE
    license = stdenv.lib.licenses.gpl2Plus;
    maintainers = [ ];
    platforms = stdenv.lib.platforms.all;
  };
}
