{ config, lib, ... }:
{
  options = {
    noice.enable = lib.mkEnableOption "Enable noice.nvim plugin for nixvim";
  };
  config = lib.mkIf config.noice.enable {
    programs.nixvim.plugins.noice = {
      enable = true;
      settings = {
        cmdline.enabled = true;
        notify.enabled = false;
        lsp = {
          hover.enabled = true;
          message.enabled = true;
          signature.enabled = true;
          progress.enabled = false;
        };
      };
    };
  };
}
