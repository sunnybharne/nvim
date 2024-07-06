return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/code/*",
      "~/.config/nvim",
    },
  },
  init = function()
    vim.opt.sessionoptions:append("globals")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,

}
