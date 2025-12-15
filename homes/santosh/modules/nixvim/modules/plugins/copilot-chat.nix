{ config, lib, ... }:
{
  options = {
    copilot-chat.enable = lib.mkEnableOption "Enable copilot-chat plugin for nixvim";
  };

  config = lib.mkIf config.copilot-chat.enable {
    programs.nixvim.plugins.copilot-chat = {
      enable = true;
      settings = {
        answer_header = "## Ai ";
        question_header = "## santosh ";
        show_help = false;
        auto_follow_cursor = true;
        highlight_selection = false;
        model = "gpt-4o";
        window = {
          height = 0.9;
          width = 0.9;
          border = "rounded";
          # title = "[ ]";
          # title = "   AutoPilot ";
          # want nothing in the title bar so using this unicode character
          title = "─";
          # replace is also a good option
          layout = "float";
        };
      };
    };
  };
}
