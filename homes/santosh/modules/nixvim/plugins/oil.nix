{
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      skip_confirm_for_simple_edits = true;
      use_default_keymaps = true;
      view_options = {
        show_hidden = true;
        natural_order = true;
      };
    };
  };
}
