# nvim-config

> _Pete Richardson's personal Neovim configuration._

A from-scratch Neovim setup managed with [lazy.nvim](https://github.com/folke/lazy.nvim),
built around native LSP (`vim.lsp.config`/`vim.lsp.enable`, no `lspconfig.setup{}`
wrapper), Treesitter, and a VSCode-style sidebar file explorer. It targets
Python, C/C++, Rust, and Swift development, plus in-editor Claude Code
integration.

<!-- 🖊 TODO: Set project status — delete the others:
> **Status:** Active development — this is a daily driver and changes as workflow needs evolve.
> **Status:** Stable — settled, only occasional tweaks.
-->

---

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Keymaps](#keymaps)
- [Structure](#structure)
- [Customizing](#customizing)
- [Known Limitations](#known-limitations)
- [License](#license)

---

## Features

- **Native LSP** for Lua, Python (`pyright` + `ruff`), C/C++ (`clangd`),
  Rust (via `rustaceanvim`), and Swift (`sourcekit-lsp`) — servers registered
  through Neovim 0.11's built-in `vim.lsp.config()`/`vim.lsp.enable()`, with
  binaries managed by `mason.nvim`.
- **Format-on-save and linting**: `conform.nvim` (`ruff_format`, `stylua`,
  `rustfmt`, `clang-format`) and `nvim-lint` (`ruff`) wired to `BufWritePre`/
  `BufWritePost`.
- **Treesitter** (`main` branch) for highlighting, indentation, and
  fold-by-expression, with parsers auto-installed on startup.
- **Completion** via `blink.cmp`, sourced from LSP, path, snippets
  (`friendly-snippets`), and buffer text.
- **VSCode-style sidebar** file explorer (`snacks.nvim`, replaces netrw),
  plus `oil.nvim` on demand (`:Oil`) for edit-directory-as-buffer / bulk
  rename workflows.
- **Fuzzy finding** over files, live grep, buffers, and LSP references via
  `fzf-lua`; in-buffer symbol navigation via `aerial.nvim`; jump-to-anything
  on screen via `flash.nvim`; pinned-file bouncing via `grapple.nvim`.
- **Git workflow**: inline hunk signs (`gitsigns.nvim`), diff review
  (`diffview.nvim`), and GitHub PR/issue review from inside Neovim
  (`octo.nvim`).
- **Claude Code integration**: toggle a Claude Code terminal session with a
  single keymap (`claude-code.nvim`).
- Moonfly colorscheme, `snacks.nvim` dashboard/indent-guides/notifications,
  and a diagnostics/git/marks scrollbar (`satellite.nvim`).

---

## Prerequisites

- **Neovim ≥ 0.11** (developed against v0.12) — required for the native
  `vim.lsp.config`/`vim.lsp.enable` API used in `lua/plugins/lsp.lua`.
- **git** — to bootstrap `lazy.nvim` and its plugins.
- **A C compiler** (e.g. `cc`/`clang`/`gcc`) — required by `nvim-treesitter`
  to compile parsers.
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** — used by `fzf-lua`
  for `live_grep`.
- **A [Nerd Font](https://www.nerdfonts.com/)** — for `nvim-web-devicons`
  and `blink.cmp`'s icon glyphs; set it as your terminal font.
- Per-language tooling pulled in automatically by `mason.nvim`
  (`lua_ls`, `pyright`, `ruff`, `clangd`), except:
  - **Rust**: a working `rustup`/`cargo` toolchain — `rustaceanvim` drives
    `rust-analyzer` directly rather than through Mason.
  - **Swift**: Xcode or the Swift toolchain, for `sourcekit-lsp` on `$PATH`
    — it's not Mason-installable (`lua/plugins/lsp.lua`).
  - **Formatters** `stylua`, `rustfmt`, `clang-format` need to be on
    `$PATH` (e.g. via `cargo install stylua`, `rustup component add
    rustfmt`, your system package manager) — `conform.nvim` does not
    install these itself.
- **`gh` (GitHub CLI)**, authenticated — required by `octo.nvim` for PR/issue
  review.

---

## Installation

```sh
# Back up any existing config first
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

git clone git@github.com:PeteRichardson/nvim-config.git ~/.config/nvim
nvim
```

On first launch, `lua/config/lazy.lua` clones `lazy.nvim` itself, then
`lazy.nvim` installs every plugin declared under `lua/plugins/` and checks
out the commits pinned in `lazy-lock.json`. Once plugin installation
finishes, run `:Mason` to confirm `lua_ls`, `pyright`, `ruff`, and `clangd`
installed correctly, and `:checkhealth` to catch any missing prerequisites.

---

## Quick Start

```sh
nvim path/to/a/project
```

- `<space>e` — toggle the sidebar file explorer.
- `<space>ff` — fuzzy-find files in the current project.
- `<space>fg` — live grep across the project.
- Open a file with an LSP server configured (e.g. a `.py` or `.rs` file) and
  press `K` over a symbol for hover docs, or `gd` to jump to its definition.

---

## Keymaps

Leader is `<space>`.

| Keymap | Mode | Action |
|---|---|---|
| `<leader>s` | n | Save (`:w`) |
| `<leader>w` | n | Toggle line wrap |
| `<leader>t` | n | Open a terminal in a split (`:Term`) |
| `<leader>e` | n | Toggle sidebar file explorer |
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Live grep |
| `<leader>fb` | n | List buffers |
| `<leader>fr` | n | LSP references |
| `<leader>a` | n | Toggle symbol outline (Aerial) |
| `{` / `}` | n | Previous/next symbol (Aerial) |
| `s` / `S` | n, x, o | Flash jump / Flash Treesitter jump |
| `<leader>gt` | n | Toggle Grapple tag on current file |
| `<leader>gm` | n | Open Grapple tag menu |
| `<leader>1`–`<leader>4` | n | Jump to Grapple tag 1–4 |
| `<leader>cc` | n, t | Toggle Claude Code terminal |
| `gd` / `gD` / `gi` / `gr` | n | LSP definition / declaration / implementation / references |
| `K` | n | LSP hover |
| `<space>rn` | n | LSP rename |
| `<space>ca` | n | LSP code action |

`gd`/`gD`/`gi`/`gr`/`K`/`rn`/`ca` are buffer-local and only bind after an LSP
client attaches (`LspAttach` autocmd in `lua/plugins/lsp.lua`).

---

## Structure

```
init.lua                 -- leader keys, netrw disabled, requires config/*
lua/config/
  options.lua             -- vim.opt: indentation, search, Treesitter folding
  keymaps.lua              -- global keymaps + the :Term user command
  lazy.lua                 -- bootstraps lazy.nvim, loads lua/plugins/*
lua/plugins/
  ai.lua                    -- claude-code.nvim
  colorscheme.lua           -- moonfly
  completion.lua            -- blink.cmp
  explorer.lua              -- oil.nvim, fzf-lua, aerial.nvim, flash.nvim, grapple.nvim
  format-lint.lua           -- conform.nvim, nvim-lint
  git.lua                   -- gitsigns.nvim, diffview.nvim, octo.nvim
  lsp.lua                   -- mason.nvim, mason-lspconfig, nvim-lspconfig, rustaceanvim
  misc.lua                  -- vim-just
  treesitter.lua            -- nvim-treesitter (main branch)
  ui.lua                    -- which-key.nvim, snacks.nvim, satellite.nvim
lazy-lock.json            -- plugin commits pinned by lazy.nvim (don't hand-edit)
```

See [AGENTS.md](AGENTS.md) for the fuller architectural notes (why plugins
are grouped this way, and where two plugins deliberately split ownership of
similar-looking jobs, e.g. `snacks.nvim`'s explorer vs. `oil.nvim`).

---

## Customizing

Add a plugin by adding a table entry to the relevant file under
`lua/plugins/` (or a new file for a new concern) — `lazy.nvim` auto-loads
every file in that directory, so there's no separate registration step.
Prefer `opts = {}` for plugins that need no setup logic; reach for a
`config`/`init` function only when something dynamic needs to happen (see
`lsp.lua` and `treesitter.lua`).

---

## Known Limitations

- **Personal config, not a distribution** — language support, keymaps, and
  plugin choices are tuned for one person's workflow (Python, C/C++, Rust,
  Swift). Expect to prune or extend `lua/plugins/` for other languages.
- **Swift support requires Xcode** — `sourcekit-lsp` isn't installed via
  Mason and must already be on `$PATH` (`lua/plugins/lsp.lua`).
- **No automated tests or CI** — there's no build/test suite; changes are
  verified by using the editor and `:checkhealth`.

<!-- 🖊 TODO: Review — call out anything else that's tripped you up (e.g. platform-specific formatter paths). -->

---

## License

<!-- 🖊 TODO: No LICENSE file is present in this repo. Add one (e.g. MIT) if you intend this to be reused by others, or note here that it's a personal, unlicensed config. -->
