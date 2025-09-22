{
  imports = [
    # ╭───────────────────────────────────────────────╮
    # │ Core Configuration Modules (Always Enabled)   │
    # ╰───────────────────────────────────────────────╯
    ./core/keymaps.nix
    ./core/lsp.nix
    ./core/autocompletion.nix
    ./core/terminal.nix
    ./core/opts.nix
    ./core/autocommands.nix
    ./core/justu.nix

    # ╭───────────────────────────────────────────────╮
    # │ Essential Functional Plugins                  │
    # ╰───────────────────────────────────────────────╯
    ./plugins/harpoon.nix
    ./plugins/surround.nix
    ./plugins/none-ls.nix
    ./plugins/comment.nix
    ./plugins/misc.nix
    ./plugins/treesitter.nix
    ./plugins/telescope.nix
    ./plugins/rhubarb.nix

    # ╭───────────────────────────────────────────────╮
    # │ UI Plugins                                    │
    # ╰───────────────────────────────────────────────╯
    ./plugins/gitsigns.nix
    ./plugins/colorschemes.nix
    ./plugins/snacks.nix
    # ╭───────────────────────────────────────────────╮
    # │ Full mode: all overwhelming plugins           │
    # ╰───────────────────────────────────────────────╯
    ./plugins/lualine.nix
    ./plugins/which-key.nix
    ./plugins/oil.nix
    ./plugins/alpha.nix
    ./plugins/indent-blankline.nix
    ./plugins/notify.nix
    ./plugins/cord.nix
    ./plugins/noice.nix
    # ╭───────────────────────────────────────────────╮
    # │ Ai Plugins                                    │
    # ╰───────────────────────────────────────────────╯
    ./plugins/copilot.nix
    ./plugins/avante.nix
    ./plugins/copilot-chat.nix
  ];
  # ╭───────────────────────────────────────────────╮
  # │ UI and Appearance Plugins                     │
  # ╰───────────────────────────────────────────────╯
  alpha.enable = true;
  colorschemes.enable = true;
  indent-blankline.enable = true;
  lualine.enable = true;
  notify.enable = true;
  snacks.enable = true;

  # ╭───────────────────────────────────────────────╮
  # │ AI and Automation Plugins                     │
  # ╰───────────────────────────────────────────────╯
  avante.enable = false;
  copilot-lua.enable = true;
  copilot-chat.enable = true;
  justu.enable = true;

  # ╭───────────────────────────────────────────────╮
  # │ Git and Navigation Plugins                    │
  # ╰───────────────────────────────────────────────╯
  cord.enable = true;
  gitsigns.enable = true;
  harpoon.enable = true;
  rhubarb-vim.enable = true;

  # ╭───────────────────────────────────────────────╮
  # │ Core Functionality Plugins                    │
  # ╰───────────────────────────────────────────────╯
  autocommands.enable = true;
  lsp.enable = true;
  autocompletion.enable = true;
  comment.enable = true;
  misc.enable = true;
  none-ls.enable = true;
  noice.enable = true;
  oil.enable = true;
  surround.enable = true;
  telescope.enable = true;
  treesitter.enable = true;
  which-key.enable = true;
  terminal.enable = true;
  opts.enable = true;
  keymaps.enable = true;

  programs.nixvim = {
    enable = true;
    editorconfig = { enable = true; };
    plugins = { };
  };
}
