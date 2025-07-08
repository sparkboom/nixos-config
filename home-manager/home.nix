{ config, pkgs, ... }:

{
  home.username = "matt";
  home.homeDirectory = "/Users/matt";

  home.stateVersion = "23.11"; # Set this to the version you want to target

  programs.zsh = import ./zsh.nix { inherit pkgs; };
  programs.git = import ./git.nix;

  home.file.".editorconfig".text = ''
    root = true

    [*]
    indent_style = space
    indent_size = 2
  '';

  home.file.".p10k.zsh".text = ''
    # Powerlevel10k configuration
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="> "
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
    POWERLEVEL9K_STATUS_OK=true
    POWERLEVEL9K_STATUS_ERROR=true
    POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
    POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
    POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
  '';

  home.packages = with pkgs; [
    htop
    jq
    tree
  ];
}