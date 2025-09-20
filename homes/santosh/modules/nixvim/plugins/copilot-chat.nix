{ config, lib, ... }: {
  options = {
    copilot-chat.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable copilot-chat.nvim (ChatGPT integration for nvim)";
    };
  };
  config = lib.mkIf config.copilot-chat.enable {
    programs.nixvim.plugins.copilot-chat = {
      enable = true;
      settings = {
        model = "gpt-4o";
        window = {
          height = 0.9;
          width = 0.9;
          border = "rounded";
          # title = "[ ]";
          title = "   AutoPilot ";
          # replace is also a good option
          layout = "float";
        };
      };
    };
  };
}
