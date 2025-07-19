{ nixpkgs }:
let
  supportedSystems = [ "aarch64-darwin" "x86_64-darwin" "x86_64-linux" ];
  forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
in
forAllSystems (system:
  let
    pkgs = import nixpkgs { inherit system; };
  in {
    default = pkgs.mkShell {
      packages = [ pkgs.git ];
    };
  }
)