{
  description = "Nix-Darwin Flake for Personal MacBook Pro";

  inputs = {
    # Library of all Nix packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Nix-Darwin - tools for managing macOS at the systems level
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Mac-App Util - utilities for managing macOS applications better when installe via Nix
    mac-app-util.url = "github:hraban/mac-app-util";

    # Home Manager - Nix-based user-level configuration management
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    # Nix Homebrew - Nix-based Homebrew integration
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    # Homebrew input, used by Nix Homebrew 
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    # Homebrew Cask input, used by Nix Homebrew 
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ 
      self, 
      nix-darwin, 
      nixpkgs, 
      mac-app-util,
      home-manager,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
    }:
  {
    # Use this for 'nix develop' to get started with basic tooling
    devShells.aarch64-darwin.default = nixpkgs.legacyPackages.aarch64-darwin.mkShell {
      packages = [ nixpkgs.legacyPackages.aarch64-darwin.git ];
    };

    darwinConfigurations.MattsM3 = import ./nix/hosts/MattsM3/darwin.nix {
      inherit self nix-darwin mac-app-util home-manager nixpkgs;
    };
    darwinConfigurations.eros = import ./nix/hosts/eros/darwin.nix {
      inherit self nix-darwin mac-app-util home-manager nixpkgs nix-homebrew homebrew-core homebrew-cask;
    };

    # Expose package set, including overlays, for convinience.
    # darwinPackages = self.darwinConfigurations.MattsM3.packages;
  };
}
