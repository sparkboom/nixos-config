{ config, pkgs, ... }:

{
  home.username = "matt";
  home.homeDirectory = "/Users/matt";

  home.stateVersion = "23.11"; # Set this to the version you want to target

  programs.zsh = import ./zsh.nix;
  programs.git = import ./git.nix;

  home.file.".editorconfig".text = ''
    root = true

    [*]
    indent_style = space
    indent_size = 2
  '';

  home.packages = with pkgs; [
    htop
    jq
    tree
  ];
}