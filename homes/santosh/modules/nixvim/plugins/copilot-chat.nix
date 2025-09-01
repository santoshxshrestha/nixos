{
  programs.nixvim.plugins.copilot-chat = {
    enable = true;
    settings = {
      model = "gpt-4o";
      window = {
        height = 0.9;
        width = 0.9;
        border = "rounded";
        # title = "[ ]";
        title = "   AutoPilot ";
        # replace is also a good option
        layout = "float";
      };
    };
  };
}
