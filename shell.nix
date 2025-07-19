{
  # run this with `nix develop` to get fundamental tooling to intialize a system
  description = "Dev shell with git";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: {
    devShells.default = nixpkgs.lib.mkShell {
      packages = [ nixpkgs.legacyPackages.x86_64-darwin.git ];
    };
  };
}