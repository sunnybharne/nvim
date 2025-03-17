return {
  "folke/tokyonight.nvim",
  lazy = false, -- Load immediately
  priority = 1000, -- Ensure this is loaded before other plugins
  opts = {
    transparent = true,
    styles = { sidebars = "transparent", floats = "transparent" },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts) -- Apply options
    vim.cmd.colorscheme("tokyonight") -- Set colorscheme
  end,
}

