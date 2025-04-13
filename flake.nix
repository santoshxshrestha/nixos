{
	description = "flake for santosh";

	inputs = {
		nixpkgs = {
			url = "github:NixOS/nixpkgs/nixos-unstable";
			home-manager.url = "github:nix-community/home-manager/master";
			home-manager.inputs.nixpkgs.follows = "nixpkgs"; 
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }:
		let 
		lib = nixpkgs.lib ;
		system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system}";
	in{

		nixosConfigurations = {
			santosh = nixpkgs.lib.nixosSystem {
			inherit system;
				modules = [
					./configuration.nix
				];
			};
		};

		homeConfigurations = {
			santosh = home-manager.lib.homeManagerConfiguration{
				inherit pkgs;
				modules = [
					./home.nix
				];
			};
		};
	};
}
