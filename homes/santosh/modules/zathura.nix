{
  programs.zathura = {
    enable = true;
    options = {
      # default-bg = "#1a1b26";
      default-bg = "rgba(0,0,0,0.8)";

      # default-fg = "#C5C8C6";
      default-fg = "#C6C1B4";

      recolor = true;

      # text should be some what easy on eyes
      # recolor-darkcolor = "#C5C8C6";
      recolor-darkcolor = "#C6C1B4";

      # transparent color rather then white backround color
      recolor-lightcolor = "rgba(0,0,0,0)";
      # copy selections to the system cliboard
      selection-clipboard = "clipboard";
    };
  };
}
