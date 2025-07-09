# Nix Darwin 

- currently only supported in bash

be sure to add the nix darwin path
```sh
PATH=$PATH:/run/current-system/sw/bin
```

Nix Darwin - Rebuild
```sh
just rebuild
```

Update
- updates dependencies the flake.lock file updates
```sh
# ~/dotfiles >
nix flake update
sudo darwin-rebuild switch --flake .

# Dry Run
sudo darwin-rebuild switch --flake . --dry-run
```

Home-Manager Update
```sh
home-manager switch --flake ~/Repos/infra/nix-config/home-mananger
```

