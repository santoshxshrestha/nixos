let focusMode = false;
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

    # ╭───────────────────────────────────────────────╮
    # │ UI Plugins                                    │
    # ╰───────────────────────────────────────────────╯
    # ./plugins/ui.nix
    ./plugins/gitsigns.nix
    ./plugins/colorschemes.nix
    ./plugins/snacks.nix

  ] ++ (if focusMode then
    [ ]
  else [
    # Full mode: all overwelming plugins
    ./plugins/lualine.nix
    ./plugins/noice.nix
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
