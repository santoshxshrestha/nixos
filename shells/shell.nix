let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { 
    config = {
      allowUnfree = true; 
    };
    overlays = []; 
  };
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      firefox
      docker-compose
      docker
      neofetch
      vscode
    ];

    GREETING = "Hello, Santosh!";
    shellHook = ''

    neofetch
    echo "Welcome to the your environment!"
    echo $GREETING 
    '';
  } 
