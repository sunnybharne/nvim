return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      "zbirenbaum/copilot.lua", -- or github/copilot.vim
      "nvim-lua/plenary.nvim", -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({})
      
      -- Keymap to open copilot chat
      vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "CopilotChat - Open chat panel" })
    end,
  },
}
