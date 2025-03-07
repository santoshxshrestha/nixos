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
      neofetch
    ];

    GREETING = "Hello, Santosh!";
    shellHook = ''

    echo "Welcome to the your environment!"
    echo $GREETING 
    neofetch
    '';
  } 
