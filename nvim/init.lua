require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets
vim.opt.termguicolors = true

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
-- this like will do the job
require('lazy').setup 'plugins'
-- require('lazy').setup {
--   require 'plugins.neotree',
--   require 'plugins.colortheme',
--   require 'plugins.bufferline',
--   require 'plugins.lualine',
--   require 'plugins.treesitter',
--   require 'plugins.telescope',
--   require 'plugins.lsp',
--   require 'plugins.autocompletion',
--   require 'plugins.none-ls',
--   require 'plugins.gitsigns',
--   require 'plugins.alpha',
--   require 'plugins.indent-blankline',
--   require 'plugins.misc',
--   require 'plugins.comment',
--   require 'plugins.smear_cursor',
-- }

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
local rt = require 'rust-tools'

rt.setup {
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
}
