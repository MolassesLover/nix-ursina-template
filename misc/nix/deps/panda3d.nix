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

  src = callPackage (
    if stdenv.hostPlatform.system == "x86_64-linux" then ./panda3d/linux/x86_64.nix
    else if stdenv.hostPlatform.system == "aarch64-linux" then ./panda3d/linux/aarch64.nix
    else "") {};


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
