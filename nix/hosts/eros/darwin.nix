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

    # Homebrew packages
    # homebrew = {
    #   enable = true;
    #   casks = import ./packages/homebrew-casks.nix;
    #   # masApps = import ./packages/mas-apps.nix;
    #   onActivation.cleanup = "uninstall";
    #   onActivation.upgrade = false;
    #   onActivation.autoUpdate = true;
    # };

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

    # This is required for now by Nix Darwin to determine
    # the user that runs darwin-rebuild commands.
    system.primaryUser = "bnj";
  };
in
nix-darwin.lib.darwinSystem {
  modules = [
    mac-app-util.darwinModules.default
    configuration
    nix-homebrew.darwinModules.nix-homebrew
    {
      homebrew = {
        enable = true;
        # Optional: Enable auto-updating Homebrew
        global.autoUpdate = true;
        # Optional: Declare taps, formulae, and casks
        # brews = [ "neovim" ];
        # casks = import ./packages/homebrew-casks.nix;

        # Optional: Declarative tap management
        # taps = [ "homebrew/cask-fonts" ];
        # taps = {
        #   "homebrew/homebrew-core" = homebrew-core;
        #   "homebrew/homebrew-cask" = homebrew-cask;
        # };
      };
    }
    # home-manager.darwinModules.home-manager {
    #   home-manager = {
    #     backupFileExtension = ".bak";
    #     useGlobalPkgs = true;
    #     useUserPackages = true;

    #     users.bnj = import ./users/bnj/home.nix;
    #   };
    # }
  ];
}