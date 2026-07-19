local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", opts)
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>", opts)

vim.api.nvim_create_user_command("Term", function()
  vim.cmd("split")
  vim.cmd("term")
  vim.cmd("startinsert")
end, {})
vim.keymap.set("n", "<leader>t", ":Term<CR>", opts)
