return {
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      notifier = { enabled = true },
      statuscolumn = { enabled = true },
      -- VSCode-style sidebar: fixed-width left panel, replaces netrw/oil for
      -- directory buffers (`nvim .` / `:e some-dir`), selecting a file opens it
      -- in the main window while the sidebar stays open.
      explorer = { replace_netrw = true },
    },
    keys = {
      { "<leader>e", function() Snacks.explorer() end, desc = "Toggle file explorer sidebar" },
    },
  },
  {
    -- replaces minimap.vim: scrollbar showing diagnostics/git-hunks/marks/search
    -- matches, no external `code-minimap` binary needed
    "lewis6991/satellite.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
