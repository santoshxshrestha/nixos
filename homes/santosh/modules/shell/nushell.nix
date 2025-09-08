{ config, ... }: {
  programs.nushell = {
    enable = false;
    settings = { show_banner = false; };

    shellAliases = {
      "initialize" = "flake-initializer";
      "b" = "beam";

      ".." = "cd ..";
      "r" = "rm -f (fzf --reverse)";

      "asdf" = "sessionizer";
      "adsf" = "sessionizer";
      "adfs" = "sessionizer";

      "rebuild" =
        "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nixos/#santosh";

      "gs" = "git status";
      "gd" = "git diff";
      "ga" = "git add .";
      "c" = "git-commit";
      "P" = "git push origin (git branch --show-current)";
    };
  };

}
