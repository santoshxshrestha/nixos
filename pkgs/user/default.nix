{ config, pkgs, ... }:
let
  waylandPkgs = import ../user/wayland.nix { inherit pkgs; };
  fontsPkgs = import ../user/fonts.nix { inherit pkgs; };
  utilsPkgs = import ../user/utils.nix { inherit pkgs; };
  gamingPkgs = import ../user/gaming.nix { inherit pkgs; };
in {
  home.packages = with pkgs;

    waylandPkgs ++ fontsPkgs ++ utilsPkgs ++ gamingPkgs;
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
}
