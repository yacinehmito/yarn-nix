{ stdenv, lib, fetchFromGitHub, kernel }:

stdenv.mkDerivation rec {
  name = "cntouch-${version}";
  version = "2016-01-23";
  src = fetchFromGitHub {
    owner = "daedric";
    repo = "cntouch_driver";
    rev = "04cd57e096aa9574630d1c9528d7db8aa61a5c81";
    sha256 = "0bicwfvlrgsh70c8nwr7q1b3zpabym8n4k0lwvpph7fyw1m8jsrf";
  };

  buildInputs = [ kernel ];

  hardeningDisable = [ "pic" ];

  preBuild = ''
    export KERNELDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build
  '';

  installPhase = ''
    install -Dm755 cntouch.ko $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/cntouch.ko
  '';

  meta = with stdenv.lib; {
    description = "CNTouch driver for Linux";
    platforms = [ "x86_64-linux" ];
    license = licenses.gpl2;
    homepage = "http://www.github.com/daedric/cntouch_driver/";
  };
}
