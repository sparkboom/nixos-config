{ pkgs ? null }:
{
  enable = true;
  shellAliases =
    (import ../../../../apps/git/aliases.nix)
    // (import ../../../../apps/docker/aliases.nix)
    // (import ../../../../apps/kubernetes/aliases.nix)
    // (import ./aliases/apps.nix)
    // (import ./aliases/shortcuts.nix)
    // {
      ls = "ls -A --color";
      paths = "echo $PATH | tr ':' '\n' | sort";
    };
  
  initContent = ''
    # Enable hidden files in zsh completio
    # setopt globdots
    # compinit _comp_options+=(globdots)

    # Allow completions to be case-insensitive
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

    # Allow completions to use colors
    zstyle ':completion:*' list-colors "\$\{(s.:.\)LS_COLORS}"

    # Stop default completion behavior
    zstyle ':completion:*' menu no
    # Show preview in autocompletion
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realPath'

    if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
      eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/default.toml)"
    fi

    # Enable fzf tab completion
    eval "$(fzf --zsh)"

    # Enable fuzzy zsh-autosuggestions
    source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

    source ~/.mydotfiles/utility.sh

    cowsay "Hi $USER! Welcome to $(hostname) MOOooo"
  '';

  history = {
    ignoreDups = true; # HIST_IGNORE_DUPS
    ignoreAllDups = true; # HIST_IGNORE_ALL_DUPS, HISTDUP=erase
    share = false; # SHARE_HISTORY
    size = 10000; # HISTSIZE  
    save = 10000; # HISTSIZE  
    ignoreSpace = true; # HIST_IGNORE_SPACE
    # reduceBlanks = true; # HIST_REDUCE_BLANKS
    extended = true; # HIST_EXTENDED
  };

  syntaxHighlighting = {
    enable = true;
  };

  plugins = [
    {
      name = "zsh-autosuggestions";
      src = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
    }
    {
      name = "zsh-completions";
      src = "${pkgs.zsh-completions}/share/zsh-completions";
    }
    {
      name = "zsh-fzf-tab";
      src = "${pkgs.zsh-fzf-tab}/share/zsh-fzf-tab";
    }
    {
      name = "zsh-syntax-highlighting";
      src = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
    }
  ];
}