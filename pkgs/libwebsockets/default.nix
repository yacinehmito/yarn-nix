{ fetchgit, stdenv, cmake, openssl, zlib, libuv, sqlite }:

stdenv.mkDerivation rec {
  name = "libwebsockets-master";

  src = fetchgit {
    url = "https://github.com/warmcat/libwebsockets.git";
    rev = "55333db942d61da7296c28fff1999104020e0a40";
    sha256 = "1vjiqrrd5x2cfl6zvdh65h9fiz4062y5ghdjvj6p950hscqdyw6b";
  };

  preConfigure = ''
    export cmakeFlags="$cmakeFlags \
      -DLWS_WITHOUT_DAEMONIZE=OFF -DLWS_WITH_PLUGINS=ON -DLWS_WITH_LWSWS=1"
  '';

  buildInputs = [ openssl zlib libuv sqlite ];

  nativeBuildInputs = [ cmake ];

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
