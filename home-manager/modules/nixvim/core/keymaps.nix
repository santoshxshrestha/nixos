{
  programs.nixvim = {
    # local and gglobals leader keys
    globals.mapleader = " ";
    globals.maplocalleader = " ";
  };

  programs.nixvim.keymaps = [
    # keep last yanked when pasting over some thing
    # nix is messing with it because of the parenthesis 
    # {
    #   action = ''"_dp'';
    #   key = "p";
    #   mode = [ "n" ];
    #   options = {
    #     silent = true;
    #     noremap = true;
    #   };
    # }
    # stay in indent mode
    {
      action = ">gv";
      key = ">";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      action = "<gv";
      key = "<";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };
    }

    # toggle line wrapping
    {
      action = "<cmd>set wrap!";
      key = "<leader>lw";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };
    }
    # find and center 
    {
      action = "nzzzv";
      key = "n";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      action = "nzzzv";
      key = "N";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };

    }
    # resize with arrow
    {
      action = "<cmd>resize -2<CR>";
      key = "<Up>";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      action = "<cmd>resize +2<CR>";
      key = "<Down>";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      action = "<cmd>Vertical resize -2<CR>";
      key = "<Left>";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      action = "<cmd>Vertical resize +2<CR>";
      key = "<Right>";
      mode = [ "n" ];
      options = {
        silent = true;
        noremap = true;
      };
    }
    # Vertical scroll and center cursor
    {
      action = "<C-u>zz";
      key = "<C-u>";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = "<C-d>zz";
      key = "<C-d>";
      mode = [ "n" ];
      options = { silent = true; };
    }
    # save file without auto-formatting
    {
      action = "<cmd>noautocmd w<CR>";
      key = "<leader>sn";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "save file without auto-formatting";
      };
    }
    # delete single character without copying into register
    {
      action = ''"_x'';
      key = "x";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
      };
    }
    # keymaps for fugutive
    {
      action = "<cmd>Git<CR>";
      key = "<leader>gs";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git Status";
      };
    }
    {
      action = "<cmd>Git commit<CR>";
      key = "<leader>gc";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git Commit";
      };
    }
    {
      action = "<cmd>Git add .<CR>";
      key = "<leader>ga";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git Add All changes";
      };
    }
    {
      action = "<cmd>Gwrite<CR>";
      key = "<leader>gw";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git Write";
      };
    }
    {
      action = "<cmd>Gdiff<CR>";
      key = "<leader>gd";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git Diff";
      };
    }
    {
      action = "<cmd>Gclog<CR>";
      key = "<leader>gl";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git Log";
      };
    }
    {
      action = "<cmd>Git blame<CR>";
      key = "<leader>gb";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git Blame";
      };
    }
    {
      action = "<cmd>Git push<CR>";
      key = "<leader>gp";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git Push";
      };
    }
    {
      action = "<cmd>Git fetch<CR>";
      key = "<leader>gf";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "git Fetch";
      };
    }
    {
      action = "<cmd>Gread<CR>";
      key = "<leader>gr";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "Git: restore buffer to HEAD";
      };
    }
    # key maps for undoo tree
    {
      action = "<cmd>UndotreeToggle<CR>";
      key = "<leader>u";
      mode = [ "n" ];
      options = { desc = "Toggle undo tree"; };
    }
    # key map for treesitter-context
    {
      action.__raw = ''
        require('treesitter-context').go_to_context
      '';
      key = "[c";
      mode = [ "n" ];
      options = {
        desc = "Go to context";
        silent = true;
      };
    }
    # splits managements
    {
      action = "<cmd>vsplit<CR>";
      key = "<leader>v";
      mode = [ "n" ];
      options = {
        desc = "Split window vertically";
        silent = true;
      };
    }
    {
      action = "<cmd>split<CR>";
      key = "<leader>o";
      mode = [ "n" ];
      options = {
        desc = "Split window vertically";
        silent = true;
      };
    }
    {
      action = "<cmd>close<CR>";
      key = "<leader>q";
      mode = [ "n" ];
      options = {
        desc = "Close current split";
        silent = true;
      };
    }
    {
      action = "<cmd>only<CR>";
      key = "<leader>x";
      mode = [ "n" ];
      options = {
        desc = "Close all other splits";
        silent = true;
      };
    }
    # telescope key maps
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>sf";
      mode = [ "n" ];
      options = { desc = "Search files"; };
    }
    # {
    #   action.__raw = ''
    #     function()
    #     local buildin = require('telescope.buildin')
    #         builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    #            winblend = 0,
    #            previewer = true,
    #          })
    #        end'';
    #   key = "<leader>/";
    #   mode = [ "n" ];
    #   options = { desc = "[/] Fuzzily search in current buffer"; };
    # }
    # {
    #   action.__raw = ''
    #     function()
    #     local buildin = require('telescope.buildin')
    #            builtin.live_grep {
    #             grep_open_files = true,
    #             prompt_title = 'Live Grep in Open Files',
    #           }
    #         end'';
    #   key = "<leader>s/";
    #   mode = [ "n" ];
    #   options = { desc = "[S]earch [/] in Open Files"; };
    # }
    {
      action = "<cmd>Telescope help_tags<CR>";
      key = "<leader>sh";
      mode = [ "n" ];
      options = { desc = "Help_tags"; };
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>sg";
      mode = [ "n" ];
      options = { desc = "Search using live grep"; };
    }
    {
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader><leader>";
      mode = [ "n" ];
      options = { desc = "List buffers"; };
    }
    {
      action = "<cmd>Telescope<CR>";
      key = "<leader>ss";
      mode = [ "n" ];
      options = { desc = " help tags"; };
    }
    {
      action.__raw = ''
        function()
        if vim.bo.filetype == 'netrw' then 
            vim.cmd('bdelete')
        else 
            vim.cmd('Explore')
                end
                end
      '';
      key = "<leader>e";
      mode = [ "n" ];
      options = {
        noremap = true;
        silent = true;
        desc = "toggle netrw";
      };
    }

    # comment.nvim key maps
    {
      key = "<C-_>";
      action.__raw = "require('Comment.api').toggle.linewise.current";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      key = "<C-c>";
      action.__raw = "require('Comment.api').toggle.linewise.current";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      key = "<C-/>";
      action.__raw = "require('Comment.api').toggle.linewise.current";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Visual mode - toggle selected lines
    {
      key = "<C-_>";
      action =
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      key = "<C-c>";
      action =
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      key = "<C-/>";
      action =
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # harpoon key maps
    {
      mode = "n";
      key = "<leader>H";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<leader>h";
      action.__raw =
        "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    }

    {
      mode = "n";
      key = "<leader>1";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<leader>2";
      action.__raw = "function() require'harpoon':list():select(2) end";
    }
    {
      mode = "n";
      key = "<leader>3";
      action.__raw = "function() require'harpoon':list():select(3) end";
    }
    {
      mode = "n";
      key = "<leader>4";
      action.__raw = "function() require'harpoon':list():select(4) end";
    }
    {
      mode = "n";
      key = "<leader>5";
      action.__raw = "function() require'harpoon':list():select(5) end";
    }

    {
      mode = "n";
      key = "<leader>j";
      action.__raw = "function() require('harpoon'):list():next() end";
    }
    {
      mode = "n";
      key = "<leader>k";
      action.__raw = "function() require('harpoon'):list():previous() end";
    }
  ];

  # lsp with lsp saga key maps
  programs.nixvim.lsp.keymaps =

    [
      {
        key = "gd";
        lspBufAction = "definition";
        options = { desc = "Go to defination"; };
      }
      {
        key = "gD";
        lspBufAction = "references";
        options = { desc = "References"; };
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
        options = { desc = "Type defination"; };
      }
      {
        key = "gi";
        lspBufAction = "implementation";
        options = { desc = "Got to implementation"; };
      }
      # {
      #   key = "K";
      #   lspBufAction = "hover";
      # }
      {
        action = "<CMD>Lspsaga hover_doc<Enter>";
        key = "K";
        options = { desc = "Hover docs"; };
      }
      {
        action = "<CMD>Lspsaga rename<Enter>";
        key = "<leader>rn";
        options = { desc = "Rename the variable"; };
      }
      {
        action = "<CMD>Lspsaga code_action<Enter>";
        key = "<leader>ca";
        options = { desc = "Code action"; };
      }
      {
        action = "<CMD>Lspsaga diagnostic_jump_next<Enter>";
        key = "]d";
        options = { desc = "Jump to next diagnostic "; };
      }
      {
        action = "<CMD>Lspsaga diagnostic_jump_prev<Enter>";
        key = "[d";
        options = { desc = "Jump to previous diagnostic "; };
      }
    ];
}
