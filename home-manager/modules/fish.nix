{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    shellInit = ''
      set -gx EDITOR nvim

      fish_vi_key_bindings
      fish_vi_cursor

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
    };
  };

  programs.fzf = {
    enable = true;
  };
}
