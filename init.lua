vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')
