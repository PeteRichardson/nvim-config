vim.api.nvim_create_user_command("Term", function()
  vim.cmd("split")
  vim.cmd("term")
  vim.cmd("startinsert")
end, {})

vim.keymap.set("n", "<leader>t", ":Term<CR>", { noremap = true, silent = true })
