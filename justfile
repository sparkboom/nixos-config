default:
  @just --list

# Builds and applies Nix-Darwin & Home Manager configuration
switch:
  @sudo darwin-rebuild switch --flake .

# Builds and tests Nix-Darwin & Home Manager configuration
check:
  @sudo darwin-rebuild check --flake .

# Builds top-level derication Nix-Darwin & Home Manager configuration and provides a symlink to the result
build:
  @sudo darwin-rebuild build --flake .

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
  myhost="$(hostname | sed 's/\.local$//')";
  echo "Stowing & Adopting for host: $myhost, user: $USER";
  cd "dotfiles/$myhost" > /dev/null;
  stow --adopt --target="$HOME" "$USER"; 
  cd -  > /dev/null;

# Creates symlinks to stow the home folder
stow:
  #!/usr/bin/env bash
  myhost="$(hostname | sed 's/\.local$//')";
  echo "Stowing & Adopting for host: $myhost, user: $USER";
  cd "dotfiles/$myhost" > /dev/null;
  stow --target="$HOME" "$USER"; 
  cd -  > /dev/null;
 
# Reverts symlinks to the stow folder
unstow:
  #!/usr/bin/env bash
  echo "Unstowing & Adopting for host: $myhost, user: $USER";
  cd "dotfiles/$myhost" > /dev/null;
  stow -D --target="$HOME" "$USER"; 
  cd -  > /dev/null;

gc:
  @nix-collect-garbage -d