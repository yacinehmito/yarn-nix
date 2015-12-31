{ stdenv, fetchgit , wayland, xwayland, pixman, libxkbcommon, libinput , libX11, libxcb
, udev, mesa, libdrm, xcbutilimage, xcbutilwm, cmake, pkgconfig
, systemd, dbus_libs
}:
# TODO: Handle optional dependencies
# TODO: Debug build & tests
stdenv.mkDerivation rec {
  version = "2015-12-22";
  name = "wlc-${version}";
  
  src = fetchgit {
    # TODO: patch upstream to remove weak linking (use fork in the meantime)
    url = "https://github.com/gpyh/wlc.git";
    rev = "73f0d7bca107ac83fb29617eb2a03300d0666b12";
    sha256 = "e84c8d946d15dc37f767e9a82c704d97284289460e27a408c7ab183710969859";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake pkgconfig
  ];
  
  # TODO: Properly check dependencies
  buildInputs = [
    wayland xwayland libinput libdrm mesa libX11 libxcb xcbutilimage xcbutilwm udev
    libxkbcommon pixman
    systemd dbus_libs 
  ];

  meta = with stdenv.lib; {
    description = "Library for a tiling Wayland compositor";
    homepage = https://github.com/Cloudef/wlc;
    # TODO: maintainers
    platforms = stdenv.lib.platforms.linux;
    license = stdenv.lib.licenses.mit;

  };
}
