--  Aerial - for listing/navigating language symbols: methods, enums, etc
return {
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
    },
    lazy = false,
    layout = {
        default_direction = "right",
        placement = "edge",
    },
    filter_kind = {
        "Class",
        -- "Constructor",
        "Enum",
        "Function",
        -- "Interface",
        -- "Module",
        "Method",
        "Struct",
      },
      manage_folds = true,
      link_folds_to_tree = false,
      link_tree_to_folds = true,


}