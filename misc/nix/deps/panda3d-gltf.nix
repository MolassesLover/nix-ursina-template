{
  lib,
  python314Packages,
  callPackage,
  panda3d,
}:
let
  panda3d-simplepbr = callPackage ./panda3d-simplepbr.nix { inherit panda3d; };
in
with python314Packages;
buildPythonPackage rec {
  name = "panda3d-gltf";
  version = "1.3.0";
  pyproject = true;
  build-system = [
    setuptools
    wheel
  ];

  src = pkgs.fetchFromGitHub {
    owner = "Moguri";
    repo = "panda3d-gltf";
    tag = "v1.3.0";
    hash = "sha256-ivgQtSm0CqUoSBbm2BKtqYmDu5SRQldBb+lHk4jE7/k=";
  };

  propagatedBuildInputs = [
    panda3d
    panda3d-simplepbr
  ];
}
