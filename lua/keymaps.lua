-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Better window navigation
vim.keymap.set('n', '<C-S-b>', '<Esc>:NvimTreeToggle<cr>', opts)
vim.keymap.set('n', '<C-i>', '<C-w>w', opts)
vim.keymap.set('n', '<C-S-i>', '<C-w>p', opts)

