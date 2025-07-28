{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

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

      set -gx PATH ~/bin $PATH
      set -gx PATH ~/.local/scripts $PATH
      set -gx PATH ~/.cargo/bin $PATH
    '';

    shellAbbrs = {
      ".." = "cd ..";
      "ls" = "ls --color";
      "asdf" = "~/.local/scripts/sessionizer";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/nixos/#santosh";
      "initialize" = "flake-initializer";

      "gs" = "git status";
      "ga" = "git add .";
      "gc" = "git-commit";
      "gp" = "git push origin $(git branch --show-current)";
    };
  };

  programs.fzf = { enable = true; };
}
