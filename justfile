default:
  @just --list

# Rebuilds Nix-Darwin, including home manager
rebuild-dry:
  @sudo darwin-rebuild switch --flake ~/Repos/infra/nix-config --dry-run

# Rebuilds Nix-Darwin, including home manager
rebuild:
  @sudo darwin-rebuild switch --flake ~/Repos/infra/nix-config

# Update all Nix, brew and mas dependencies & performs a nix rebuild
update:
  @nix flake update
  # @just rebuild

zshrc:
  @code-insiders ~/.zshrc

# Query Home Manager
search-hm query:
  @open "https://home-manager-options.extranix.com/?query={{query}}"

# Query Nix Packages
search-nix query:
  @open "https://search.nixos.org/packages?query={{query}}"

# Search local Nix store via Grep
search-store search:
  @nix-store --query --requisites /run/current-system | grep {{search}}

# Creates symlinks to the stow folder
stow:
  @stow --target="$HOME" dotfiles; 
 
# Reverts symlinks to the stow folder
unstow:
  @stow -D --target="$HOME" dotfiles; 