return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = { italic = true },
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        },
        overrides = function(colors)
          return {
            NormalFloat = { bg = colors.theme.ui.bg_m1 },
            FloatBorder = { bg = colors.theme.ui.bg_m1, fg = colors.theme.ui.bg_m1 },
            FloatTitle = { bg = colors.theme.ui.bg_m1, fg = colors.theme.ui.special },
          }
        end,
        theme = "dragon", -- Load "dragon" theme when calling `colorscheme kanagawa`
      })
      
      -- Set the darkest variant (dragon)
      vim.cmd.colorscheme("kanagawa")
    end
  }
} 