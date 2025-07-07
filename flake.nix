{
  description = "Nix-Darwin Flake for Personal MacBook Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    mac-app-util.url = "github:hraban/mac-app-util";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ 
      self, 
      nix-darwin, 
      nixpkgs, 
      mac-app-util,
      home-manager,
    }:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = import ./packages/system-packages.nix { inherit pkgs; };

      # # Homebrew casks
      homebrew = {
        enable = true;
        casks = import ./packages/homebrew-casks.nix;
        masApps = import ./packages/mas-apps.nix;
        onActivation.cleanup = "uninstall";
        onActivation.upgrade = false;
        onActivation.autoUpdate = true;
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Security
      security.pam.services.sudo_local.touchIdAuth = true;

      system.primaryUser = "matt";

      system.defaults = {
        dock.autohide = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv"; # default Finder to column view
        # screencapture.location = "~/Desktop/screenshots";
        # screensaver.askForPasswordDelay = 10;
      };

      users.users.matt = {
        name = "matt";
        home = "/Users/matt";
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MattsM3
    darwinConfigurations.MattsM3 = nix-darwin.lib.darwinSystem {
      modules = [
        mac-app-util.darwinModules.default
        configuration
        home-manager.darwinModules.home-manager {
          home-manager.backupFileExtension = ".bak";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.matt = import ./home-manager/home.nix;
        }
      ];
    };

    # Expose package set, including overlays, for convinience.
    darwinPackages = self.darwinConfigurations.MattsM3.packages;
  };
}
