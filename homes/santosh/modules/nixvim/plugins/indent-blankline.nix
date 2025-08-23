{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = { char = "│"; };
      scope = {
        show_start = false;
        show_end = false;
        show_exact_scope = false;
      };
    };
  };
}
