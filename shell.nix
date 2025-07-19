{
  # run this with `nix develop` to get fundamental tooling to initialize a system
  description = "Dev shell with git";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: {
    devShells.default = nixpkgs.legacyPackages.aarch64-darwin.mkShell {
      packages = [ nixpkgs.legacyPackages.aarch64-darwin.git ];
    };
  };
}