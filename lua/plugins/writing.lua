-- writing.lua
return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start        = 0
      vim.g.mkdp_auto_close        = 1
      vim.g.mkdp_refresh_slow      = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip           = ""
      vim.g.mkdp_browser           = ""
      vim.g.mkdp_echo_preview_url  = 0
      vim.g.mkdp_browserfunc       = ""
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml   = {},
        maid  = {},
        disable_sync_scroll = 0,
        sync_scroll_type    = "middle",
        hide_yaml_meta      = 1,
        sequence_diagrams   = {},
        flowchart_diagrams  = {},
        content_editable    = false,
        disable_filename    = 1,
      }

      -- Markdown Preview keybinds
      vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>",     { desc = "Toggle markdown preview" })
      vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })
      vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "text" },
    config = function()
      vim.g.table_mode_corner = "|"
      -- Table mode keybinds
      vim.keymap.set("n", "<leader>tm", "<cmd>TableModeToggle<CR>",  { desc = "Toggle table mode" })
      vim.keymap.set("n", "<leader>tr", "<cmd>TableModeRealign<CR>", { desc = "Realign table" })
    end,
  },
  {
    "preservim/vim-pencil",
    ft = { "markdown", "text" },
    config = function()
      vim.g["pencil#wrapModeDefault"] = "soft"
      vim.g["pencil#textwidth"]      = 74
      vim.g["pencil#joinspaces"]     = 0
      vim.g["pencil#cursorwrap"]     = 1

      -- Pencil mode keybinds
      vim.keymap.set("n", "<leader>wp", "<cmd>Pencil<CR>",     { desc = "Toggle pencil mode" })
      vim.keymap.set("n", "<leader>wh", "<cmd>HardPencil<CR>", { desc = "Toggle hard pencil mode" })
      vim.keymap.set("n", "<leader>ws", "<cmd>SoftPencil<CR>", { desc = "Toggle soft pencil mode" })
    end,
  },
}
