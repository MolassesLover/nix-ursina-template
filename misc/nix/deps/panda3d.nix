{
  lib,
  python314Packages,
  autoPatchelfHook,
  atk,
  fontconfig,
  freetype,
  glib,
  gtk2,
  libGL,
  mpdecimal,
  openssl,
  pango,
  sqlite,
  zstd,
}:
with python314Packages;
buildPythonPackage rec {
  name = "panda3d";
  version = "1.10.16";
  format = "wheel";
  build-system = [
    setuptools
    wheel
  ];

  src = pkgs.fetchurl {
    url = "https://files.pythonhosted.org/packages/20/78/7b267a61ba97cd80acf52d16e67e6d1a1060775544404aec8d7939fd7d6c/panda3d-1.10.16-cp314-cp314-manylinux2014_x86_64.whl";
    hash = "sha256-FssP64tNl9Lhp2IGULjB+bHlYetzjLS2lkbnc+qUJpM=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];
  
  buildInputs = [
    atk
    fontconfig
    freetype
    glib
    gtk2
    libGL
    mpdecimal
    openssl
    pango
    sqlite
    zstd
  ];
}
