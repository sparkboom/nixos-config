rebuild-dry:
  # Rebuilds Nix-Darwin, including home manager
  sudo darwin-rebuild switch --flake ~/Repos/infra/nix-config --dry-run

rebuild:
  # Rebuilds Nix-Darwin, including home manager
  sudo darwin-rebuild switch --flake ~/Repos/infra/nix-config

update:
  # Update Nix dependencies & rebuilds
  nix flake update
  sudo darwin-rebuild switch --flake ~/Repos/infra/nix-config

zshrc:
  c ~/.zshrc

search-store search:
  # Search Nix Store via grep
  nix-store --query --requisites /run/current-system | grep {{search}}

stow:
  # Creates symlinks to the stow folder
  stow --target="$HOME" dotfiles; 
 
unstow:
  # Reverts symlinks to the stow folder
  stow -D --target="$HOME" dotfiles; 