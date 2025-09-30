return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern", -- clean single-line message at cursor
        options = {
          signs = true,
          show_source = true,
          show_code = true,
        },
      })
    end,
  },
}


