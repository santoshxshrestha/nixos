{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "vimlinuz";
        email = "vimlinuz@gmail.com";
      };
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
