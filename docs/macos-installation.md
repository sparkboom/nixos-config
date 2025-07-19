
## Initial Installation (MacOS)

Settings > Sharing > Remote Login >
- Remote Login - turn on
- also, Allow full disk access for remote users gets turned on

```sh
ssh-copy-id {user}@{ip}
```

Add this locally to your `.ssh/config`
```
Host {host}
    HostName {ip}
    User bnj
    addkeystoagent yes
    usekeychain yes
    preferredauthentications publickey
    IdentityFile ~/.ssh/id_ed25519
```

```sh
ssh {host}
```


```sh
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
# no - to determinate installer, use nixos versrion

# restart shell to get nix available
eval zsh 
```

```sh
# generate keys if not done so already
ssh-keygen -t ed25519 -C "matt@sparkboom.com"
eval "$(ssh-agent -s)"
cat ~/.ssh/id_ed25519.pub
```
- go to https://github.com/settings/keys and add the public key


```sh
# download nixos-config repo
mkdir -p ~/Repos/infra/nixos-config
cd ~/Repos/infra/nixos-config

# launch the shell with basic tooling
nix develop

# nix-shell >
git clone git@github.com:sparkboom/nixos-config.git .
exit

sudo scutil --set LocalHostName {host in config}

sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
sudo mv /etc/zprofile /etc/zprofile.before-nix-darwin

nix run nix-darwin/master#darwin-rebuild -- switch --flake .
```
