{ stdenv, fetchFromGitHub
, cmake, pkgconfig, asciidoc
, wlc, wayland, xwayland, pcre, json_c, libxkbcommon
# sway utils enables swaybar, swaybg and swaylock
, swayutils ? true
, pango, cairo, gdk_pixbuf, pam
}:

#TODO: Debug build
stdenv.mkDerivation rec {
  version = "2015-12-23";
  name = "sway-${version}";
  
  src = fetchFromGitHub {
    owner = "SirCmpwn";
    repo = "sway";
    rev = "f69d765bbef53b971c6009c06766ef54279518f9";
    sha256 = "1xip6xpz1jl7vk401jgrvc8hfp8lahsvrsbkyd834qwnwsjfa56z";
  };

  preConfigure = ''
    export cmakeFlags="$cmakeFlags -DCMAKE_INSTALL_PREFIX:PATH=$out/"
  '';
  
  # TODO: Investigate why a2x takes so much time on NixOS
  nativeBuildInputs = [
    cmake pkgconfig asciidoc
  ];
  
  buildInputs = [ wlc wayland xwayland pcre json_c libxkbcommon ] ++
    (if swayutils then [
      pango cairo gdk_pixbuf pam
    ] else [ ]);

  meta = with stdenv.lib; {
    description = "i3-compatible Wayland compositor";
    homepage = https://github.com/SirCmpwn/sway;
    # TODO: maintainers
    platforms = stdenv.lib.platforms.linux;
    license = stdenv.lib.licenses.mit;
  };
}
