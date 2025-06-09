# Nix Darwin 

- currently only supported in bash

be sure to add the nix darwin path
```sh
PATH=$PATH:/run/current-system/sw/bin
```

Nix Darwin Update
```sh
sudo darwin-rebuild switch --flake ~/dotfiles
```