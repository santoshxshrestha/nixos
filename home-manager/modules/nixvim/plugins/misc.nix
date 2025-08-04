{
  programs.nixvim.plugins = {
    # Markdown renderer
    render-markdown = {
      enable = true;
      settings = { };
    };
    lspsaga = {
      enable = true;
      ui = { border = "rounded"; };
      lightbulb = { enable = false; };
    };

    # Undotree by jiaoshijie
    undotree = { enable = true; };

    # Tmux & split window navigation
    # vim-tmux-navigator = { enable = true; };

    # Detect tabstop and shiftwidth automatically
    # vim-sleuth = { enable = true; };

    # Powerful Git integration for Vim
    fugitive = { enable = true; };

    # GitHub integration for vim-fugitive
    #rhubarb = { enable = true; };

    # Hints keybinds
    which-key = { enable = true; };

    # Autoclose parentheses, brackets, quotes, etc.
    nvim-autopairs = { enable = true; };

    # Highlight todo, notes, etc in comments
    todo-comments = {
      enable = true;
      settings = { signs = false; };
    };

    # Sets up nvim lsp for the rust_analyzer automatically
    # rustaceanvim = { enable = true; };

    # High-performance color highlighter
    colorizer = { enable = true; };
  };
}
