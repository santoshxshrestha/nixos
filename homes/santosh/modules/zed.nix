{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "rust"
    ];
    userSettings = {
      features = {
        copilot = true;
      };
      vim_mode = true;
    };
  };
}
