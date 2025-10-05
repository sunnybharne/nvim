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
        window = {
          layout = 'vertical',
          width = 0.3, -- 30% of screen width (smaller)
          border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
          title = '🤖 AI Assistant',
        },

        headers = {
          user = '👤 You',
          assistant = '🤖 Copilot',
          tool = '🔧 Tool',
        },

        separator = '━━',
        auto_fold = true, -- Automatically folds non-assistant messages
        show_help = true, -- Show help text
        mappings = {
          complete = {
            detail = 'Use @codebase to search the codebase',
            diff = 'Use @diff to generate a diff',
          },
        },
        -- Auto-include current buffer context
        context = {
          buffer = true, -- Include current buffer content
          selection = true, -- Include selected text
          filetype = true, -- Include file type information
        },
      })
      
      -- Custom function to open chat with automatic context on the right
      local function open_chat_with_context()
        local current_file = vim.fn.expand('%:t')
        local filetype = vim.bo.filetype
        local context_message = string.format("Context: Working on %s (%s file). Please help with this code.", current_file, filetype)
        
        -- Open CopilotChat first
        vim.cmd("CopilotChat")
        -- Move the window to the right and resize after a longer delay
        vim.defer_fn(function()
          vim.cmd("wincmd L") -- Move current window to the right
          vim.cmd("CopilotChat " .. context_message)
        end, 100)
        
        -- Resize after the chat is fully loaded
        vim.defer_fn(function()
          vim.cmd("vertical resize 70%") -- Resize to 40% of screen width
        end, 500)
      end
      
      -- Enhanced keymaps for Vim nerds
      vim.keymap.set("n", "<leader>cc", open_chat_with_context, { desc = "CopilotChat - Open chat with context" })
      vim.keymap.set("n", "<leader>cq", ":CopilotChatClose<CR>", { desc = "CopilotChat - Close chat" })
      vim.keymap.set("n", "<leader>ct", ":CopilotChatToggle<CR>", { desc = "CopilotChat - Toggle chat" })
      vim.keymap.set("n", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "CopilotChat - Explain code" })
      vim.keymap.set("n", "<leader>cf", ":CopilotChatFix<CR>", { desc = "CopilotChat - Fix code" })
      vim.keymap.set("n", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "CopilotChat - Optimize code" })
      vim.keymap.set("n", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "CopilotChat - Generate docs" })
      vim.keymap.set("n", "<leader>ct", ":CopilotChatTests<CR>", { desc = "CopilotChat - Generate tests" })
      
      -- Auto-command to customize chat buffer behavior
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
          vim.opt_local.conceallevel = 0
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.spell = false
          vim.opt_local.signcolumn = 'no'
        end,
      })
      
      -- Enhanced color scheme for Vim nerds
      vim.api.nvim_set_hl(0, 'CopilotChatHeader', { 
        fg = '#7C3AED', 
        bold = true, 
        italic = true,
        bg = '#1e1e2e'
      })
      vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { 
        fg = '#374151',
        bold = false
      })
      vim.api.nvim_set_hl(0, 'CopilotChatUser', { 
        fg = '#10b981',
        bold = true
      })
      vim.api.nvim_set_hl(0, 'CopilotChatAssistant', { 
        fg = '#f59e0b',
        bold = true
      })
      vim.api.nvim_set_hl(0, 'CopilotChatTool', { 
        fg = '#ef4444',
        bold = true
      })
      
      -- Custom statusline for chat buffers
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        callback = function()
          vim.opt_local.statusline = '🤖 Copilot Chat | %f | %l/%L'
        end,
      })
    end,
  },
}
