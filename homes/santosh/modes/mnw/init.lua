vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.cursorcolumn = false
vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.whichwrap = "bs<>[]hl"
vim.opt.numberwidth = 4
vim.opt.swapfile = false
vim.opt.smartindent = false
vim.opt.showtabline = 0
vim.opt.backspace = "indent,eol,start"
vim.opt.pumheight = 10
vim.opt.conceallevel = 0
vim.opt.signcolumn = "yes"
vim.opt.fileencoding = "utf-8"
vim.opt.cmdheight = 1
vim.opt.breakindent = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.laststatus = 0
vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "auto"
vim.opt.fillchars = {
  eob = " ",
  fold = "─",
  foldopen = "▾",
  foldclose = "▸",
  foldsep = "│",
  foldinner = " ",
  wbr = "─",
  msgsep = "─",
  horiz = "─",
  horizup = "│",
  horizdown = "│",
  vertright = "│",
  vertleft = "│",
  verthoriz = "│",
}

vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircmd = "cp -r"

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 50 })
  end,
})

vim.api.nvim_create_autocmd("WinResized", {
  pattern = "*",
  callback = function()
    if vim.env.TMUX then
      vim.opt.laststatus = 0
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or "#000000"
    vim.api.nvim_set_hl(0, "CopilotChatSeparator", { fg = normal, bg = "NONE" })
  end,
})

local run = {}

function run.open_float_term(cmd)
  cmd = cmd or vim.o.shell

  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.fn.termopen(cmd)
  vim.cmd("startinsert")

  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = buf,
    callback = function()
      vim.api.nvim_win_close(win, true)
    end,
    once = true,
  })
end

function run.create_terminal_command()
  vim.api.nvim_create_user_command("Terminal", function(opts)
    local cmd = opts.args ~= "" and opts.args or vim.o.shell
    run.open_float_term(cmd)
  end, { nargs = "?", desc = "Open floating terminal with optional command" })
end

function run.setup()
  run.create_terminal_command()
end

run.setup()

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "]q", ":cnext<CR>zz", { desc = "Go to next quickfix item" })
keymap("n", "[q", ":cprev<CR>zz", { desc = "Go to previous quickfix item" })
keymap("n", "]Q", ":lnext<CR>zz", { desc = "Go to next location list item" })
keymap("n", "[Q", ":lprev<CR>zz", { desc = "Go to previous location list item" })
keymap("n", "<leader>nd", ":NoiceDismiss<CR>", { desc = "Dismiss all Noice notifications" })

keymap("n", "<leader>cR", ":CopilotChatReset<CR>", { desc = "Reset Copilot Chat" })
keymap({ "n", "v" }, "<leader>ct", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat Window" })
keymap({ "n", "v" }, "<leader>cs", ":CopilotChatStop<CR>", { desc = "Stop current Copilot output" })
keymap("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Review the selected code" })
keymap("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Give an explanation for the selected code" })
keymap("v", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Add documentation for the selection" })
keymap("v", "<leader>cp", ":CopilotChatTests<CR>", { desc = "Add tests for my code" })

keymap("n", "<leader>f", ":Terminal code-runner<CR>", { desc = "Run the code-runner script" })
keymap("n", "<leader>ao", ":Terminal opencode .<CR>", { desc = "Open code" })

keymap("v", "p", '"_dP', opts)
keymap("v", "<C-l>", ">gv", { desc = "> without loosing indent mode" })
keymap("v", "<C-h>", "<gv", { desc = "< without loosing indent mode" })
keymap("v", "<C-j>", ":m '>+1<CR>gv", { desc = "Move selected line down" })
keymap("v", "<C-k>", ":m '<-2<CR>gv", { desc = "Move selected line up" })

keymap("n", "<leader>lw", ":set wrap!<CR>", { desc = "Toggle line wrapping" })
keymap("n", "n", "nzzzv", { desc = "Find n with cursor in center" })
keymap("n", "N", "nzzzv", { desc = "Find N with cursor in center" })
keymap("n", "J", "mzJ`z", { desc = "Join line with out moving cursor" })

keymap("n", "<Up>", ":resize +2<CR>", { desc = "Horizontal resize +2" })
keymap("n", "<Down>", ":resize -2<CR>", { desc = "Horizontal resize -2" })
keymap("n", "<Left>", ":vertical resize -2<CR>", { desc = "Vertical resize -2" })
keymap("n", "<Right>", ":vertical resize +2<CR>", { desc = "Vertical resize +2" })

keymap("n", "<C-u>", "<C-u>zz", { desc = "<C-u> with cursor in center" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "<C-d> with cursor in center" })

keymap("n", "<leader>sn", ":noautocmd w<CR>", { desc = "save file without auto-formatting" })
keymap("n", "x", '"_x', { desc = "Delete single character with out copying into register" })

keymap({ "n", "v" }, "gh", ":diffget //2<CR>", { desc = "Git Hunks: get left side of diff" })
keymap({ "n", "v" }, "gl", ":diffget //3<CR>", { desc = "Git Hunks: get right side of diff" })
keymap("n", "<leader>go", ":GBrowse<CR>", { desc = "Git Browse" })
keymap("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
keymap("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" })
keymap("n", "<leader>ga", ":Git add .<CR>", { desc = "Git Add All changes" })
keymap("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git Write" })
keymap("n", "<leader>gd", ":Gvdiffsplit!<CR>", { desc = "Git Diff" })
keymap("n", "<leader>gl", ":Gclog<CR>", { desc = "Git Log" })
keymap("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame" })
keymap("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })
keymap("n", "<leader>gf", ":Git fetch<CR>", { desc = "Git Fetch" })
keymap("n", "<leader>gr", ":Gread<CR>", { desc = "Git: restore buffer to HEAD" })

keymap("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle undo tree" })
keymap("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { desc = "Go to context", silent = true })

keymap("n", "<leader>v", ":vsplit<CR>", { desc = "Split window vertically" })
keymap("n", "<leader>o", ":split<CR>", { desc = "Split window vertically" })
keymap("n", "<leader>q", ":close<CR>", { desc = "Close current split" })
keymap("n", "<leader>x", ":only<CR>", { desc = "Close all other splits" })

keymap("n", "<leader>sc", ":Telescope colorscheme<CR>", { desc = "search colorscheme" })
keymap("n", "<leader>sb", ":Telescope git_branches<CR>", { desc = "search git branches" })
keymap("n", "<leader>sf", ":Telescope find_files<CR>", { desc = "Search files" })
keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "[/] Fuzzily search in current buffer" })
keymap("n", "<leader>?", function()
  local builtin = require("telescope.builtin")
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 0,
    previewer = true,
  }))
end, { desc = "[?] Fuzzily search in current buffer small window" })
keymap("n", "<leader>s/", function()
  local builtin = require("telescope.builtin")
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, { desc = "[S]earch [/] in Open Files" })
keymap("n", "<leader>sh", ":Telescope help_tags<CR>", { desc = "Help_tags" })
keymap("n", "<leader>sg", ":Telescope live_grep<CR>", { desc = "Search using live grep" })
keymap("n", "<leader><leader>", ":Telescope buffers<CR>", { desc = "List buffers" })
keymap("n", "<leader>st", ":Telescope<CR>", { desc = "help tags" })
keymap("n", "<leader>sd", ":Telescope lsp_type_definitions<CR>", { desc = "Search LSP Definitions" })
keymap("n", "<leader>sr", ":Telescope lsp_references<CR>", { desc = "Search LSP references" })
keymap("n", "<leader>ss", ":Telescope lsp_document_symbols<CR>", { desc = "Search document symbols" })

keymap("n", "<leader>e", function()
  if vim.bo.filetype == "oil" then
    vim.cmd("bdelete")
  else
    vim.cmd("Oil")
  end
end, { desc = "toggle oil" })

keymap("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle line wise comment in normal mode" })
keymap("n", "<C-c>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle line wise comment in normal mode" })
keymap("n", "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle line wise comment in normal mode" })

keymap("v", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Toggle line wise comment in visual mode" })
keymap("v", "<C-c>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Toggle line wise comment in visual mode" })
keymap("v", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Toggle line wise comment in visual mode" })

keymap("n", "<leader>H", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Toogle harpoon ui" })
keymap("n", "<leader>h", function()
  require("harpoon"):list():add()
end, { desc = "Add current buffer in harpoons list" })
keymap("n", "<leader>1", function()
  require("harpoon"):list():select(1)
end, { desc = "Select 1 ih list of harpoon" })
keymap("n", "<leader>2", function()
  require("harpoon"):list():select(2)
end, { desc = "Select 2 in list of harpoon" })
keymap("n", "<leader>3", function()
  require("harpoon"):list():select(3)
end, { desc = "Select 3 in list of harpoon" })
keymap("n", "<leader>4", function()
  require("harpoon"):list():select(4)
end, { desc = "Select 4 in list of harpoon" })
keymap("n", "<leader>5", function()
  require("harpoon"):list():select(5)
end, { desc = "Select 5 in list of harpoon" })
keymap("n", "<leader>j", function()
  require("harpoon"):list():next()
end, { desc = "Next harpoon buffer" })
keymap("n", "<leader>k", function()
  require("harpoon"):list():prev()
end, { desc = "Previous harpoon buffer" })

keymap("n", "<leader>cd", ":Lspsaga peek_definition<CR>", { desc = "Code Definition" })
keymap("n", "<leader>ci", ":Lspsaga incoming_calls<CR>", { desc = "Code Incoming Calls" })
keymap("n", "<leader>co", ":Lspsaga outgoing_calls<CR>", { desc = "Code Outgoing Calls" })
keymap("n", "<leader>cs", ":Lspsaga outline<CR>", { desc = "Code Symbols Outline" })

keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to defination" })
keymap("n", "gD", vim.lsp.buf.references, { desc = "References" })
keymap("n", "gt", vim.lsp.buf.type_definition, { desc = "Type defination" })
keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Got to implementation" })
keymap("n", "K", ":Lspsaga hover_doc<CR>", { desc = "Hover docs" })
keymap("n", "<leader>rn", ":Lspsaga rename<CR>", { desc = "Rename the variable" })
keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", { desc = "Code action" })
keymap("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", { desc = "Jump to next diagnostic" })
keymap("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump to previous diagnostic" })

require("snacks").setup({
  notifier = {
    enabled = false,
    style = "fancy",
  },
  bigfile = {
    enabled = true,
    notify = true,
    size = 1.5 * 1024 * 1024,
  },
  quickfile = {
    enabled = true,
  },
  statuscolumn = {
    enabled = false,
  },
})

require("Comment").setup({
  padding = true,
  sticky = true,
  ignore = nil,
  mappings = {
    basic = false,
    extra = false,
  },
  pre_hook = nil,
  post_hook = nil,
})

require("nvim-autopairs").setup({})

require("colorizer").setup({})

require("gitsigns").setup({
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signs_staged = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
})

require("oil").setup({
  delete_to_trash = true,
  default_file_explorer = true,
  watch_for_changes = true,
  win_options = {
    wrap = true,
  },
  keymaps = {
    ["<C-l>"] = false,
    ["<C-h>"] = false,
    ["<C-p>"] = false,
    ["<C-r>"] = "actions.refresh",
    ["<C-v>"] = "actions.select_vsplit",
  },
  skip_confirm_for_simple_edits = true,
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
  },
})

require("telescope").setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
  },
  extensions = {
    ["fzf"] = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})
pcall(require("telescope").load_extension, "fzf")

require("which-key").setup({
  win = {
    wo = { winblend = 0 },
    zindex = 1000,
  },
  notify = true,
  preset = "helix",
  plugins = {
    marks = true,
    registers = true,
  },
})

require("indent_blankline").setup({
  indent = { char = "│" },
  scope = {
    show_start = false,
    show_end = false,
    show_exact_scope = false,
  },
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    section_separators = { left = "", right = "" },
    component_separators = { left = " ", right = " " },
    disabled_filetypes = {
      statusline = { "alpha", "neo-tree" },
      winbar = {},
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return " " .. str
        end,
        section_separators = { left = "" },
      },
    },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 0,
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = "",
        },
        colored = false,
        update_in_insert = false,
        always_visible = false,
        cond = function()
          return vim.fn.winwidth(0) > 100
        end,
      },
      {
        "diff",
        colored = false,
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        cond = function()
          return vim.fn.winwidth(0) > 100
        end,
      },
      {
        "encoding",
        cond = function()
          return vim.fn.winwidth(0) > 100
        end,
      },
      {
        "filetype",
        cond = function()
          return vim.fn.winwidth(0) > 100
        end,
      },
    },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { "filename", path = 1 },
    },
    lualine_x = {
      { "location", padding = 0 },
    },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "fugitive" },
})

require("treesitter-context").setup({
  enable = true,
  max_lines = 5,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = "outer",
  mode = "cursor",
  zindex = 90,
})

require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner class" },
        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
      },
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.outer"] = "V",
        ["@class.outer"] = "<c-v>",
      },
      include_surrounding_whitespace = true,
    },
  },
})

require("ufo").setup({
  provider_selector = function()
    return { "treesitter", "indent" }
  end,
  fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
    local new_virt_text = {}
    local suffix = ("  󰁂 %d "):format(end_lnum - lnum)
    local suf_width = vim.fn.strdisplaywidth(suffix)
    local target_width = width - suf_width
    local cur_width = 0
    for _, chunk in ipairs(virt_text) do
      local chunk_text = chunk[1]
      local chunk_width = vim.fn.strdisplaywidth(chunk_text)
      if target_width > cur_width + chunk_width then
        table.insert(new_virt_text, chunk)
      else
        chunk_text = truncate(chunk_text, target_width - cur_width)
        local hl_group = chunk[2]
        table.insert(new_virt_text, { chunk_text, hl_group })
        chunk_width = vim.fn.strdisplaywidth(chunk_text)
        if cur_width + chunk_width < target_width then
          suffix = suffix .. (" "):rep(target_width - cur_width - chunk_width)
        end
        break
      end
      cur_width = cur_width + chunk_width
    end
    table.insert(new_virt_text, { suffix, "MoreMsg" })
    return new_virt_text
  end,
})

require("alpha").setup({
  layout = {
    { type = "padding", val = 3 },
    {
      type = "text",
      val = {
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣀⠀⣦⣤⣾⣇⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠚⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣻⠿⣿⣿⣿⣿⣿⣯⣟⢿⡟⡿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡯⡄⢻⣿⡾⣿⣿⣿⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡿⢿⣹⣿⣿⣿⣋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡶⣦⣄⡀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡟⢹⣿⣖⡄⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢷⣜⠀⠙⠉⠒⠲⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢷⢛⠲⢤⣀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢐⣫⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡷⡲⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⡿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⠿⠿⠿⠿⠿⢿⣯⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣟⠻⠿⠿⢿⣿⣿⣷⣒⣶⣤⢀⣀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⢀⣿⣿⣿⣿⡟⢿⠙⢻⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠻⠿⠇⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⢿⣿⣿⣿⣿⠀⠘⣧⢹⣻⣿⣿⡿⣹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣼⣿⣿⣿⣿⡼⢀⢻⡎⠙⣿⣿⣣⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢿⣿⣿⣿⣿⡇⠠⠘⣿⠀⢸⣿⡿⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⡄⣼⡇⢺⡀⢻⣇⢸⣿⢿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⢹⣇⢸⡇⠈⡇⠀⢫⣿⡇⢸⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⣥⣄⣠⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣾⣿⡘⣇⠀⢱⠀⡚⣾⣧⣼⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⢟⣿⡝⢡⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡆⢻⡀⢨⡄⢰⢸⣿⣧⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⡾⢿⡿⠿⠄⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡘⣿⣇⣈⣇⠈⣿⡀⣗⣿⣿⣿⡄⠀⠀⠀⠀⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⢿⣿⣿⣿⣭⣽⡆⠀⠀⠀⠈⠛⢄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣻⣹⣿⢹⣼⡄⠸⣷⣿⡹⢿⣿⠇⠀⠀⠀⣰⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⣿⣿⣿⣿⣿⣿⣭⣷⣶⣄⣜⠁⠀⢁⡀⠀⠀⠀⠀⢸⣿⣿⢸⣿⣿⠘⢻⡇⣾⢹⣯⡷⡄⢻⡄⠀⠀⣰⣿⣿⢾⡁⠤⢤⣰⡆⠀⠀⠐⢠",
        "⣫⣿⣿⡿⣿⣿⣿⣾⣾⣿⣿⣿⣿⣥⣤⣔⣤⣀⡂⢸⣿⣿⢠⣿⣽⠧⡘⣿⢹⣿⢻⡷⣽⣦⡇⢀⣴⢟⣽⣿⣻⣧⣶⣾⣿⣿⣷⡀⣠⣼",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣧⣬⣿⣧⣿⣿⣿⡄⣿⣿⣔⣿⣼⣦⠟⡿⣧⣀⣿⡗⠻⣿⣯⣿⣴⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿",
        "⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣛⣸⣿⣿⣇⣿⣿⣟⣿⣯⣽⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣺⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⢿⣿⣿⣿⣿⣿⡇⣿⢻⣿⣿⣇⣿⣿⣿⣠⣟⣿⣿⠟⣻⣿⣿⣿⣿⣿⣿⣄⠀⠾⣿",
        "⣿⢻⢻⣿⣿⣿⣿⣿⣿⣿⣿⢿⣝⡟⣛⣛⣹⣯⡓⠈⣿⣿⣿⢟⣿⣿⣿⡇⣿⡏⢿⣟⡋⢻⠩⡿⡛⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⢿",
      },
      opts = {
        position = "center",
        hl = "Directory",
      },
    },
    { type = "padding", val = 2 },
    {
      type = "group",
      val = {
        {
          type = "button",
          val = "  λ  ➤  Recent Files",
          on_press = function()
            require("telescope.builtin").oldfiles({ results = 10 })
          end,
          opts = {
            keymap = { "n", "r", ":Telescope oldfiles<CR>", { silent = true, noremap = true } },
            shortcut = "r",
            position = "center",
            cursor = 3,
            width = 50,
            align_shortcut = "right",
            hl_shortcut = "Directory",
            hl = "Directory",
          },
        },
        {
          type = "button",
          val = "  λ  ➤  File Explorer",
          on_press = function()
            vim.cmd("Explore")
          end,
          opts = {
            keymap = { "n", "e", ":Oil<CR>", { silent = true, noremap = true } },
            shortcut = "e",
            position = "center",
            cursor = 3,
            width = 50,
            align_shortcut = "right",
            hl_shortcut = "Directory",
            hl = "Directory",
          },
        },
        {
          type = "button",
          val = "  λ  ➤  New File",
          on_press = function()
            vim.cmd("enew")
          end,
          opts = {
            keymap = { "n", "n", ":enew<CR>", { silent = true, noremap = true } },
            shortcut = "n",
            position = "center",
            cursor = 3,
            width = 50,
            align_shortcut = "right",
            hl_shortcut = "Directory",
            hl = "Directory",
          },
        },
        {
          type = "button",
          val = "  λ  ➤  Quit",
          on_press = function()
            vim.cmd("qa")
          end,
          opts = {
            keymap = { "n", "q", ":qa<CR>", { silent = true, noremap = true } },
            shortcut = "q",
            position = "center",
            cursor = 3,
            width = 50,
            align_shortcut = "right",
            hl_shortcut = "Directory",
            hl = "Directory",
          },
        },
      },
    },
    { type = "padding", val = 2 },
  },
})

require("nvim-surround").setup({})

require("todo-comments").setup({
  signs = false,
})

require("lspkind").init({
  mode = "symbol_text",
  symbol_map = {
    Copilot = "",
  },
  maxwidth = 50,
  ellipsis_char = "...",
})

local cmp = require("cmp")
cmp.setup({
  sources = cmp.config.sources({
    { name = "calc" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "nvim_lsp_signature_help" },
    { name = "spell" },
    { name = "async_path" },
    { name = "emoji" },
    { name = "git" },
    { name = "latex_symbols" },
    { name = "nvim_lsp_document_symbols" },
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:None",
    },
    completion = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:CurSearch,Search:None",
      scrollbar = false,
    },
  },
  mapping = {
    ["<C-l>"] = cmp.mapping(function(fallback)
      local luasnip = require("luasnip")
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function(fallback)
      local luasnip = require("luasnip")
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
  },
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "async_path" },
    { name = "cmdline" },
  }),
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  glslls = {},
  rust_analyzer = {
    settings = {
      checkOnSave = true,
    },
  },
  marksman = {},
  pylsp = {},
  nixd = {},
  clangd = {},
  bashls = {},
  nushell = {},
  cssls = {},
  html = {},
  tailwindcss = {},
  ts_ls = {},
  emmet_language_server = {},
}

for server, config in pairs(servers) do
  if lspconfig[server] then
    config.capabilities = capabilities
    lspconfig[server].setup(config)
  end
end

require("lsp-format").setup({
  lsp_servers = {
    "dockerls",
    "gopls",
    "nushell",
    "rust_analyzer",
    "pylsp",
  },
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "css",
        "html",
        "json",
        "yaml",
        "markdown",
        "javascript",
        "typescript",
        "typescriptreact",
      },
    }),
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "4" },
    }),
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.nixfmt,
  },
})

require("lspsaga").setup({
  lightbulb = { enable = false },
  beacon = { enable = true },
  implement = { enable = false },
  symbol_in_winbar = {
    enable = false,
    delay = 300,
    folder_level = 1,
    hide_keyword = true,
  },
})

vim.diagnostic.config({
  virtual_text = {
    current_line = true,
    spacing = 2,
    prefix = "",
  },
  update_in_insert = true,
  severity_sort = true,
  signs = true,
})

vim.lsp.inlay_hint.enable(true)

local catppuccin = require("catppuccin")
catppuccin.setup({
  show_end_of_buffer = false,
  transparent_background = true,
  flavor = "mocha",
  float = {
    transparent = true,
    solid = false,
  },
  color_overrides = {
    all = {
      base = "#191d33",
    },
  },
  no_italic = false,
  no_bold = true,
  no_underline = false,
})

require("black-metal").setup({
  colored_docstrings = true,
  cursorline_gutter = true,
  dark_gutter = false,
  show_eob = false,
  favor_treesitter_hl = true,
  transparent = true,
  plain_float = false,
  term_colors = true,
  plugin = {
    lualine = {
      bold = false,
      plain = false,
    },
    cmp = {
      plain = true,
      reverse = false,
    },
  },
})

require("vague").setup({
  transparent = false,
  bold = false,
  italic = false,
  on_highlights = function(highlights, colors)
    highlights.GitSignsAdd = { fg = "#ffffff", bg = "NONE" }
    highlights.GitSignsChange = { fg = "#aaaaaa", bg = "NONE" }
    highlights.GitSignsDelete = { fg = colors.error, bg = "NONE" }
    highlights.IndentBlanklineChar = { fg = "#3b3b3b", nocombine = true }
    highlights.IndentBlanklineContextChar = { fg = colors.plus, nocombine = true }
    highlights.IndentBlanklineSpaceChar = { fg = "#444444", nocombine = true }
  end,
})

vim.cmd("colorscheme vague")

-- Disabled plugins (config kept for parity)
--
-- require("notify").setup({
--   render = "simple",
--   stages = "slide",
--   background_colour = "#000000",
--   fps = 60,
--   level = "info",
-- })
--
-- require("noice").setup({
--   cmdline = { enabled = true },
--   notify = { enabled = false },
--   lsp = {
--     hover = { enabled = true },
--     message = { enabled = true },
--     signature = { enabled = false },
--     progress = { enabled = false },
--   },
-- })
--
-- require("cord").setup({
--   display = { show_time = true },
-- })
--
-- require("avante").setup({
--   provider = "copilot",
--   model = "gpt-4",
--   window = {
--     border = "rounded",
--     wrapping = true,
--   },
-- })
--
-- require("copilot").setup({
--   panel = {
--     enabled = false,
--     auto_refresh = false,
--   },
--   suggestion = {
--     enabled = false,
--     auto_trigger = true,
--     debounce = 90,
--     hide_during_completion = true,
--   },
--   filetypes = {
--     ["."] = false,
--     cvs = false,
--     gitcommit = true,
--     gitrebase = true,
--     help = false,
--     hgcommit = false,
--     markdown = true,
--     svn = false,
--     yaml = false,
--     rs = true,
--     js = true,
--     html = true,
--     nix = true,
--     bash = true,
--     ts = true,
--     lua = true,
--     python = true,
--   },
-- })
--
-- require("CopilotChat").setup({
--   headers = {
--     assistant = "## Ai ",
--     user = "## santosh ",
--     tool = "## Tool ",
--   },
--   show_help = false,
--   auto_follow_cursor = true,
--   auto_fold = true,
--   highlight_selection = false,
--   model = "gpt-4.1",
--   window = {
--     height = 1,
--     width = 1,
--     border = "none",
--     title = "─",
--     layout = "float",
--   },
-- })
