{
  programs.nixvim.plugins.cmp-spell = { enable = true; };
  programs.nixvim.plugins.cmp-cmdline = { enable = true; };
  programs.nixvim.plugins.cmp-nvim-lsp-signature-help = { enable = true; };
  programs.nixvim.plugins.cmp-async-path = { enable = true; };
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "spell"; }
          { name = "async_path"; }
        ];
        snippet = {
          expand =
            "function(args) require('luasnip').lsp_expand(args.body) end";
        };
        window = {
          documentation = {
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            winhighlight =
              "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:None";
          };
          completion = {
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            winhighlight =
              "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:None";
            scrollbar = false;
          };
        };

        mapping = {
          "<C-l>" =
            "cmp.mapping(function(fallback) local luasnip = require('luasnip') if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() else fallback() end end, {'i', 's'})";
          "<C-h>" =
            "cmp.mapping(function(fallback) local luasnip = require('luasnip') if luasnip.locally_jumpable(-1) then luasnip.jump(-1) else fallback() end end, {'i', 's'})";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";

          "<C-Space>" = "cmp.mapping.complete()";

          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";

          # here this one is for response of pressing the enter
          # "<CR>" = "cmp.mapping.confirm({ select = true })";
          # "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          # "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
    luasnip.enable = true;
  };
}
