{ stdenv, fetchFromGitHub, rustPlatform,
  pkgconfig, cmake, freetype, fontconfig, xclip,
  mesa, libX11, libXcursor, libXxf86vm, libXi }:

with  rustPlatform;

buildRustPackage rec {
  name = "alacritty-${version}";
  version = "prealpha";
  src = fetchFromGitHub {
    owner = "jwilm";
    repo = "alacritty";
    rev = "3c8514ba103d5d987d2269c421a3cc09e6784904";
    sha256 = "0sxpxk0lmd97fpjkmq4arnl3zca9s82irpl8wx0frkg21fca9avr";
  };
  depsSha256 = "11c1n4rd82pr409iznhh19764lx33lryz5xaw7vdp40fwp42303d";
  buildInputs = [
    pkgconfig cmake freetype fontconfig xclip
    mesa libX11 libXcursor libXxf86vm libXi
  ];
}
