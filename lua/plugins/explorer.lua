return {
  {
    "stevearc/oil.nvim",
    -- snacks.explorer (ui.lua) owns directory-opening/netrw replacement, since
    -- that's the VSCode-sidebar model; oil stays available on-demand via `:Oil`
    -- for its edit-directory-as-a-buffer / bulk-rename workflow.
    opts = { default_file_explorer = false },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<CR>" },
      { "<leader>fg", "<cmd>FzfLua live_grep<CR>" },
      { "<leader>fb", "<cmd>FzfLua buffers<CR>" },
      { "<leader>fr", "<cmd>FzfLua lsp_references<CR>" },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "{", "<cmd>AerialPrev<CR>" },
      { "}", "<cmd>AerialNext<CR>" },
      { "<leader>a", "<cmd>AerialToggle<CR>" },
    },
  },
  {
    -- jump to any visible location on screen via labeled search — the actual
    -- "zip around a project quickly" tool, complements fzf-lua/aerial rather
    -- than replacing them
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
    },
  },
  {
    -- pin the handful of files you keep bouncing between while debugging/relearning
    -- a project, jump back to any of them (with cursor position) in one keystroke
    "cbochs/grapple.nvim",
    opts = { scope = "git_branch" },
    cmd = "Grapple",
    keys = {
      { "<leader>gt", "<cmd>Grapple toggle<CR>" },
      { "<leader>gm", "<cmd>Grapple toggle_tags<CR>" },
      { "<leader>1", "<cmd>Grapple select index=1<CR>" },
      { "<leader>2", "<cmd>Grapple select index=2<CR>" },
      { "<leader>3", "<cmd>Grapple select index=3<CR>" },
      { "<leader>4", "<cmd>Grapple select index=4<CR>" },
    },
  },
}
