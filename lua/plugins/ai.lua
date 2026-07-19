return {
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "ClaudeCode",
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<CR>" },
    },
    opts = {
      keymaps = {
        toggle = {
          normal = "<leader>cc",
          terminal = "<leader>cc", -- without this, <leader>cc only works OUTSIDE
          -- the Claude terminal buffer, since terminal-mode keystrokes go straight
          -- to the underlying process unless a terminal-mode keymap intercepts them
        },
      },
    },
  },
}
