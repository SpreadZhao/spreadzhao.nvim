vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    map('gd', function()
      require('fzf-lua').lsp_definitions()
    end, '[G]oto [D]efinition')
  end,
})
