{
  config,
  lib,
  ...
}:
{
  options = {
    ufo.enable = lib.mkEnableOption "Enalble ufo.nvim (A Neovim plugin to improve code folding)";
  };
  config = lib.mkIf config.ufo.enable {
    programs.nixvim.plugins.nvim-ufo = {
      enable = true;
    };
  };
}
