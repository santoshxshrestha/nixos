{
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.twilight-official
  ];
  programs.zen-browser = {
    enable = true;
  };
}
