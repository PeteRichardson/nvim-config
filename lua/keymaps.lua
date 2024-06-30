-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Better window navigation
vim.keymap.set('n', '<C-S-b>', '<CMD>NvimTreeToggle<CR>', opts)
vim.keymap.set("n", "<leader>m", "<CMD>MinimapToggle<CR>")
vim.keymap.set("n", "<leader>a", "<CMD>AerialToggle<CR>")
vim.keymap.set('n', '<leader>b', '<CMD>MinimapToggle<CR><CMD>AerialToggle<CR>', opts)
vim.keymap.set('n', '<leader>w', '<CMD>:set wrap!<CR>', opts)
