{ config, lib, ... }:
{
  options = {
    autocommands.enable = lib.mkEnableOption "Enable/disable custom autocommands";
  };

  config = lib.mkIf config.autocommands.enable {
    programs.nixvim.config.autoCmd = [
      {
        # Highlight yank text
        event = "TextYankPost";
        pattern = "*";
        command = "lua vim.highlight.on_yank{timeout=50}";
      }
    ];
  };
}
