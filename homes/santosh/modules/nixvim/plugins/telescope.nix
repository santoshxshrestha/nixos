{ config, lib, ... }: {
  options = {
    telescope.enable = lib.mkEnableOption "Enable telescope plugin for nixvim";
  };
  config = lib.mkIf config.telescope.enable {
    programs.nixvim.plugins.telescope = {
      enable = true;

      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            fuzzy = true;
            override_generic_sorter = true;
            override_file_sorter = true;
            case_mode = "smart_case";
          };
        };
      };
    };
  };
}
