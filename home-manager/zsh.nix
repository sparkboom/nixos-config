{
  enable = true;
  shellAliases =
    (import ./git-aliases.nix)
    // (import ./docker-aliases.nix)
    // (import ./kubernetes.nix)
    // {
      ll = "ls -lah";
    };
}