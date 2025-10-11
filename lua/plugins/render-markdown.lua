return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "codecompanion" },
  config = function()
    require("render-markdown").setup({
      file_types = { "markdown", "codecompanion" },
    })
  end,
}
