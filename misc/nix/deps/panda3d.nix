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
  stdenv,
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

  src = callPackage ./panda3d/${stdenv.hostPlatform.system}.nix {};

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
