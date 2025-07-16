{ config, pkgs, ... }:
{
  # User account
  home.username = "bnj";
  home.homeDirectory = "/Users/bnj";

  # Packages
  homebrew = {
    enable = true;
    casks = import ./packages/homebrew-casks.nix;
    # masApps = import ./packages/mas-apps.nix;
    onActivation.cleanup = "uninstall";
    onActivation.upgrade = false;
    onActivation.autoUpdate = true;
  };
  home.packages = import ./packages/system-packages.nix { inherit pkgs; };

  home.stateVersion = "23.11"; # Set this to the version you want to target

  home.sessionVariables = {
    EDITOR = "nano";
    ZINIT_HOME = "/nix/store/wspbsjmahdk3fsln6ls17rwa0m8dx5dd-zinit-3.14.0/share/zinit";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    PATH = "/run/current-system/sw/bin:\$\{PATH\}";
  };
}