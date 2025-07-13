{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    shellInit = ''
      set -gx EDITOR nvim
      
      set -gx PATH ~/bin $PATH
      set -gx PATH ~/.local/scripts $PATH
      set -gx PATH ~/.cargo/bin $PATH
    '';
    
    shellAbbrs = {
      ".." = "cd ..";
      "ls" = "ls --color";
      "asdf" = "~/.local/scripts/sessionizer";
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

  # environment.systemPackages = with pkgs; [
  #   fish
  #   fzf
  #   bat         
  #   fd         
  #   ripgrep    
  #   starship  
  # ];

  
  programs.fzf = {
    enable = true;
    # keybindings = true;
    # fuzzyCompletion = true;
  };
}
