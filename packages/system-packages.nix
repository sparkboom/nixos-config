{ pkgs }:

with pkgs; [
  # cli
  _1password-cli           # 1Password CLI
  ansible                  # Ansible automation tool
  awscli2                  # AWS CLI v2
  bat                      # cat with syntax highlighting
  cowsay                   # Text program
  curl                     # Command line tool for transferring data with URLs
  deno                     # TypeScript/JavaScript runtime
  eza                      # Modern replacement for 'ls'
  fzf                      # Fuzzy finder for the command line
  gh                       # GitHub CLI tool
  git                      # Git version control system
  gnutls                   # TLS/SSL library
  go                       # Go programming language
  google-cloud-sdk         # Google Cloud SDK
  home-manager             # Nix-based user configuration manager
  just                     # Justfile task runner
  k3d                      # Lightweight Kubernetes in Docker
  k9s                      # Terminal UI for managing Kubernetes clusters
  kubectl                  # Kubernetes command-line tool
  kubernetes-helm          # Helm package manager for Kubernetes
  mas                      # Mac App Store CLI
  nix-index                # Indexes local Nix packages
  nmap                     # Network exploration tool and security/port scanner
  nodejs                   # JavaScript runtime
  nushell                  # Modern shell for the command line
  oh-my-posh               # Prompt theme engine
  openssl_3                # SSL/TLS cryptography library
  pay-respects             # Utility for Nix package search
  python3                  # Python 3 programming language
  rustc                    # Rust compiler
  rustup                   # Rust toolchain installer
  sqlite                   # Lightweight SQL database engine
  stow                     # Symlink farm manager
  tlrc                     # TUI client for LanguageTool
  tmux                     # Terminal multiplexer
  wakeonlan                # Wake-on-LAN utility
  wget                     # Network downloader
  volta                    # JavaScript tool manager
  yarn                     # JavaScript package manager
  zoxide                   # Smarter cd command
  zsh                      # Z shell
  zsh-autosuggestions      # Fish-like autosuggestions for zsh
  zsh-completions          # Additional completion definitions for zsh
  zsh-fzf-tab              # FZF-based tab completion for zsh
  zsh-syntax-highlighting  # Syntax highlighting for zsh

  # GUI Apps
  bitwarden-desktop        # Password manager desktop app
  blender                  # 3D creation suite
  firefox                  # Web browser
  # ghostty                # Terminal emulator (currently broken)
  gitbutler                # Git GUI client
  google-chrome            # Web browser
  obsidian                 # Note-taking app
  rectangle                # Window management app
  spotify                  # Music streaming app
  tailscale                # Mesh VPN
  vscode                   # Visual Studio Code editor
  warp-terminal            # Modern terminal app
  wezterm                  # GPU-accelerated terminal emulator
  whatsapp-for-mac         # WhatsApp desktop client
  zoom-us                  # Video conferencing app

  # Newly installed

  # Apps - not for now
  # discord               # Chat app
  # handbrake             # Video transcoder
  # ipfs                  # InterPlanetary File System
  # openvpn               # VPN client
  # postman               # API development environment
  # transmission_4        # BitTorrent client
  # vlc                   # Media player
]