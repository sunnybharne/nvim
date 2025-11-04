return {
  {
    "stevearc/resession.nvim",
    event = "VeryLazy",
    config = function()
      local resession = require("resession")
      resession.setup({
        -- Configuration options
        extensions = {
          scope = {}, -- Enable scope.nvim integration
        },
      })
    end,
    keys = {
      {
        "<leader>ss",
        function()
          require("resession").save()
        end,
        desc = "Save session",
      },
      {
        "<leader>sl",
        function()
          require("resession").load()
        end,
        desc = "Load session",
      },
      {
        "<leader>sd",
        function()
          require("resession").delete()
        end,
        desc = "Delete session",
      },
      {
        "<leader>st",
        function()
          require("resession").save_tab()
        end,
        desc = "Save tab session",
      },
      {
        "<leader>sL",
        function()
          require("resession").load_tab()
        end,
        desc = "Load tab session",
      },
    },
  },
}
