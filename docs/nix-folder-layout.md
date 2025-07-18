# Nix Folder Layout

## Hosts & Users

Nix files and configuration are expressed in the following hierarchy

```
nix/hosts/{hostname}/users/{username}/apps/{app}/{...}
```

Any user configuration that is designed to span across multiple hosts can be shared via
```
nix/users/{username}
```

Any app configuration that is designed to span across multiple users or hosts can be shared via
```
nix/apps/{app}
```

Hosts will have a system-level configuration such as 'darwin' for macos and 'linux' for NixOS configurations for Linux.
These are the entrypoint configuration files referenced by the root flake.nix
```
nix/hosts/
- darwin.nix
- linux.nix
```

User-level configuration via Home Manager uses `home.nix`
These are the entrypoint configuration files referenced by the darwin/linux system-level configurations
```
.../users/{username}
- home.nix
```

----

## Installed Packages

System(host)-level packages (needing sudo or installed via Homebrew) are expressed at

```
nix/hosts/packages/
- system-pkgs.nix
- homebrew-casks.nix
- mas-apps.nix
- fonts.nix
```

User-level packages (Nix only) are expressed at
```
nix/hosts/packages/
- user-pkgs.nix
```

### Derived packages 

Any derivations will be located at

```
nix/packages/
```