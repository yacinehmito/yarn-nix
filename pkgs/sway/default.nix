{ stdenv, fetchFromGitHub
, cmake, pkgconfig, asciidoc
, wlc, wayland, xwayland, pcre, json_c, libxkbcommon, libinput
# swayutils enables swaybar, swaybg and swaylock
, swayutils ? true
, pango, cairo, gdk_pixbuf, pam, imagemagick, ffmpeg
}:

stdenv.mkDerivation rec {
  name = "sway-${version}";
  version = "0.6";
  
  src = fetchFromGitHub {
    owner = "SirCmpwn";
    repo = "sway";
    rev = version;
    sha256 = "0545jkf191ks9ppb4hxib6vw9i62x9xvx18jd241k1spnixmscsw";
  };

  preConfigure = ''
    export cmakeFlags="$cmakeFlags -DCMAKE_INSTALL_PREFIX:PATH=$out/"
  '';
  
  # TODO: Investigate why a2x takes so much time on NixOS
  nativeBuildInputs = [
    cmake pkgconfig asciidoc
  ];
  
  buildInputs = [
    wlc
    wayland xwayland
    pcre json_c libxkbcommon libinput ] ++
    (if swayutils then [
      pango cairo gdk_pixbuf pam imagemagick ffmpeg
    ] else [ ]);

  meta = with stdenv.lib; {
    description = "i3-compatible Wayland compositor";
    homepage = https://github.com/SirCmpwn/sway;
    # TODO: maintainers
    platforms = stdenv.lib.platforms.linux;
    license = stdenv.lib.licenses.mit;
  };
}
