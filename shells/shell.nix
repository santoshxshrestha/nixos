let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable";
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
      vscode
    ];

    GREETING = "Hello, Santosh!";
    shellHook = ''

    neofetch
    echo "Welcome to the your environment!"
    echo $GREETING 
    '';
  } 
