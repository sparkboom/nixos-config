{ 
  self, 
  nix-darwin, 
  mac-app-util,
  home-manager,
  nixpkgs,
}:
let
  configuration = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

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
      dock.autohide = false;
      finder.AppleShowAllExtensions = true;
      # default Finder to column view
      finder.FXPreferredViewStyle = "clmv";
      # screencapture.location = "~/Desktop/screenshots";
      # screensaver.askForPasswordDelay = 10;
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

        users.bnj = import ./users/bnj/home.nix;
      };
    }
  ];
}