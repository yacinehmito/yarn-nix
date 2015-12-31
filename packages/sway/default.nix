{ stdenv, fetchFromGitHub
, cmake, pkgconfig, asciidoc
, wlc, wayland, xwayland, pcre, json_c, libxkbcommon, libinput
# sway utils enables swaybar, swaybg and swaylock
, swayutils ? true
, pango, cairo, gdk_pixbuf, pam, imagemagick, ffmpeg
}:

#TODO: Debug build
stdenv.mkDerivation rec {
  version = "2016-02-25";
  name = "sway-${version}";
  
  src = fetchFromGitHub {
    owner = "SirCmpwn";
    repo = "sway";
    rev = "28c8e4fb9e6da839d353be723be60bb7bf2ebcdb";
    sha256 = "1170p6jx5r98ckiv98iqngia7w3wwivxkpd5b9j6xx6v47gm67qh";
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
