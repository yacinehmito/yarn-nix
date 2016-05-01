{ stdenv, fetchgit , wayland, xwayland, pixman, libxkbcommon, libinput , libX11, libxcb
, udev, mesa, libdrm, xcbutilimage, xcbutilwm, cmake, pkgconfig
, systemd, dbus_libs
}:
# TODO: Handle optional dependencies
# TODO: Debug build & tests
stdenv.mkDerivation rec {
  version = "2016-05-01";
  name = "wlc-${version}";
  
  src = fetchgit {
    # TODO: patch upstream to remove weak linking (use fork in the meantime)
    url = "https://github.com/gpyh/wlc.git";
    rev = "bc05294aa970fa23fe9ef4c281b4b12a83613d39";
    sha256 = "15njy42j0c6aqmy5ldzikdr9xkcg3q0w8wir41z5wp3jrkyr736m";
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
