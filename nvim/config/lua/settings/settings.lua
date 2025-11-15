local opt = vim.opt          -- Short alias for option setting (vim.opt.<option>)

-- UI / Display
opt.number = true            -- Show absolute line numbers
opt.relativenumber = true    -- Show relative line numbers (good for motions)
opt.mouse = "a"              -- Enable mouse in all modes
opt.termguicolors = true     -- Enable 24-bit true color
opt.signcolumn = "yes"       -- Always show sign column (avoids text shift)
opt.scrolloff = 10           -- Keep 10 lines visible above/below cursor
opt.cursorline = false       -- Disable highlight of the current line (set to true for glow)
opt.wrap = false             -- Disable line wrapping

-- Clipboard and input
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.ttimeout = true            -- Enable keycode timeout
opt.ttimeoutlen = 50           -- Timeout for mapped sequences (ms)
opt.backspace = { "indent", "eol", "start" } -- Allow backspace over everything
opt.belloff = "all"            -- Disable beeps

-- Searching
opt.ignorecase = true          -- Ignore case when searching...
opt.smartcase = true           -- ...unless search contains capitals
opt.hlsearch = true            -- Highlight search results
opt.incsearch = true           -- Show matches as you type
opt.showmatch = true           -- Highlight matching brackets

-- Indentation / Tabs
opt.tabstop = 4                -- Tabs are 4 spaces wide
opt.shiftwidth = 4             -- Indent size
opt.softtabstop = 4            -- How many spaces <Tab> counts for in insert
opt.expandtab = true           -- Convert tabs to spaces

-- Splits
opt.splitright = true          -- New vertical splits open to the right

-- Performance / Responsiveness
opt.updatetime = 300           -- Faster CursorHold/autocmd updates (ms)
opt.history = 1000             -- Remember command history length

-- Wildmenu / Completion
opt.wildmenu = true            -- Enhanced command-line completion
opt.wildmode = { "list", "longest" } -- Completion behavior (show list, then expand)
opt.completeopt = { "menuone", "noselect" } -- Popup menu for completion
opt.pumheight = 12             -- Limit popup menu height

-- Visual tweaks
opt.list = true                -- Show invisible characters
opt.listchars = { trail = "-" }-- Use '-' for trailing spaces
opt.termguicolors = true       -- True color support (reaffirmed)
opt.signcolumn = "yes"         -- Reserve gutter space for diagnostics/signs
