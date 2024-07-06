return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      require("catppuccin").setup()
      require("catppuccin.palettes").get_palette "mocha"
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({})
    end
  },
}
