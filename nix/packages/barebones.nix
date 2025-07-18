# Barebones tools needed to manage this repo

{ pkgs }:
with pkgs; [
    # Tools
    git                      # Git version control system
    just                     # Just command tool manager
    stow                     # Symlink farm manager
]