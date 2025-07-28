{ pkgs }:
with pkgs; [
  # CLI Tools
  bat                      # cat with syntax highlighting
  cowsay                   # Text program
  curl                     # Command line tool for transferring data with URLs
  eza                      # Modern replacement for 'ls'
  fzf                      # Fuzzy finder for the command line
  oh-my-posh               # Prompt theme engine
  pay-respects             # Utility for Nix package search
  zoxide                   # Smarter cd command
  zsh                      # Z shell
  zsh-autosuggestions      # Fish-like autosuggestions for zsh
  zsh-completions          # Additional completion definitions for zsh
  zsh-fzf-tab              # FZF-based tab completion for zsh
  zsh-syntax-highlighting  # Syntax highlighting for zsh
] ++ (import ../../../../../packages/barebones.nix { inherit pkgs; })