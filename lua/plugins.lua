local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  --------------------------------------
  'tpope/vim-sensible',
  
  --------------------------------------
  -- Misc LSP stuff
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  --------------------------------------
  -- moonfly colorscheme
  "bluz71/vim-moonfly-colors",

  --------------------------------------
  --  Aerial - for listing/navigating language symbols: methods, enums, etc
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    keys = {
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr }),
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr }),
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>"),
    },
    lazy = false,
  },

  --------------------------------------
  -- nvim-tree for navigating the file system
  'nvim-tree/nvim-web-devicons',
  {
    "nvim-tree/nvim-tree.lua",
    sort = { sorter = "case_sensitive" },
    view = { width = 15 },
    renderer = { group_empty = true },
    filters = { dotfiles = true },
    -- keys = {
    --     {"n", "<leader>a", ":NvimTreeToggle<CR>", { silent = true }}
    -- },
    lazy = false,
  },

  --------------------------------------
  -- rustaceanvim - better fork of rust-tools
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  -- 'wfxr/minimap.vim',
})

require("nvim-tree").setup {}   

