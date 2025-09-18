let
  focusMode = false;
  aiIntegration = true;
in
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

  ]
  ++ (
    if focusMode then
      [ ]
    else
      [
        # ╭───────────────────────────────────────────────╮
        # │ Full mode: all overwhelming plugins           │
        # ╰───────────────────────────────────────────────╯
        # ./plugins/lualine.nix
        ./plugins/which-key.nix
        ./plugins/oil.nix
        ./plugins/alpha.nix
        ./plugins/indent-blankline.nix
        ./plugins/notify.nix
        ./plugins/cord.nix
        # ./plugins/noice.nix
      ]
  )
  ++ (
    if aiIntegration then
      [
        # ╭───────────────────────────────────────────────╮
        # │ Ai Plugins                                    │
        # ╰───────────────────────────────────────────────╯
        ./plugins/copilot.nix
        ./plugins/avante.nix
        ./plugins/copilot-chat.nix
      ]
    else
      [ ]
  );

  programs.nixvim = {
    enable = true;
    editorconfig = {
      enable = true;
    };
    plugins = { };
  };
}
