return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500 -- Increased from 300 to 500ms for more time to type
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
    })

    -- Register key groups
    wk.add({
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>t", group = "Tabs/Git" },
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Copilot Chat" },
      { "<leader>d", group = "Diffview/Diagnostics" },
      { "<leader>h", group = "Git Hunks" },
      { "<leader>l", group = "LazyGit/LSP" },
      { "<leader>n", group = "Neogit" },
      { "<leader>w", group = "Workspace" },
      { "<leader>m", group = "Markdown" },
      { "<leader>g", group = "Git" },
      { "<leader>a", group = "AI Assistant" },
      { "<leader>s", group = "Sidekick/Swap" },
    })
  end,
}
