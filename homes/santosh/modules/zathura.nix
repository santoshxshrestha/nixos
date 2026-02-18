{
  programs.zathura = {
    enable = true;
    options = {
      # default-bg = "#1a1b26";
      default-bg = "rgba(0,0,0,0.8)";
      default-fg = "#c0caf5";

      recolor = true;

      # recolor-darkcolor = "#FFFFFF";
      recolor-lightcolor = "rgba(0,0,0,0)";

      # copy selections to the system cliboard
      selection-clipboard = "clipboard";
    };
  };
}
