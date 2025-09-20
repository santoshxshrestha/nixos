{ config, lib, ... }: {
  options = {
    which-key.enable = lib.mkEnableOption "Enable which-key plugin for nixvim";
  };
  config = lib.mkIf config.which-key.enable {
    programs.nixvim.plugins.which-key = {
      enable = true;
      settings = {
        win = { wo.winblend = 100; };
        # preset = "modern";
        preset = "helix";
        plugins = {
          marks = true;
          registers = true;
        };
      };
    };
  };
}
