{
  description = "Nix-Darwin Flake for Personal MacBook Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    mac-app-util.url = "github:hraban/mac-app-util";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
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
