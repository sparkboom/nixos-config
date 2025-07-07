{ pkgs ? null }:
{
  enable = true;
  shellAliases =
    (import ./aliases/git.nix)
    // (import ./aliases/docker.nix)
    // (import ./aliases/kubernetes.nix)
    // (import ./aliases/shortcuts.nix);
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "powerlevel10k";
    custom = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
    # initExtra = ''
    #   [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    # '';
  };
}