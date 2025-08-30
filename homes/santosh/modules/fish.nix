{ config, ... }: {
  programs.fish = {
    enable = true;
    generateCompletions = true;
    interactiveShellInit = "fastfetch";

    shellInit = ''
      set -gx EDITOR nvim

      fish_vi_key_bindings
      fish_vi_cursor

      function fish_user_key_bindings
        fish_vi_key_bindings
        bind -M insert \cf accept-autosuggestion
        bind \cf accept-autosuggestion
      end

      set -U fish_greeting

      set -gx PATH ${config.home.homeDirectory}/bin $PATH
      set -gx PATH ${config.home.homeDirectory}/.local/scripts $PATH
      set -gx PATH ${config.home.homeDirectory}/.cargo/bin $PATH
    '';
    shellAbbrs = {
      "initialize" = "flake-initializer";
      "b" = "beam";
    };

    shellAliases = {
      ".." = "cd ..";
      "ls" = "ls --color";

      "asdf" = "${config.home.homeDirectory}/.local/scripts/sessionizer";
      "adsf" = "${config.home.homeDirectory}/.local/scripts/sessionizer";
      "adfs" = "${config.home.homeDirectory}/.local/scripts/sessionizer";

      "rebuild" =
        "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nixos/#santosh";

      "gs" = "git status";
      "gd" = "git diff";
      "ga" = "git add .";
      "c" = "git-commit";
      "P" = "git push origin $(git branch --show-current)";
    };
  };

  programs.fzf = { enable = true; };
}
