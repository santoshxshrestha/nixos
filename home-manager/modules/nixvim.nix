{ config, pkgs, ... }: {
	programs.nixvim = {
		enable = true;
		colorschemescatppuccin.enable = true;
		plugins.lualine.enable = true;
	}
		       }
