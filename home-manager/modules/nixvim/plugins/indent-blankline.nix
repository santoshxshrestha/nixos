{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = "│";
        tab_char = "│"; # Character for tab indentation
      };
      whitespace = {
        highlight =
          [ "Whitespace" "NonText" ]; # Highlight groups for whitespace
      };
      scope = {
        show_start = false;
        show_end = false;
        show_exact_scope = false;
        highlight = [ "Function" "Label" ]; # Highlight groups for scope
      };
    };
  };
}
