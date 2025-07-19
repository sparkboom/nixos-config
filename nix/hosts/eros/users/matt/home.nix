{ config, pkgs, ... }:
let
  user = import ./user.nix;
in
{
  # User account
  home.username = user.name;
  home.homeDirectory = user.home;

  # Packages
  home.packages =  import ./packages/user-pkgs.nix { inherit pkgs; };

  home.stateVersion = "23.11"; # Set this to the version you want to target

  programs = {
    git = import ./apps/git.nix;
  };

  home.sessionVariables = {
    EDITOR = "nano";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    PATH = "/run/current-system/sw/bin:\$\{PATH\}";
  };
}