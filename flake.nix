{
  description = "flake for santosh";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, stylix, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {

        santosh = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/helios/configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager

            {
              home-manager = {
                sharedModules = [ nixvim.homeModules.nixvim ];
                useGlobalPkgs = true;
                useUserPackages = true;
                users.santosh = import ./homes/santosh/home.nix;
              };
            }
          ];
          specialArgs = { inherit inputs; };
        };

      };
    };
}
