{
  imports = import ./modules/default.nix;

  # ╭───────────────────────────────────────────────╮
  # │ UI and Appearance Plugins                     │
  # ╰───────────────────────────────────────────────╯
  alpha.enable = false;
  colorschemes.enable = true;
  indent-blankline.enable = false;
  lualine.enable = true;
  notify.enable = true;
  snacks.enable = true;

  # ╭───────────────────────────────────────────────╮
  # │ AI and Automation Plugins                     │
  # ╰───────────────────────────────────────────────╯
  avante.enable = false;
  copilot-lua.enable = false;
  copilot-chat.enable = false;
  justu.enable = false;

  # ╭───────────────────────────────────────────────╮
  # │ Git and Navigation Plugins                    │
  # ╰───────────────────────────────────────────────╯
  cord.enable = false;
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
  oil.enable = false;
  surround.enable = true;
  telescope.enable = true;
  treesitter.enable = true;
  which-key.enable = false;
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
