{ config, ... }: {
  imports = [
    #core
    ./core/keymaps.nix
    ./core/lsp.nix
    ./core/autocompletion.nix
    ./core/code-runner.nix
    ./core/opts.nix
    ./core/autocommands.nix

    #plugins
    ./plugins/harpoon.nix
    ./plugins/surround.nix
    ./plugins/none-ls.nix
    ./plugins/comment.nix
    ./plugins/indent-blankline.nix
    ./plugins/gitsigns.nix
    ./plugins/lualine.nix
    ./plugins/misc.nix
    ./plugins/treesitter.nix
    ./plugins/telescope.nix
    ./plugins/colorschemes.nix
    ./plugins/alpha.nix
    ./plugins/copilot.nix
    ./plugins/noice.nix
    ./plugins/which-key.nix
    ./plugins/oil.nix
  ];
  programs.nixvim = {
    enable = true;
    plugins = { };
  };
}
