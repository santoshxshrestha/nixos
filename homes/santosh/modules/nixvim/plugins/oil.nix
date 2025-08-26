{
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
}
