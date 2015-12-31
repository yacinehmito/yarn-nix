{ stdenv, fetchgit , wayland, xwayland, pixman, libxkbcommon, libinput , libX11, libxcb
, udev, mesa, libdrm, xcbutilimage, xcbutilwm, cmake, pkgconfig
, systemd, dbus_libs
}:
# TODO: Handle optional dependencies
# TODO: Debug build & tests
stdenv.mkDerivation rec {
  version = "2016-02-25";
  name = "wlc-${version}";
  
  src = fetchgit {
    # TODO: patch upstream to remove weak linking (use fork in the meantime)
    url = "https://github.com/gpyh/wlc.git";
    rev = "1e0e208c82f9b381ca0305f6bad8d024e2601d4d";
    sha256 = "066q9cahl13l5qkqkg9vy1zqxrh2kcx1ilkxm5rcwfi6m9ash1q2";
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
