{
  description =
    "An Ursina project.";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in {
      packages = forAllSystems (system:
        let
          pkgs = (import nixpkgs { inherit system; });
          panda3d = pkgs.callPackage misc/nix/deps/panda3d.nix { };
          # panda3d = pkgs.callPackage (if system == "x86_64" then ./misc/nix/deps/panda3d.nix else null) {};
          ursinaproject = pkgs.callPackage misc/nix/package.nix { inherit panda3d; };
        in {
          inherit ursinaproject;
          default = ursinaproject;
          devShell = pkgs.mkShell { inputsFrom = [ ursinaproject ]; };
        });
    };
}
