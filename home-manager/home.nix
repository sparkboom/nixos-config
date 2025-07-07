{ config, pkgs, ... }:

{
  home.username = "matt";
  home.homeDirectory = "/Users/matt";

  home.stateVersion = "23.11"; # Set this to the version you want to target

  # Example: Enable some Home Manager modules
  programs.zsh.enable = true;
  programs.git.enable = true;

  # Example: Set some dotfiles or options
  home.file.".editorconfig".text = ''
    root = true

    [*]
    indent_style = space
    indent_size = 2
  '';

  # Example: Add some user packages
  home.packages = with pkgs; [
    htop
    jq
    tree
  ];
}