return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ruff", "clangd" },
      -- rust_analyzer is intentionally NOT here: rustaceanvim owns Rust LSP attach.
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      vim.lsp.config("pyright", {})
      vim.lsp.config("ruff", {})
      vim.lsp.config("clangd", {})
      -- Swift: not Mason-installable, points at the toolchain's sourcekit-lsp directly.
      vim.lsp.config("sourcekit", {
        cmd = { "sourcekit-lsp" },
        filetypes = { "swift" },
        root_markers = { "Package.swift", ".git" },
      })

      vim.lsp.enable({ "lua_ls", "pyright", "ruff", "clangd", "sourcekit" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufopts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        end,
      })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = { "rust" },
  },
}
