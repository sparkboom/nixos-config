{ 
  self, 
  nix-darwin, 
  mac-app-util,
  home-manager,
  nixpkgs,
  nix-homebrew,
  homebrew-core,
  homebrew-cask
}:
let
  configuration = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = import ./packages/system-pkgs.nix { inherit pkgs; };

    environment.variables = {
      # Temporarily exclude brew casks from being installed - esp if they're troublesome
      HOMEBREW_BUNDLE_CASK_SKIP = "visual-studio-code@insiders";
    };

    environment.shells = with pkgs; [ zsh ];

    # Homebrew packages
    homebrew = {
      enable = true;
      casks = import ./packages/homebrew-casks.nix;
      # masApps = import ./packages/mas-apps.nix;
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

    # System configuration
    system.defaults = {
      dock = import ./dock.nix;
      # default Finder to column view
      finder = {
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "clmv";
        NewWindowTarget = "Desktop";
      };
      # screencapture.location = "~/Desktop/screenshots";
      # screensaver.askForPasswordDelay = 10;
    };

    # This is required for now by Nix Darwin to determine
    # the user that runs darwin-rebuild commands.
    system.primaryUser = "matt";

    users.users.bnj = import ./users/bnj/user.nix;
    users.users.matt = import ./users/matt/user.nix;

    system.defaults.CustomUserPreferences = {
      "com.apple.windowserver" = {
        DisplayResolutionEnabled = true;
        MainDisplayMode = "2560x1600";
      };
    };
  };
in
nix-darwin.lib.darwinSystem {
  modules = [
    mac-app-util.darwinModules.default
    configuration
    nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enable = true;

        # Apple Silicon Only - enable rosetta 2
        # enableRosetta = true;
        
        # Optional: Enable auto-updating Homebrew
        # global.autoUpdate = true;

        user = "bnj";

        # Optional: Declarative tap management
        # taps = [ "homebrew/cask-fonts" ];
        taps = {
          "homebrew/homebrew-core" = homebrew-core;
          "homebrew/homebrew-cask" = homebrew-cask;
        };
        mutableTaps = false;
      };
    }
    home-manager.darwinModules.home-manager {
      home-manager = {
        backupFileExtension = ".bak";
        useGlobalPkgs = true;
        useUserPackages = true;

        users.bnj = import ./users/bnj/home.nix;
        users.matt = import ./users/matt/home.nix;
      };
    }
  ];
}