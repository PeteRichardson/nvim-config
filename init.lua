vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require('options')
require('keymaps')
require('plugins')

-- Treesitter parsers (compiled .so files), managed independently of any
-- plugin so highlighting/folding survive plugin manager changes.
-- Must come after require('plugins'): lazy.nvim's setup() rebuilds rtp
-- from its own managed plugin list, dropping anything appended earlier.
vim.opt.rtp:append(vim.fn.stdpath("data") .. "/site/manual-parsers")

require('colorscheme')
require('lsp')
vim.api.nvim_create_user_command("Term", function()
  vim.cmd("split")
  vim.cmd("term")
  vim.cmd("startinsert")
end, {})

vim.keymap.set("n", "<leader>t", ":Term<CR>", { noremap = true, silent = true })
