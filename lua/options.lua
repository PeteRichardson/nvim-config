vim.opt.guifont =  {"Hack Nerd Font Mono", ":h24" }

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim
vim.opt.backspace = [[indent,eol,start]]

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false         -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.sidescroll=1
vim.opt.wrap = false                 -- don't wrap lines
vim.opt.whichwrap:append("h,l,~,[,],<,>,b,s")
vim.opt.showmatch = true
vim.opt.wildmenu = true
vim.opt.filetype = "on"

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = true            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- Treesitter folding 
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
vim.opt.foldcolumn ='1'

-- Minimap
vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_window_width_override_for_scaling = 200
vim.g.minimap_highlight_search = 1
vim.g.minimap_left = 0
vim.g.minimap_block_filetypes = {'nvimtree', 'fugitive', 'nerdtree', 'tagbar', 'fzf'}
