local lazy_config = {
  defaults = {
    lazy = true, -- Should plugins be lazy-loaded?
  },
  install = {
    -- Try to load colorscheme when installing plugins
    colorscheme = { "habamax" },
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- Reset the package path to improve startup time
    rtp = {
      reset = true, -- Reset the runtime path to $VIMRUNTIME and the config directory
      -- Disable some rtp plugins
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
  -- Enable profiling of lazy.nvim. This will add some overhead,
  -- so only enable this when debugging
  profiling = {
    -- Enables extra stats on the debug tab related to the loader cache.
    -- Additionally gathers stats about all package.loaders
    loader = false,
    -- Track each new require in the Lazy profiling tab
    require = false,
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
  },
  -- Enable checking for plugin updates
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    -- get a notification when new updates are found
    notify = true,
    -- check for updates every day
    frequency = 86400,
  },
}

require("lazy").setup("plugins", lazy_config) 