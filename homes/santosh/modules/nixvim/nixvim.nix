{
  imports = import ./modules/default.nix;

  # ╭───────────────────────────────────────────────╮
  # │ UI and Appearance Plugins                     │
  # ╰───────────────────────────────────────────────╯
  alpha.enable = true;
  colorschemes.enable = true;
  indent-blankline.enable = false;
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
    editorconfig = {
      enable = true;
    };
  };
}
