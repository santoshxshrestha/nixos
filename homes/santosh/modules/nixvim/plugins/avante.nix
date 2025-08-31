{
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "copilot";
      model = "gpt-4";
      window = {
        border = "rounded";
        wrapping = true;
      };
    };
  };
}
