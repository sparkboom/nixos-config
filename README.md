# Nix Darwin 

- currently only supported in bash

be sure to add the nix darwin path
```sh
PATH=$PATH:/run/current-system/sw/bin
```

Nix Darwin - Rebuild
```sh
sudo darwin-rebuild switch --flake ~/dotfiles
```

Update
- updates dependencies the flake.lock file updates
```sh
# ~/dotfiles >
nix flake update
sudo darwin-rebuild switch --flake .
```

Home-Manager Update
```sh
home-manager switch --flake ~/dotfiles/home-manager/#matt
```

