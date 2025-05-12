-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Force line numbers
vim.opt.number = true

-- Set global 2‑space indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

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
    { import = "plugins.project" },
    { import = "plugins.colorscheme" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "kanagawa" } },
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
    
    -- Set colorscheme
    vim.cmd.colorscheme("kanagawa")
  end,
})

-- Open nvim-tree when starting Neovim in a directory
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
  end,
}) 