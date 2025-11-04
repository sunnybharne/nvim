return {
  {
    "nvimdev/indentmini.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("indentmini").setup({
        -- Character to display for indent lines
        char = "│", -- Options: "│", "┊", "┆", "¦", "╎", "┋"

        -- Filetypes to exclude from showing indent lines
        exclude = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "markdown",
        },
      })

      -- Define highlight groups to match your colorscheme
      -- These colors can be customized to your preference
      vim.cmd([[
        highlight default link IndentLine Comment
        highlight default IndentLineCurrent guifg=#7aa2f7 gui=nocombine
      ]])
    end,
  },
}
