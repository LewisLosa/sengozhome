{
  pkgs,
  lib,
  vars,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ".." = "cd ..";
      neofetch = "fastfetch";
    };
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        }
      ];
    };
    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./_p10k;
        file = "p10k.zsh";
      }
    ];
    history.size = 10000;
  };
}
