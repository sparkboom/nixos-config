{ pkgs }:

with pkgs; [
  # cli
  _1password-cli
  ansible
  awscli2
  bat
  curl
  deno
  eza
  fzf
  git
  gnutls
  go
  google-cloud-sdk 
  home-manager
  just
  k3d
  k9s
  kubectl
  kubernetes-helm
  mas
  nmap
  nodejs
  oh-my-posh
  openssl_3
  pay-respects
  python3
  rustc
  rustup
  sqlite
  stow
  tlrc
  tmux
  wakeonlan
  wget
  volta
  yarn
  zoxide
  zsh
  zsh-autosuggestions
  zsh-completions
  zsh-fzf-tab
  zsh-syntax-highlighting

  # GUI Apps
  bitwarden-desktop
  blender
  firefox
  # ghostty # currently marked as broken
  gitbutler
  google-chrome
  iterm2
  obsidian
  rectangle
  spotify
  tailscale
  whatsapp-for-mac
  vscode
  zoom-us

  # Newly installed

  # Apps - not for now
  # discord
  # handbrake
  # ipfs
  # openvpn
  # postman
  # transmission_4
  # vlc
  # tailscale
  # zoom-us
]