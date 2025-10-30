{
  imports = import ./modules/default.nix;

  # ╭───────────────────────────────────────────────╮
  # │ UI and Appearance Plugins                     │
  # ╰───────────────────────────────────────────────╯
  alpha.enable = false;
  colorschemes.enable = true;
  indent-blankline.enable = false;
  lualine.enable = false;
  notify.enable = false;
  snacks.enable = true;
  vim-tpipeline.enable = false;

  # ╭───────────────────────────────────────────────╮
  # │ AI and Automation Plugins                     │
  # ╰───────────────────────────────────────────────╯
  avante.enable = false;
  copilot-lua.enable = true;
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
  formatter.enable = true;
  noice.enable = false;
  oil.enable = false;
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
