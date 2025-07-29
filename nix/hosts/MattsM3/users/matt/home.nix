{ config, pkgs, lib, ... }:
let
  user = import ./user.nix;

in
{
  # User account
  home.username = user.name;
  home.homeDirectory = user.home;

  home.stateVersion = "23.11"; # Set this to the version you want to target

  home.sessionVariables = {
    EDITOR = "nano";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    PATH = "/run/current-system/sw/bin:\$\{PATH\}";
  };

  programs = {
    zsh = import ./apps/zsh.nix { inherit pkgs; };
    git = import ./apps/git.nix { inherit pkgs lib; };
    zoxide = import ../../../../apps/zoxide/config.nix { inherit pkgs; };
    pay-respects = import ../../../../apps/pay-respects/config.nix { inherit pkgs; };
  };

  home.file.".editorconfig".text = ''
    root = true

    [*]
    indent_style = space
    indent_size = 2
  '';

  home.packages = with pkgs; [
    htop
    jq
    yq
    tree
  ];
}