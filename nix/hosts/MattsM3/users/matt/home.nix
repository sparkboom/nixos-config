{ config, pkgs, ... }:

{
  home.username = "matt";
  home.homeDirectory = "/Users/matt";

  home.stateVersion = "23.11"; # Set this to the version you want to target

  home.sessionVariables = {
    EDITOR = "nano";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    PATH = "/run/current-system/sw/bin:\$\{PATH\}";
  };

  programs = {
    zsh = import ./zsh.nix { inherit pkgs; };
    git = import ./git.nix;
    zoxide = { 
      enable = true;
      enableZshIntegration = true;
    };
    pay-respects = {
      enable = true;
      package = pkgs.pay-respects;
      options = [
        "--alias"
        "tf"
      ];
    };
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