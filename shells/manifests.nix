let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { 
    config = {
      allowUnfree = true; 
    };
    overlays = [

    ]; 

  };
in
  pkgs.mkShellNoCC {

    packages = with pkgs; [
      neofetch
      docker
      colima
    ];

    GREETING = "Hello, Santosh!";

    shellHook = ''

      neofetch
    echo "Welcome to the experimental environment!"
    echo $GREETING 
    
    '';
  }
