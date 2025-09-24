{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    rhubarb-vim.enable = lib.mkEnableOption "Enable rhubarb.vim plugin for nixvim";
  };

  config = lib.mkIf config.rhubarb-vim.enable {
    programs.nixvim = {
      extraPlugins = [
        (pkgs.vimUtils.buildVimPlugin {
          pname = "rhubarb";
          version = "unstable-5496d7c";
          src = pkgs.fetchFromGitHub {
            owner = "tpope";
            repo = "vim-rhubarb";
            rev = "5496d7c94581c4c9ad7430357449bb57fc59f501";
            sha256 = "sha256-x2E2oIqW2BPUzmu5KeEUFFeH5+PXHRbjt8obIgDzYkc=";

          };
        })
      ];
    };
  };
}
