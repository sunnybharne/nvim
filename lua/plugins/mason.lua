return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "nvim-lspconfig" },
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "omnisharp",
          "bicep",
          "terraformls",
          "tflint",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mason.nvim", "nvim-dap" },
    lazy = false,
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "debugpy",      -- Python debugger
          "netcoredbg",   -- C# debugger
        },
        automatic_installation = true,
      })
    end,
  },
}

