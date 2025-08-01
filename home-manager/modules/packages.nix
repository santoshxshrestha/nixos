{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep
    hyprshot

    rofi-wayland
    waybar
    hypridle
    hyprlock
    hyprsunset
    cliphist # Clipboard manager compatible with Wayland and wl-paste

    kitty
    vscode
    tmux
    gimp
    discord

    playerctl
    wl-clipboard
    swaynotificationcenter
    brightnessctl

    mpvpaper
    hyprlock
    hyprpaper
    btop
    ffmpeg

    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    jetbrains-mono
    fira-code
    font-awesome

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
