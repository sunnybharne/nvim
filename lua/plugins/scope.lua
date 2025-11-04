return {
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("scope").setup({})

      -- Load scope extension for Telescope
      require("telescope").load_extension("scope")
    end,
    keys = {
      {
        "<leader>bs",
        "<cmd>Telescope scope buffers<cr>",
        desc = "Scope buffers (all tabs)",
      },
      {
        "<leader>bm",
        function()
          local tab_nr = vim.fn.input("Move buffer to tab: ")
          if tab_nr ~= "" then
            vim.cmd("ScopeMoveBuf " .. tab_nr)
          end
        end,
        desc = "Move buffer to tab",
      },
    },
  },
}
