{ lib, ... }:
{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ls = "ls --color";
      enix = "pushd ~/nix && nvim ~/nix && popd";
    };

    sessionVariables = {
    };

    initContent = lib.mkOrder 1200 ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "$\{(s.:.)LS_COLORS\}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

      autoload -U colors && colors
      export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
    '';

    historySubstringSearch.enable = true;
    history = {
      ignoreAllDups = true;
      ignoreDups = true;
      saveNoDups = true;
      size = 5000;
      share = true;
      ignoreSpace = true;
      append = true;
    };

    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-completions"
        "zsh-users/zsh-autosuggestions"
        "Aloxaf/fzf-tab"
      ];
    };
  };
}
