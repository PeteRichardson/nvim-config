require("lazy").setup(
  --   {
  -- {
  --   "AstroNvim/AstroNvim",
  --   version = "^4", -- Remove version tracking to elect for nighly AstroNvim
  --   import = "astronvim.plugins",
  --   opts = { -- AstroNvim options must be set here with the `import` key
  --     mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
  --     maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
  --     icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
  --     pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
  --     update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
  --   },
  -- },
  { import = "community" },
  { import = "plugins" },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
