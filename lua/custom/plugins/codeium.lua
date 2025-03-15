-- codeium
-- https://github.com/Exafunction/codeium.vim

return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.g.codeium_enabled = false -- Disable by default

    vim.keymap.set('i', '<M-y>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true }) -- Accept completion
  end,
}
