{ stdenv, buildFHSUserEnv, writeTextFile, fetchurl, writeScript }:

let 
  version = "1104891";
  evelauncher = stdenv.mkDerivation rec {
    name = "eve-online-launcher-${version}";
    inherit version;
    src = fetchurl {
      url = "https://binaries.eveonline.com/evelauncher-${version}.tar.gz";
      sha256 = "0rn1jh3lk8pcb95sg8ah2d3zh2n624zhpm915fdgzx44zd0k3789";
    };
  
    installPhase = ''
      cp -r . $out
      echo '8500' > $out/steam_appid.txt
    '';
  
  };
in

buildFHSUserEnv {
  name = "eve-online";
  targetPkgs = pkgs:(with pkgs; [
    xorg.libX11
    xorg.libXrandr
    xorg.libXext
    xorg.libXdamage
    xorg.libXfixes
    xorg.libXcursor
    xorg.libXrender
    xorg.libXcomposite
    xorg.libXtst
    xorg.libXi
    xorg.libxcb
    xorg.libSM
    xorg.libICE
    xorg.xkeyboardconfig
    openssl
    libxkbcommon
    udev
    glib
    libxml2
    nss
    nspr
    fontconfig
    freetype
    libxslt
    dbus
    alsaLib
    evelauncher
  ]);

  multiPkgs = pkgs: (with pkgs; [
    xorg.libX11
    xorg.libXrandr
    xorg.libXext
    xorg.libXdamage
    xorg.libXfixes
    xorg.libXcursor
    xorg.libXrender
    xorg.libXcomposite
    xorg.libXtst
    xorg.libXi
    xorg.libxcb
    xorg.libSM
    xorg.libICE
    xorg.xkeyboardconfig
    openssl
    libxkbcommon
    udev
    glib
    libxml2
    nss
    nspr
    fontconfig
    freetype
    libxslt
    dbus
    alsaLib
    freetype
    libpulseaudio
    openldap
    zlib
    libpng
    libjpeg
    # cups
    lcms2
    gettext
    dbus
    mpg123
    openal
    cairo
    libtiff
    unixODBC
    # samba3_light
    # ncurses
    libva
    libpcap
    libv4l
    saneBackends
    gsm
    libgphoto2
    openldap
    fontconfig
    alsaLib
    libpulseaudio
    xorg.libXinerama
    libxml2 
    libxslt
    openssl 
    gnutls
    mesa 
    mesa_noglu.osmesa
    libdrm
  ]);

  runScript = writeScript "eve-online" ''
    #!/bin/sh
    export LD_LIBRARY_PATH="${evelauncher}:$LD_LIBRARY_PATH"
    export QTDIR="${evelauncher}"
    export QT_PLUGIN_PATH=${evelauncher}/plugins
    exec "${evelauncher}/evelauncher" "$@"
  '';
}

