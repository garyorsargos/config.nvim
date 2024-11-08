local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Base Functionality
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- File Explorer
  use 'nvim-tree/nvim-web-devicons' -- Special Icons for File Explorer
  use 'nvim-tree/nvim-tree.lua' -- File Explorer

  -- Themes
  use "lunarvim/colorschemes" -- Set of Colorschemes from LunarVim Community
  use "bluz71/vim-moonfly-colors" -- Personal Favorite Colorscheme

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp' -- LSP completion

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use 'saadparwaiz1/cmp_luasnip' -- AutoComplete for luaSnips

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- Fuzzy Finder
  use "nvim-telescope/telescope-media-files.nvim" -- Media Extension for Fuzzy Finder

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter", -- Better Syntax Highlighting
    run = ":TSUpdate",
  }

  -- Autopair
  use {
    "windwp/nvim-autopairs", -- Autopairing Brackets etc.
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }
  use 'windwp/nvim-ts-autotag' -- Autopairing HTML tags

  -- GitIntegration --
  -- GitSigns
  use {
    "lewis6991/gitsigns.nvim", -- Git Blame Tracking on Sidelines
    config = function()
        require('gitsigns').setup {}
    end
  }

  -- StatusLine
  use {
  'nvim-lualine/lualine.nvim', -- Lightweight Status Line Implementation
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Floating CommandLine
  use {
  'VonHeikemen/fine-cmdline.nvim',
  requires = {
    {'MunifTanjim/nui.nvim'}
    }
  }

  use {
    'MunifTanjim/prettier.nvim' -- Prettier LSP Formatter
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
