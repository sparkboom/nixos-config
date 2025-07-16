[
  # Found in Nix search, installs, fails to launch
  "brave-browser"              # Brave web browser

  # Found in Nix, Can't Install, only supports x86_64-linux
  # you could try to use export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 when installing
  "proton-pass"                # Proton Pass password manager

  # Not found in Nix search
  "google-chrome"             # Google Chrome web browser - we use casks so 'open' command works in shell

  "proton-mail"               # Proton Mail - Maill client
  # Only have derivation for intel Macs
  # "authy"                      # 2FA authenticator

  "visual-studio-code@insiders" # VS Code
]