return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  config = function()
    -- here we make sure that these formatters are installed using mason-tool-installer
    -- NOTE: I'm not sure if I can use this more than once, so make sure not
    -- to use it in other plugin configs
    require('mason-tool-installer').setup {
      ensure_installed = {
        'stylua',
        'isort',
        'black',
        'google-java-format',
        'prettierd',
        'clang-format',
        'xmlformatter',
      },
    }

    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { 'isort', 'black' }
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
        python = { 'isort', 'black' },
        java = { 'google-java-format' },
        javascript = { 'prettierd' },
        c = { 'clang-format' },
        go = { 'gofumpt' },
        json = { 'prettierd' },
      },
    }
  end,
  cond = not vim.g.vscode,
}
