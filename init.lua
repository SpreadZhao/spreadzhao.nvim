-- require configs
require 'config.basic'
require 'config.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    require 'plugins.catppuccin',
    require 'plugins.lazygit',
    require 'plugins.which-key',
    -- require 'plugins.telescope',
    require 'plugins.fzf-lua',
    require 'plugins.conform',
    require 'plugins.blink-cmp',
    require 'plugins.todo-comments',
    -- require 'plugins.mini',
    require 'plugins.nvim-treesitter',
    require 'plugins.indent_line',
    require 'plugins.autopairs',
    -- require 'plugins.neo-tree',
    require 'plugins.oil',
    require 'plugins.leap',
    require 'plugins.lualine',
    require 'plugins.gitsigns',
    -- LSP Plugins
    require 'plugins.lsp.lazydev',
    require 'plugins.lsp.nvim-lspconfig',

    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.lint',
  },
  install = {
    colorscheme = { 'catppuccin' },
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
