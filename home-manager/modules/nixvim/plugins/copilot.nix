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
            next = "<C-j>";
            prev = "<C-k>";
            accept_line = "<C-]>";
            assept_word = "<C-[>";
          };
        };
        filetypes = {
          "." = false;
          cvs = false;
          gitcommit = true;
          gitrebase = true;
          help = false;
          hgcommit = false;
          markdown = true;
          svn = false;
          yaml = false;
          rs = true;
          js = true;
          html = true;
          nix = true;
          bash = true;
          ts = true;
          lua = true;
          python = true;
        };
      };
    };
  };
}
