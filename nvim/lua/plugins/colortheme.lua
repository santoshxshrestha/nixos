-- lua/plugins/rose-pine.lua
return {
  'rose-pine/neovim',
  lazy = false, -- Ensure the theme is loaded immediately
  priority = 1000, -- High priority to load the theme early
  config = function()
    -- Configure the rose-pine theme
    require('rose-pine').setup {
      disable_background = true, -- Start with a transparent background
      disable_float_background = true,
      bold_vert_split = false,
    }

    -- Apply the colorscheme
    vim.cmd.colorscheme 'rose-pine'

    -- Background transparency toggle
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      if bg_transparent then
        -- Enable transparent background
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      else
        -- Disable transparent background
        vim.api.nvim_set_hl(0, 'Normal', { bg = nil })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = nil })
      end
    end

    -- Map a key to toggle transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
