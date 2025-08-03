{
  programs.nixvim.plugins.harpoon2 = {
    enableTelescope = true;
    enable = true;
    
    keymaps = {
      addFile = "<leader>H";
      toggleQuickMenu = "<leader>h";
      navNext = "<leader>j";
      navPrev = "<leader>k";
      
      navFile = {
        "1" = "<leader>1";
        "2" = "<leader>2"; 
        "3" = "<leader>3";
        "4" = "<leader>4";
        "5" = "<leader>5";
      };
      
      gotoTerminal = "<C-p>";
    };
    
    settings = {
      save_on_toggle = true;
      sync_on_ui_close = false;
      key = {
        save_on_toggle = true;
      };
    };
    
    menu = {
      width = "vim.api.nvim_win_get_width(0) - 4";
      height = 10;
    };
  };
}
