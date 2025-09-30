return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      "zbirenbaum/copilot.lua", -- or github/copilot.vim
      "nvim-lua/plenary.nvim", -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({
        -- Context settings
        context = {
          -- Include current file in context
          current_file = true,
          -- Include project files in context
          project_files = true,
          -- Include git information
          git_info = true,
          -- Include LSP diagnostics
          diagnostics = true,
        },
        -- Selection modes
        selection = {
          -- Default selection mode
          default = "buffer", -- "buffer", "project", "git"
        },
        -- Window configuration - always open on the right
        window = {
          layout = "vertical",
          width = 0.4, -- 40% of screen width
          relative = "editor",
          border = "rounded",
          row = 0,
          col = 0.6, -- Start at 60% from left (right side)
          title = "Copilot Chat",
          footer = " ",
          -- Ensure it opens on the right side
          position = "right",
        },
        -- Keymaps configuration
        keymaps = {
          -- Disable default keymaps that conflict
          close = { "<C-c>", "<Esc>" },
          reset = { "<C-r>" },
          submit_prompt = { "<C-s>", "<CR>" },
          accept_diff = { "<C-y>" },
          yank_diff = { "gy" },
          show_diff = { "<C-d>" },
          show_system_prompt = { "<C-p>" },
          show_user_selection = { "<C-u>" },
        },
      })
      
      -- Inline chat with Copilot
      vim.api.nvim_create_user_command("CopilotChatInline", function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end, { desc = "CopilotChat - Quick chat" })

      -- Keymaps for CopilotChat
      vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "CopilotChat - Open chat panel" })
      vim.keymap.set("n", "<leader>cq", ":CopilotChatInline<CR>", { desc = "CopilotChat - Quick inline chat" })
      vim.keymap.set("n", "<leader>cd", ":CopilotChatExplain<CR>", { desc = "CopilotChat - Explain code" })
      vim.keymap.set("n", "<leader>cr", ":CopilotChatReview<CR>", { desc = "CopilotChat - Review code" })
      vim.keymap.set("n", "<leader>cf", ":CopilotChatFix<CR>", { desc = "CopilotChat - Fix code" })
      vim.keymap.set("n", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "CopilotChat - Optimize code" })
      vim.keymap.set("n", "<leader>ct", ":CopilotChatTests<CR>", { desc = "CopilotChat - Generate tests" })
      
      -- Close chat keymap
      vim.keymap.set("n", "<leader>cx", ":CopilotChatClose<CR>", { desc = "CopilotChat - Close chat panel" })
      
      -- Add alternative close keymaps for chat
      vim.keymap.set("n", "<C-w>", ":CopilotChatClose<CR>", { desc = "CopilotChat - Close chat panel" })
      vim.keymap.set("n", "<C-q>", ":CopilotChatClose<CR>", { desc = "CopilotChat - Close chat panel" })
      
      -- Context-specific keymaps
      vim.keymap.set("n", "<leader>cp", function()
        require("CopilotChat").ask(vim.fn.input("Project Chat: "), { selection = require("CopilotChat.select").project })
      end, { desc = "CopilotChat - Chat with project context" })
      
      vim.keymap.set("n", "<leader>cb", function()
        require("CopilotChat").ask(vim.fn.input("Buffer Chat: "), { selection = require("CopilotChat.select").buffer })
      end, { desc = "CopilotChat - Chat with buffer context" })
      
      vim.keymap.set("n", "<leader>cg", function()
        require("CopilotChat").ask(vim.fn.input("Git Chat: "), { selection = require("CopilotChat.select").git })
      end, { desc = "CopilotChat - Chat with git context" })
      
      -- Visual mode keymaps
      vim.keymap.set("v", "<leader>cc", ":CopilotChat<CR>", { desc = "CopilotChat - Open chat panel" })
      vim.keymap.set("v", "<leader>cq", ":CopilotChatInline<CR>", { desc = "CopilotChat - Quick inline chat" })
      vim.keymap.set("v", "<leader>cp", function()
        require("CopilotChat").ask(vim.fn.input("Project Chat: "), { selection = require("CopilotChat.select").project })
      end, { desc = "CopilotChat - Chat with project context" })
    end,
  },
}
