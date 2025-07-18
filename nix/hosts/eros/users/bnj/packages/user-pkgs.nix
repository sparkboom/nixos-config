{ pkgs }:
with pkgs; [
] ++ (import ../../../../../packages/barebones.nix { inherit pkgs; })