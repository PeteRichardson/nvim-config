return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
  {
    "pwntester/octo.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua", "nvim-tree/nvim-web-devicons" },
    cmd = "Octo",
    opts = {
      picker = "fzf-lua", -- default is "telescope", which we don't install
    },
  },
}
