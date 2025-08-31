let focusMode = true;
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

    # ╭───────────────────────────────────────────────╮
    # │ Ai Plugins                                    │
    # ╰───────────────────────────────────────────────╯
    ./plugins/copilot.nix
    ./plugins/avante.nix

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
    ./plugins/colorschemes.nix
    ./plugins/gitsigns.nix
  ] ++ (if focusMode then
    [ ]
  else [
    # Full mode: all overwelming plugins
    ./plugins/lualine.nix
    ./plugins/which-key.nix
    ./plugins/oil.nix
    ./plugins/alpha.nix
    ./plugins/indent-blankline.nix
  ]);

  programs.nixvim = {
    enable = true;
    plugins = { };
  };
}
