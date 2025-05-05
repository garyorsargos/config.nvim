-- General
vim.opt.mouse = "a"                       -- Enable mouse support
vim.opt.clipboard = "unnamedplus"         -- Use system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 0                  -- Make `` visible in markdown files
vim.opt.fileencoding = "utf-8"           -- File encoding
vim.opt.hidden = true                    -- Enable background buffers
vim.opt.history = 100                    -- Remember N lines in history
vim.opt.lazyredraw = true               -- Faster scrolling
vim.opt.synmaxcol = 240                 -- Max column for syntax highlight
vim.opt.updatetime = 250                -- Faster completion
vim.opt.timeoutlen = 300                -- Time to wait for a mapped sequence
vim.opt.expandtab = true                -- Use spaces instead of tabs
vim.opt.shiftwidth = 1                  -- Size of an indent
vim.opt.tabstop = 1                     -- Number of spaces tabs count for
vim.opt.cursorline = true              -- Highlight current line
vim.opt.number = true                   -- Show line numbers
vim.opt.relativenumber = false           -- Relative line numbers
vim.opt.numberwidth = 4                 -- Width of line numbers
vim.opt.signcolumn = "yes"             -- Always show the signcolumn
vim.opt.wrap = false                    -- Disable line wrap
vim.opt.scrolloff = 8                   -- Lines of context
vim.opt.sidescrolloff = 8              -- Columns of context
vim.opt.laststatus = 3                 -- Global statusline

-- Search
vim.opt.ignorecase = true              -- Ignore case in search patterns
vim.opt.smartcase = true               -- Override ignorecase if search contains capitals
vim.opt.incsearch = true               -- Use incremental search
vim.opt.hlsearch = true                -- Highlight search matches

-- Wild menu
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.wildoptions = "pum"           -- Show completion popup menu

-- Splits
vim.opt.splitbelow = true             -- Put new windows below current
vim.opt.splitright = true             -- Put new windows right of current

-- Appearance
vim.opt.termguicolors = true         -- True color support
vim.opt.background = "dark"          -- Default to dark theme

-- Backups
vim.opt.backup = false               -- Don't keep backup files
vim.opt.writebackup = false          -- Don't keep backup files during write
vim.opt.swapfile = false             -- Don't create swap files
vim.opt.undofile = true             -- Enable persistent undo
vim.opt.undolevels = 10000          -- Maximum number of changes that can be undone

-- Performance
vim.opt.redrawtime = 1500           -- Allow more time for loading syntax
vim.opt.timeoutlen = 1000           -- Time to wait for a mapped sequence
vim.opt.ttimeoutlen = 0             -- Time to wait for a key code sequence

-- Format options
vim.opt.formatoptions = vim.opt.formatoptions
  - "a"                             -- Auto formatting is BAD.
  - "t"                             -- Don't auto format my code.
  + "c"                             -- In general, I like it.
  + "q"                             -- Allow formatting comments w/ gq
  - "o"                             -- O and o, don't continue comments
  + "r"                             -- But do continue when pressing enter.
  + "n"                             -- Indent past the formatlistpat, not underneath it.
  + "j"                             -- Auto-remove comments if possible.
  - "2"                             -- I'm not in gradeschool anymore 