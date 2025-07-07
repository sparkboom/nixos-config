{ pkgs ? null }:
{
  enable = true;
  shellAliases =
    (import ./git-aliases.nix)
    // (import ./docker-aliases.nix)
    // (import ./kubernetes.nix)
    // {
      ll = "ls -lah";
    };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "powerlevel10k";
    custom = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
  };
  # Optionally, set the prompt init file if you have a .p10k.zsh config
  # initExtra = ''
  #   [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  # '';
}