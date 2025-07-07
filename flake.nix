{
  description = "Nix-Darwin Flake for Personal MacBook Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ 
      self, 
      nix-darwin, 
      nixpkgs, 
      mac-app-util,
    }:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs;
        [
          # home manager
          home-manager

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

          # Apps
          bitwarden-desktop # ok
          blender # ok
          firefox # still loadable by launcher
          gitbutler
          google-chrome # 'google-chrome'
          iterm2 # "iterm2" cask
          obsidian # "obsidian" cask
          rectangle # "rectangle" cask
          spotify # 'spotify' cask
          tailscale # 'tailscale-app' cask
          whatsapp-for-mac # "whatsapp" cask
          vscode # "visual-studio-code" cask
          zoom-us # 'zoom' cask

          # Newly installed

          # Apps - not for now
          # discord
          # handbrake # "handbrake-app" cask
          # openvpn # "openvpn-connect" cask - not sure if this is the correct one
          # postman # "postman" cask
          # transmission_4 # "transmission"  cask
          # vlc # "vlc" cask
          # tailscale# "tailscale-app" 
          # zoom-us # "zoom" cask
        ];

      # # Homebrew casks
      homebrew = {
        enable = true;
        casks = [
          # Found in Nix search, installs, fails to launch from /nix/store
          "1password" # '1password-gui' 
          # Found in Nix search, installs, fails to launch
          "brave-browser" # 'brave'
          # Found in Nix, Failed to install
          "dropbox" # 'dropbox'
          "steam" # unsure
          # Found in Nix, Can't Install, only supports x86_64-linux
          # you could try to use export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 when installing
          "proton-pass"  # 'proton-pass'
          "teamviewer" # 'teamviewer'
          
          # Not found in Nix search
          "authy"  
          "banktivity"
          "betterzip"
          "docker-desktop" # is this available somewhere?
          "expandrive"
          "fujitsu-scansnap-home"
          "google-chrome@dev"
          "google-chrome@canary"
          "kaleidoscope"
          "little-snitch"
          "nordvpn"
          "prusaslicer"
          "shift"
          "ultimaker-cura"
          # "kindle"
          # proxyman
          # splashtop-streamer
          # transmit
          # "tunnelblick"
          # "vlcstreamer"

          
          "gpg-suite" # not sure if the UI is available on Nix, the cli tools are
          "visual-studio-code@insiders" # might be a way
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

      system.primaryUser = "Matt";

      system.defaults = {
        dock.autohide = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv"; # default Finder to column view
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
    darwinConfigurations.MattsM3 = nix-darwin.lib.darwinSystem {
      modules = [ 
        mac-app-util.darwinModules.default
        configuration
      ];
    };

    # Expose package set, including overlays, for convinience.
    darwinPackages = self.darwinConfigurations.MattsM3.packages;
  };
}
