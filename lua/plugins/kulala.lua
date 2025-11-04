return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http", -- Load when opening .http files
    config = function()
      require("kulala").setup({
        -- Default settings
        default_view = "body", -- body|headers|headers_body
        default_env = "dev", -- default environment to use
        debug = false, -- enable debug mode
        -- Disable global keymaps (we'll define our own)
        -- global_keymaps = false,
      })
    end,
    keys = {
      {
        "<leader>Rs",
        function()
          require("kulala").run()
        end,
        desc = "Send HTTP request",
        ft = "http",
      },
      {
        "<leader>Rt",
        function()
          require("kulala").toggle_view()
        end,
        desc = "Toggle request/response view",
        ft = "http",
      },
      {
        "<leader>Rp",
        function()
          require("kulala").jump_prev()
        end,
        desc = "Jump to previous request",
        ft = "http",
      },
      {
        "<leader>Rn",
        function()
          require("kulala").jump_next()
        end,
        desc = "Jump to next request",
        ft = "http",
      },
      {
        "<leader>Rc",
        function()
          require("kulala").copy()
        end,
        desc = "Copy request as cURL",
        ft = "http",
      },
      {
        "<leader>Ri",
        function()
          require("kulala").inspect()
        end,
        desc = "Inspect current request",
        ft = "http",
      },
      {
        "<leader>Re",
        function()
          require("kulala").set_selected_env()
        end,
        desc = "Select environment",
        ft = "http",
      },
      {
        "<leader>Ra",
        function()
          require("kulala").run_all()
        end,
        desc = "Run all requests",
        ft = "http",
      },
      {
        "<leader>Rb",
        function()
          require("kulala").scratchpad()
        end,
        desc = "Open scratchpad",
        ft = "http",
      },
    },
  },
}
