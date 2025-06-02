-- require configs
require 'config.basic'
require 'config.keymaps'
require 'config.lsp'

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
    -- Theme
    require 'plugins.vscode',
    -- require 'plugins.catppuccin',
    -- Git
    require 'plugins.lazygit',
    require 'plugins.gitsigns',
    -- File Manage
    require 'plugins.oil',
    -- require 'plugins.neo-tree',
    -- Basic Functionalities
    require 'plugins.which-key',
    require 'plugins.fzf-lua',
    require 'plugins.conform',
    require 'plugins.blink-cmp',
    require 'plugins.todo-comments',
    require 'plugins.nvim-treesitter',
    require 'plugins.indent_line',
    require 'plugins.autopairs',
    require 'plugins.lualine',
    require 'plugins.toggleterm',
    require 'plugins.flash',
    -- LSP Plugins
    require 'plugins.lsp.lazydev',
    require 'plugins.lsp.mason',
    require 'plugins.lsp.fidget',
    -- Debugger
    require 'plugins.debug',

    -- Deprecated
    -- require 'plugins.leap',
    -- require 'plugins.mini',
    -- require 'plugins.telescope',
    -- require 'plugins.lsp.init-lsp'
    -- require 'plugins.lsp.nvim-lspconfig',
    -- require 'kickstart.plugins.lint',
  },
  install = {
    colorscheme = { 'vscode' },
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
