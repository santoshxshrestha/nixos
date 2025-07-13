{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    shellInit = ''
      set -gx EDITOR nvim
      
      set -gx PATH ~/bin $PATH
      set -gx PATH ~/.local/scripts $PATH
      set -gx PATH ~/.cargo/bin $PATH
      fish_vi_key_bindings
      fish_vi_cursor
    '';
    
    shellAbbrs = {
      ".." = "cd ..";
      "ls" = "ls --color";
      "asdf" = "~/.local/scripts/sessionizer";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/nixos/#santosh";
    };
    
    # plugins = [
    #   {
    #     name = "fzf-fish";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "PatrickF1";
    #       repo = "fzf.fish";
    #       rev = "v10.3";
    #       sha256 = "sha256-T8KYLA/r/gOKvALPQ4n3dKNZHFZGVYd9n6pJYzb5NjY=";
    #     };
    #   }
    #   {
    #     name = "tide";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "IlanCosman";
    #       repo = "tide";
    #       rev = "v6.0.1";
    #       sha256 = "sha256-oLD7gYFCIeIzBeAW1j62z4nQhJhGhzm8J3hLEqK8+w4=";
    #     };
    #   }
    # ];
  };

  programs.fzf = {
    enable = true;
    # keybindings = true;
    # fuzzyCompletion = true;
  };
}
