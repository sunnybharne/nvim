return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",  -- Load when `:Copilot` is used
    event = "InsertEnter",  -- Start in insert mode
    config = function()
      require("copilot").setup({
        panel = { enabled = false }, -- Disable suggestion panel
        suggestion = {
          enabled = true,
          auto_trigger = true, -- Auto-show suggestions as you type
          keymap = {
            accept = "<Tab>",  -- Use <Tab> to accept suggestions
            next = "<C-n>",    -- Next suggestion
            prev = "<C-p>",    -- Previous suggestion
            dismiss = "<C-c>", -- Dismiss suggestion
          },
        },
      })
    end,
  },
  {
   "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    }
  }
}
