{ 
  self, 
  nix-darwin, 
  mac-app-util,
  home-manager,
  nixpkgs,
  nixpkgs-stable-darwin
}:
let
  
  configuration = { pkgs, ... }: 
    let
      pkgs-stable = nixpkgs-stable-darwin.legacyPackages.${pkgs.system};
    in {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = import ./packages/system-packages.nix { inherit pkgs pkgs-stable; };

    # # Homebrew casks
    homebrew = {
      enable = true;
      casks = import ./packages/homebrew-casks.nix;
      masApps = import ./packages/mas-apps.nix;
      onActivation.cleanup = "uninstall";
      onActivation.upgrade = false;
      onActivation.autoUpdate = true;
    };

    # Install fonts
    fonts.packages = import ./packages/fonts.nix { inherit pkgs; };

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
      dock.autohide = false;
      finder.AppleShowAllExtensions = true;
      finder.FXPreferredViewStyle = "clmv";
      # default Finder to column view
      # screencapture.location = "~/Desktop/screenshots";
      # screensaver.askForPasswordDelay = 10;
    };

    # Check to see if this works
    system.defaults.CustomUserPreferences = {
      "com.apple.windowserver" = {
        DisplayResolutionEnabled = true;
        MainDisplayMode = "2560x1600";
      };
    };

    system.primaryUser = "matt";

    users.users.matt = {
      name = "matt";
      home = "/Users/matt";
    };
  };
in
nix-darwin.lib.darwinSystem {
  modules = [
    mac-app-util.darwinModules.default
    configuration
    home-manager.darwinModules.home-manager {
      home-manager = {
        backupFileExtension = ".bak";
        useGlobalPkgs = true;
        useUserPackages = true;

        sharedModules = [
          mac-app-util.homeManagerModules.default
        ];

        users.matt = import ./users/matt/home.nix;
      };
    }
  ];
}