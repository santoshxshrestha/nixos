{
	description = "flake for santosh";

	inputs = {
#	hypland.url = "github:hyprwm/Hyprland";

#	hyprland-plugins = {
#		url = "github:hyprwm/hyprland-plugins";
#		follows = "hyprland";
#	};
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
		nixpkgs = {
			url = "github:NixOS/nixpkgs/nixos-unstable";
		};

			home-manager.url = "github:nix-community/home-manager";
			home-manager.inputs.nixpkgs.follows = "nixpkgs"; 
	};

	outputs = inputs@{ self, nixpkgs, home-manager, ... }:
		let 
		lib = nixpkgs.lib ;
	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
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
