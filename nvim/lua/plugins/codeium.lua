return {
  'Exafunction/codeium.nvim',
  cmd = 'Codeium',
  -- event = 'InsertEnter',
  build = ':Codeium Auth',
  opts = {
    enable_cmp_source = vim.g.ai_cmp, -- Use nvim-cmp if enabled
    virtual_text = {
      enabled = not vim.g.ai_cmp, -- Show inline suggestions only if cmp is disabled
      key_bindings = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = '<C-n>',
        prev = '<C-p>',
      },
    },
  },
}
