{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>sf";
      mode = [ "n" ];
      options = { desc = "Search files"; };
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

  programs.nixvim.lsp.keymaps =

    [
      {
        key = "gd";
        lspBufAction = "definition";
      }
      {
        key = "gD";
        lspBufAction = "references";
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
      }
      {
        key = "gi";
        lspBufAction = "implementation";
      }
      {
        key = "K";
        lspBufAction = "hover";
      }
      {
        action = "<CMD>Lspsaga hover_doc<Enter>";
        key = "K";
      }
    ];
}
