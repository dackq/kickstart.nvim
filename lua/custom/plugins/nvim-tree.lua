-- config for https://github.com/nvim-tree/nvim-tree.lua

local function on_attach_buffer(buffer_number)
  local api = require 'nvim-tree.api'
  -- default mappings
  api.config.mappings.default_on_attach(buffer_number)
end

return {
  'nvim-tree/nvim-tree.lua',
  init = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
    require('nvim-tree').setup {
      on_attach = on_attach_buffer,
      view = {
        adaptive_size = true,
      },
    }
    local api = require 'nvim-tree.api'
    -- custom mappings
    vim.keymap.set('n', '<leader>ve', api.tree.toggle, {
      desc = '[V]iew: toggle nvim-tree [E]xplorer',
      noremap = true,
      silent = true,
      nowait = true,
    })
  end,
  cond = not vim.g.vscode,
}
