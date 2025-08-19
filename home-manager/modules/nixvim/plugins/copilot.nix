{
  programs.nixvim.plugins = {
    copilot-chat = { enable = true; };
    copilot-cmp = { enable = true; };
    copilot-lua = {
      enable = true;
      settings = {
        panel = {
          enabled = false;
          auto_refresh = false;
        };
        suggestion = {
          enable = true;
          auto_trigger = true;
          debounce = 90;
          # If you’re using a completion plugin (like nvim-cmp), Copilot’s ghost text disappears while the completion menu is visible — avoids clashing with your completion popup.
          hide_during_completion = true;
          keymap = {
            accept = "<Tab>";
            accept_line = false;
            accept_word = false;
          };
        };
        filetypes = {
          "." = false;
          cvs = false;
          gitcommit = false;
          gitrebase = false;
          help = false;
          hgcommit = false;
          markdown = false;
          svn = false;
          yaml = false;
          rs = false;
          js = false;
          html = false;
          nix = false;
        };
      };
    };
  };
}
