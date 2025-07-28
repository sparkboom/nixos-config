{ nixpkgs }:

nixpkgs.lib.genAttrs [ "aarch64-darwin" "x86_64-darwin" "x86_64-linux" ] (system:
  let 
    pkgs = import nixpkgs { inherit system; };
  in { 
    default = pkgs.mkShell { packages = with pkgs; [ 
      git
      just
      stow
      zsh
    ]; }; 
  }
)