default:
  @just --list

# Rebuilds Nix-Darwin, including home manager
rebuild-dry:
  @sudo darwin-rebuild switch --flake ~/Repos/infra/nix-config/nix --dry-run

# Rebuilds Nix-Darwin, including home manager
rebuild:
  @sudo darwin-rebuild switch --flake ~/Repos/infra/nix-config/nix

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


# Creates symlinks to stow the home folder, and adopting files in the process
adopt:
  #!/usr/bin/env bash
  cd dotfiles > /dev/null;
  myhost="$(hostname | sed 's/\.local$//')";
  echo "Stowing for host: $myhost";
  stow --adopt --target="$HOME" "$myhost"; 
  cd -  > /dev/null;

# Creates symlinks to stow the home folder
stow:
  #!/usr/bin/env bash
  cd dotfiles > /dev/null;
  myhost="$(hostname | sed 's/\.local$//')";
  echo "Stowing for host: $myhost";
  stow --target="$HOME" "$myhost"; 
  cd -  > /dev/null;
 
# Reverts symlinks to the stow folder
unstow:
  #!/usr/bin/env bash
  cd dotfiles > /dev/null;
  myhost="$(hostname | sed 's/\.local$//')";
  echo "Unstowing for host: $myhost";
  stow -D --target="$HOME" "$myhost"; 
  cd -  > /dev/null;

gc:
  @nix-collect-garbage -d