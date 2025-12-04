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

      # if it works don't touch it
      {
        event = [
          "WinResized"
        ];
        pattern = "*";
        command = "lua
        if vim.env.TMUX then
          vim.opt.laststatus = 0
        end
          ";
      }
    ];
  };
}
