{
  lib,
  python314Packages,
  callPackage,
  panda3d,
}:
with python314Packages;
let
  panda3d-gltf = (callPackage ./panda3d-gltf.nix { inherit panda3d; });
  sswg = (callPackage ./sswg.nix { });

  inputs = [
    pillow
    pyperclip
    screeninfo
    panda3d
    panda3d-gltf
    sswg
  ];
in
buildPythonPackage rec {
  name = "ursina";
  version = "8.2.0";
  pyproject = true;
  build-system = [ setuptools ];

  src = pkgs.fetchFromGitHub {
    owner = "pokepetter";
    repo = "ursina";
    tag = "v8.2.0";
    hash = "sha256-vyNf9iIHg8Itm0pjr2yHEdiiAm9m4JpRfjfzL7Xl9lA=";
  };

  propagatedBuildInputs = inputs;
}
