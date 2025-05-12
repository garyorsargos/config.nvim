-- Load configuration modules
require("config.options")
require("config.lazy")

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
	spec = {
		{ import = "plugins.core" },
		{ import = "plugins.completion" },
		{ import = "plugins.lsp" },
		{ import = "plugins.telescope" },
		{ import = "plugins.git" },
		{ import = "plugins.null-ls" },
		{ import = "plugins.writing" },
		{ import = "plugins.lazygit" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	install = { colorscheme = { "moonfly" } },
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- Load keymaps after plugins are initialized
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		-- Ensure leader key is set
		vim.g.mapleader = " "
		vim.g.maplocalleader = " "

		-- Load keymaps
		require("config.keymaps")
	end,
})
