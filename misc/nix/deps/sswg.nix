{
  lib,
  python314Packages,
}:
with python314Packages;
buildPythonPackage rec {
  name = "sswg";
  version = "4.3.0";
  pyproject = true;
  build-system = [
    setuptools
    wheel
  ];

  src = pkgs.fetchPypi {
    pname = "sswg";
    version = "4.3.0";
    hash = "sha256-28K2KC/RkHDusrMCA5xO7fevtPv1oKIEkOFrt/1Rb4o=";
  };
}
