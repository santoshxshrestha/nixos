{ config, lib, ... }: {
  options = {
    oil.enable = lib.mkEnableOption "Enable oil.nvim plugin for nixvim";
  };
  config = lib.mkIf config.oil.enable {
    programs.nixvim.plugins.oil = {
      enable = true;
      settings = {
        default_file_explorer = false;
        win_options = { wrap = true; };
        skip_confirm_for_simple_edits = true;
        use_default_keymaps = true;
        view_options = {
          show_hidden = true;
          natural_order = true;
        };
      };
    };
  };
}
