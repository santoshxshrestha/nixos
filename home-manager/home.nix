{ config, pkgs, ... }:

{

  imports = [
    # ./hyprland.nix
    ./modules/fish.nix
    ./modules/packages.nix
    ./modules/gtk.nix
    ./modules/fastfetch.nix
    ./modules/nixvim/nixvim.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "santosh";
  home.homeDirectory = "/home/santosh";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprland.conf".source =
      ./config/hyprland/hyprland_aesthetics.conf;
    # ".config/hypr/hyprland.conf".source =
    # ./config/hyprland/hyprland_performance.conf;
    ".config/hypr/hypridle.conf".source = ./config/hypridle/hypridle.conf;
    ".config/hypr/hyprpaper.conf".source = ./config/hyprpaper/hyprpaper.conf;
    ".config/kitty".source = ./config/kitty;
    #".config/alacritty/alacritty.toml".source = ./config/alacritty/alacritty.toml;
    ".tmux.conf".source = ./config/tmux/.tmux_aesthetics.conf;
    #".tmux.conf".source = ./config/tmux/.tmux_performance.conf;
    # ".zshrc".source = ./config/zsh/.zshrc;
    ".config/hypr/hyprlock.conf".source = ./config/hyprlock/hyprlock.conf;
    ".config/hypr/hyprsunset.conf".source = ./config/hyprsunset/hyprsunset.conf;
    ".config/rofi".source = ./config/rofi;
    ".config/starship.toml".source = ./config/starship/starship.toml;
    ".local/scripts".source = ./scripts;
    ".config/waybar".source = ./config/waybar;

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/santosh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "nvim"; };
  programs.git = {
    enable = true;
    userName = "Santosh Shrestha";
    userEmail = "santoshxshrestha@gmail.com";
  };

  programs.starship.enable = true;

  # programs.zsh = {
  # 	enable = true;
  # 	shellAliases = {
  # 		rebuild = "sudo nixos-rebuild switch --flake /home/santosh/nixos/#santosh";
  # 	};
  # };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice";
    size = 20;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
