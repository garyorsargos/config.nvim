-- lazygit.lua
-- Plugin configuration for kdheepak/lazygit.nvim via lazy.nvim

return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "LazyGit",
		keys = {
			{ "<leader>git", "<cmd>LazyGit<CR>", desc = "Open Lazygit" },
		},
		config = function()
			-- You can add further customizations here if desired
		end,
	},
}
