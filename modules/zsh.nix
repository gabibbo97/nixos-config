{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableGlobalCompInit = true;

    autosuggestions = {
      enable = true;
      extraConfig = {
        "ZSH_AUTOSUGGEST_USE_ASYNC" = "y";
      };
      strategy = "history";
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "root"
      ];
    };

    ohMyZsh = {
      enable = true;
      theme = "af-magic";
      plugins = [
        "colored-man-pages"
        "extract"
      ];
    };

    setOptions = [
      "HIST_FCNTL_LOCK"
      "HIST_IGNORE_DUPS"
      "HIST_REDUCE_BLANKS"
      "SHARE_HISTORY"
    ];

    shellAliases = {
      cat = "bat";
    };

  };

  # Set default shell
  users.users.giacomo.shell = pkgs.zsh;
}
