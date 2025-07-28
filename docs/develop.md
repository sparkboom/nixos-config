# Develop

When opening VS Code, the `.vscode/extensions.json` should trigger the app to install the listed extensions.

Be sure that after installing globally, to disable, then enable for workspace only.

## Stow

Stow can also be used to store dot files in this repo and take advantage of version control. This can only be done on a per-host-and-user basis atm.

When configurations are more 'stable', they can be managed by Nix.

Create symlinks in home folder to map to repository's dotfiles

```sh
just stow

# if there are existing files, then adopt them instead
just adopt
```

### Unstow

```sh
# unstow all
just unstow

# unstow specific path
just unstow
# delete file to unlink
just stow
```

note - if the config was a symlink, this may remove it. If the symlink was created by Nix, simply run `just switch` to rebuild you dotfiles.

