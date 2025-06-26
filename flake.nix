{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs;
        [
          # cli
          _1password-cli
          ansible
          awscli2
          curl
          deno
          git
          gnutls
          go
          google-cloud-sdk 
          # ipfs
          k3d
          k9s
          kubectl
          kubernetes-helm
          mas
          nmap
          nodejs
          openssl_3
          python3
          rustc
          rustup
          sqlite
          wakeonlan
          wget
          yarn
          zsh
        ];

      # # Homebrew casks
      homebrew = {
        enable = true;
        casks = [
          "1password"
          "authy"
          "banktivity"
          "betterzip"
          "bitwarden"
          "blender"
          "brave-browser"
          # "discord"
          "docker-desktop"
          "dropbox"
          "expandrive"
          "firefox"
          "fujitsu-scansnap-home"
          "gitbutler"
          "google-chrome"
          "google-chrome@canary"
          # google cloud sdk to be via nix
          "gpg-suite"
          # "handbrake-app"
          "iterm2"
          "kaleidoscope"
          "kindle"
          "little-snitch"
          "nordvpn"
          "obsidian"
          #  openvpn-connect
          # postman
          "proton-pass"
          # proxyman
          "prusaslicer"
          # quip
          "rectangle"
          # resilio-sync 
          "shift"
          "shiftit"
          # splashtop-streamer 
          "spotify"
          "steam"
          "tailscale-app"
          "teamviewer"
          # tower
          # "transmission"
          # transmit
          # "tunnelblick"
          "ultimaker-cura"
          "visual-studio-code"
          "visual-studio-code@insiders"
          # "vlc"
          # "vlcstreamer"
          "whatsapp"
          "zoom"
        ];

        masApps = {
          "3d Scanner App" = 1419913995;
          "AI Chat Bot" = 6447312365;
          "Apple Configurator" = 1037126344;
          "Brother P-touch Editor" = 1453365242;
          "Day One" = 1055511498;
          "Home Assistant" = 1099568401;
          "Numbers" = 409203825;
          "OmniFocus" = 1542143627;
          "Paprika Recipe Manager 3" = 1234567890;
          "Pixelmator Pro" = 1289583905;
          "Spatial Media Toolkit" = 6477903679;
          "Windows App" = 1295203466;
          "Xcode" = 497799835;
        };
        # onActivation.cleanup = false; # comment out to disable cleanup
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

      system.primaryUser = "Matt";

      system.defaults = {
        dock.autohide = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
        # screencapture.location = "~/Desktop/screenshots";
        # screensaver.askForPasswordDelay = 10;
      };

      users.users.Matt = {
        name = "Matt";
        home = "/Users/matt";
      };

      
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MattsM3
    darwinConfigurations."MattsM3" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
