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
    --
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    },
    --------------------------------------
    --
    {
        'lewis6991/gitsigns.nvim',
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
        lazy = false,   -- This plugin is already lazy
    },

    --------------------------------------
    -- fzf plugin to improve file searching
    -- 'junegu:web/fzf',
    -- 'junegunn/fzf.vim',

    -- 'wfxr/minimap.vim',
})

require("nvim-tree").setup {}
require('gitsigns').setup {
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)
        map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hu', gitsigns.undo_stage_hunk)
        map('n', '<leader>hR', gitsigns.reset_buffer)
        map('n', '<leader>hp', gitsigns.preview_hunk)
        map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>hd', gitsigns.diffthis)
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
        map('n', '<leader>td', gitsigns.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
