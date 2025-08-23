{
  programs.nixvim.plugins = {
    copilot-chat = {
      enable = true;
      settings = {
        model = "gpt-5";
        window = {
          height = 0.8;
          width = 0.9;
          border = "rounded";
          title = "what on earth";
          # replace is also a good option
          layout = "float";
        };
      };
    };
    copilot-lua = {
      enable = true;
      settings = {
        panel = {
          enabled = false;
          auto_refresh = false;
        };
        suggestion = {
          enable = false;
          auto_trigger = false;
          debounce = 90;
          # If you’re using a completion plugin (like nvim-cmp), Copilot’s ghost text disappears while the completion menu is visible — avoids clashing with your completion popup.
          hide_during_completion = true;
          keymap = {
            accept = false;
            accept_word = false;
            accept_line = false;
            next = false;
            prev = false;
            dismiss = false;
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
