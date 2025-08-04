{
  programs.nixvim.opts = {
    # Make line numbers default (default: false)
    number = true;
    # Set relative numbered lines (default: false)
    relativenumber = true;
    # Sync clipboard between OS and Neovim (default: '')
    clipboard = "unnamedplus";
    # Display lines as one long line (default: true)
    wrap = false;
    # Companion to wrap, don't split words (default: false)
    linebreak = true;
    # Enable mouse mode (default: '')
    mouse = "a";
    # Copy indent from current line when starting new one (default: true)
    autoindent = true;
    # Case-insensitive searching UNLESS \C or capital in search (default: false)
    ignorecase = true;
    # Smart case (default: false)
    smartcase = true;
    # The number of spaces inserted for each indentation (default: 8)
    shiftwidth = 4;
    # Insert n spaces for a tab (default: 8)
    tabstop = 4;
    # Number of spaces that a tab counts for while performing editing operations (default: 0)
    softtabstop = 4;
    # Convert tabs to spaces (default: false)
    expandtab = true;
    # Minimal number of screen lines to keep above and below the cursor (default: 0)
    scrolloff = 4;
    # Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
    sidescrolloff = 8;
    # Highlight the current line (default: false)
    cursorline = false;
    # Force all horizontal splits to go below current window (default: false)
    splitbelow = true;
    # Force all vertical splits to go to the right of current window (default: false)
    splitright = true;
    # Set highlight on search (default: true)
    hlsearch = false;
    # We don't need to see things like -- INSERT -- anymore (default: true)
    showmode = false;
    # Set termguicolors to enable highlight groups (default: false)
    termguicolors = true;
    # Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
    whichwrap = "bs<>[]hl";
    # Set number column width to 4 (default: 4)
    numberwidth = 4;
    # Creates a swapfile (default: true)
    swapfile = false;
    # Make indenting smarter again (default: false)
    smartindent = true;
    # '2' Always show tabs, '1' show if more than one tab, '0' never show (default: 1)
    showtabline = 0;
    # Allow backspace on (default: 'indent,eol,start')
    backspace = "indent,eol,start";
    # Pop up menu height (default: 0)
    pumheight = 10;
    # So that `` is visible in markdown files (default: 1)
    conceallevel = 0;
    # Keep signcolumn on by default (default: 'auto')
    signcolumn = "yes";
    # The encoding written to a file (default: 'utf-8')
    fileencoding = "utf-8";
    # More space in the Neovim command line for displaying messages (default: 1)
    cmdheight = 1;
    # Enable break indent (default: false)
    breakindent = true;
    # Decrease update time (default: 4000)
    updatetime = 250;
    # Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
    #timeoutlen = 300;
    # Creates a backup file (default: false)
    backup = false;
    # If a file is being edited by another program it is not allowed to be edited (default: true)
    writebackup = false;
    # Save undo history (default: false)
    undofile = true;
    # Set completeopt to have a better completion experience (default: 'menu,preview')
    completeopt = "menuone,noselect";
  };

  # Additional options that need special handling in NixVim
  programs.nixvim.extraConfigLua = ''
    -- Don't give |ins-completion-menu| messages (default: does not include 'c')
    vim.opt.shortmess:append('c')

    -- Hyphenated words recognized by searches (default: does not include '-')
    vim.opt.iskeyword:append('-')

    -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth',
    -- hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

    -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
    vim.opt.runtimepath:remove('/usr/share/vim/vimfiles')
  '';
}
