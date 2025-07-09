# Nix Darwin 

Nix Darwin - Rebuild
```sh
just rebuild

# If just is not installed (i.e. first time use), then use
PATH=$PATH:/run/current-system/sw/bin
sudo darwin-rebuild switch --flake ~/Repos/infra/nix-config

# Dry Run
just rebuild-dry
```

Update
- updates dependencies the flake.lock file updates
```sh
# ~/dotfiles >
just update
```

Home-Manager Update
```sh
home-manager switch --flake ~/Repos/infra/nix-config/home-mananger
```

