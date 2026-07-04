{
  lib,
  python314Packages,
  callPackage,
  panda3d,
}:
with python314Packages;
buildPythonPackage rec {
  name = "panda3d-simplepbr";
  version = "0.13.1";
  pyproject = true;
  build-system = [
    setuptools
    wheel
  ];

  nativeBuildInputs = [
    setuptools-scm
  ];

  src = pkgs.fetchFromGitHub {
    owner = "Moguri";
    repo = "panda3d-simplepbr";
    tag = "v0.13.1";
    hash = "sha256-eHkW1+Xr/gcVcnbVRrt/LIi/uGoH5REpgo5jLVjF0lY=";
  };

  propagatedBuildInputs = [
    panda3d
  ];
}
