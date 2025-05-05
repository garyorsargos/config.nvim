-- project.lua
return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns          = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
        show_hidden       = false,
        silent_chdir      = true,
      })

      -- Project keybinds
      vim.keymap.set("n", "<leader>rp", "<cmd>ProjectRoot<CR>",     { desc = "Change to project root" })
      vim.keymap.set("n", "<leader>sp", "<cmd>Telescope projects<CR>", { desc = "List recent projects" })
    end,
  },
}
