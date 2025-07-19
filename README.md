# Nix Darwin 

## Installation

See [MacOS Installation](./docs/macos-installation.md)

----

Nix Darwin - Rebuild
```sh
just switch
```

Update
- updates dependencies the flake.lock file updates
```sh
# ~/nix-config >
just update
just switch

# list outdated casks
brew outdated

# update brew casks independently (just update preferred over this)
brew update && brew upgrade
```
