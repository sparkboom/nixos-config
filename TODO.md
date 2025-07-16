# Darwin
- Screen resolution

# To Do

Secrets mgmt

Aliases
h = history
cat = bat
top = btop
man = batman

l = eza -lah
ls = eza
tree = "eza --tree --git-ignore"
j = just
mk = (){mkdir -p $1 && cd $1}
# cdp = "pwd | xclip -selection clipboard" - copy current path
ports = netstat -tulanp
serve = python3 -m http.server
rm = gio trash

g = lazygit
y = yazi



Derivations
- Fonts - OperatorMono  & SourceCodePro+Powerline+Awesome+Regular
  - Save font to private repo
  - create derivation that unpacks and copies font to /Library/Fonts/
  - other fonts?

- External App - PowerProtect
 - Power Protect, not available elsewhere https://x74353.github.io/Amphetamine-Power-Protect/

Mac Configure / Darwin
- define which apps to appear on the dock at all times and order
- launchpad - how it's organised
- which app not to launch at startup?
- services
  - finder
    - open in insiders
    - open in nano
    - show hidden files and all extensions
- generate ssh configs for other devices
- move app installations to user level rather than system level

zsh plugins?
- highlight command green when recognised
- belak/zsh-utils. ?
- you-should-use plugin
- z
- ssh-agent
https://gist.github.com/kevin-smets/8568070

Apps to configure
- vs code & insiders
- git
- iterm2
- ghostty
- tmux

Cron/Sync jobs
- i.e obsidian backups

Apps to install
- jj
- Is there a way to install some versioned apps via nix - chrome canary, vs code insiders

Issues
- 

Secrets management
- how to manage 
- generate ssh keys if not there
- how to manage 

Env Vars
- EDITORCONFIG

Get to know tooling
  https://www.youtube.com/watch?v=mmqDYw9C30I


----

## Issues

Installation on every rebuild - see logs
- Installing Paprika Recipe Manager 3 
- Uninstalling mas... (8 files, 2.1MB)

## Bootstrapping Instructions

https://github.com/EmergentMind/nix-config/blob/dev/shell.nix


