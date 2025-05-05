return {
  -- Essential plugins
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })

      -- Open NvimTree when opening a directory
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
    end,
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- Keybindings
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add file to harpoon" })
      vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon list" })

      -- Quick access keybindings
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, function() harpoon:list():select(i) end, { desc = "Go to harpoon mark " .. i })
      end
    end
  },

  -- Colorschemes
  { "lunarvim/colorschemes" },
  {
    "bluz71/vim-moonfly-colors",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("moonfly")
    end,
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "moonfly",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
      })
    end,
  },

  -- Command Line
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("fine-cmdline").setup({
        cmdline = {
          enable_keymaps = true,
          smart_history = true,
          prompt = ":",
        },
        popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = "60%",
          },
          border = {
            style = "rounded",
          },
        },
      })
    end,
  },
} 