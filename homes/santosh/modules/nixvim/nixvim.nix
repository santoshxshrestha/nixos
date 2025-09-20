let
  focusMode = false;
  aiIntegration = true;
in {
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
    ./core/anim_copilot.nix

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

  alpha.enable = true;
  avante.enable = true;
  colorschemes.enable = true;
  comment.enable = true;
  copilot-chat.enable = true;
  copilot-lua.enable = true;
  cord.enable = true;
  gitsigns.enable = true;
  harpoon.enable = true;
  indent-blankline.enable = true;
  lualine.enable = true;
  misc.enable = true;
  notify.enable = true;
  noice.enable = true;
  none-ls.enable = true;
  oil.enable = true;
  rhubarb-vim.enable = true;
  snacks.enable = true;
  surround.enable = true;
  telescope.enable = true;
  treesitter.enable = true;
  which-key.enable = true;

  programs.nixvim = {
    enable = true;
    editorconfig = { enable = true; };
    plugins = { };
  };
}
