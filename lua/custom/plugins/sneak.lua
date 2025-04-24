return {
  'justinmk/vim-sneak',
  config = function()
    vim.cmd 'highlight link Sneak None'
  end,
  cond = not vim.g.vscode,
}
