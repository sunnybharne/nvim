return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codecompanion").setup({
      file_access = true,
      workspace_context = true,
      display = {
        chat = {
          window = {
            layout = "vertical",
            width = 0.25,
            height = 1.0,
            border = "double",
            position = "right",
            relative = "editor",
            opts = {
              wrap = true,
              linebreak = true,
              signcolumn = "no",
              number = true,
              relativenumber = true,
            },
          },
        },
      },
    })
  end,
}



