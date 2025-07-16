{ config, pkgs, ... }:
{
  # User account
  home.username = "bnj";
  home.homeDirectory = "/Users/bnj";

  # Packages
  home.packages = import ./packages/system-packages.nix { inherit pkgs; };

  home.stateVersion = "23.11"; # Set this to the version you want to target

  programs = {
    git = import ./git.nix;
  };

  home.sessionVariables = {
    EDITOR = "nano";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    PATH = "/run/current-system/sw/bin:\$\{PATH\}";
  };
}