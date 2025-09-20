{ config, lib, ... }: {
  options = {
    snacks.enable = lib.mkEnableOption "Enable snacks.nvim plugin for nixvim";
  };
  config = lib.mkIf config.snacks.enable {
    programs.nixvim.plugins.snacks = {
      enable = true;
      settings = {
        notifier = {
          enabled = false;
          style = "fancy";
        };
        bigfile = {
          enabled = true;
          notify = true;
        };
        quickfile = { enabled = true; };
        statuscolumn.enabled = true;
      };
    };
  };
}
