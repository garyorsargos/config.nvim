local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Movement keys (jkl; instead of hjkl)
keymap("n", "j", "h", opts)  -- Left
keymap("n", "k", "j", opts)  -- Down
keymap("n", "l", "k", opts)  -- Up
keymap("n", ";", "l", opts)  -- Right

-- Also set these for visual and insert modes
keymap("v", "j", "h", opts)
keymap("v", "k", "j", opts)
keymap("v", "l", "k", opts)
keymap("v", ";", "l", opts)

keymap("i", "j", "h", opts)
keymap("i", "k", "j", opts)
keymap("i", "l", "k", opts)
keymap("i", ";", "l", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Clear search highlights
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
keymap("n", "<leader>lg", builtin.live_grep, { desc = "[L]ive [G]rep" })
keymap("n", "<leader>b", builtin.buffers, { desc = "[B]uffers" })
keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

-- NvimTree
keymap("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" }) 