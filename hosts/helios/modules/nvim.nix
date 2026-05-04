{
  pkgs,
  ...
}:
{
  programs.mnw = {
    enable = true;
    initLua = ''
      require("myconfig")
    '';
    plugins = {
      start = [
        pkgs.vimPlugins.oil-nvim
      ];

      dev.myconfig = {
        pure = ./nvim;
        impure =
          # This is a hack it should be a absolute path
          # here it'll only work from this directory
          "/' .. vim.uv.cwd()  .. '/nvim";
      };
    };
  };

}
