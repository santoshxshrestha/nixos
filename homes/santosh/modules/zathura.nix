{
  programs.zathura = {
    enable = true;
    options = {
      # default-bg = "#1a1b26";
      default-bg = "rgba(0,0,0,0.8)";
      default-fg = "#c0caf5";

      recolor = true;

      # text should be some what easy on eyes
      recolor-darkcolor = "#c0caf5";

      # transparent color rather then white backround color
      recolor-lightcolor = "rgba(0,0,0,0)";

      # copy selections to the system cliboard
      selection-clipboard = "clipboard";
    };
  };
}
