{
  lib,
  python314Packages,
  callPackage,
  panda3d,
}:
let
  ursina = (callPackage ./deps/ursina.nix { inherit panda3d; });
in
with python314Packages;
buildPythonApplication {
  pname = "ursinaproject";
  version = "0.1.0";

  propagatedBuildInputs = [
    ursina
  ];

  pyproject = true;
  build-system = [ setuptools ];

  src = ../../.;
}
