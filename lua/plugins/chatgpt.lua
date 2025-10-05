 return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "folke/trouble.nvim",
    },
    config = function()
      require("chatgpt").setup({
        -- API configuration - disabled CodeLlama
        api_key_cmd = "echo 'disabled'", -- Disabled API
        api_base_url = "http://localhost:11434/v1",
        model = "gpt-3.5-turbo", -- Using GPT instead of CodeLlama
        
        -- Chat configuration
        chat = {
          welcome_message = "Hello! I'm ChatGPT, ready to help with your coding tasks.",
          loading_text = "Thinking...",
          question_sign = "?",
          answer_sign = "A",
          border_left_sign = "│",
          border_right_sign = "│",
          max_line_length = 120,
          sessions_window = {
            border = {
              style = "rounded",
              text = {
                top = " Sessions ",
              },
            },
            win_options = {
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            },
          },
          keymaps = {
            close = { "<C-c>", "<Esc>" },
            yank_last = "<C-y>",
            yank_last_code = "<C-k>",
            scroll_up = "<C-u>",
            scroll_down = "<C-d>",
            new_session = "<C-n>",
            cycle_windows = "<Tab>",
            select_session = "<Space>",
            rename_session = "r",
            delete_session = "d",
          },
        },
        
        -- Popup window configuration
        popup_window = {
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top = " ChatGPT ",
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
          },
        },
        
        -- Popup input configuration
        popup_input = {
          prompt = "  ",
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top_align = "center",
              top = " Prompt ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
          submit = "<C-s>",
          submit_n = "<Enter>",
          max_visible_lines = 20,
        },
        
        -- Settings
        openai_params = {
          model = "gpt-3.5-turbo", -- Using GPT instead of CodeLlama
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 1000,
          temperature = 0.1,
          top_p = 0.3,
        },
        
        use_openai_functions_for_edits = false,
        actions_paths = {},
        show_quickfixes_cmd = "Trouble quickfixes",
        predefined_actions = {
          explain_code = {
            prompt = "Please explain how the selected code works.",
            require_selection = true,
            extract = "```lua:```",
          },
          review_code = {
            prompt = "Please review the selected code and provide suggestions for improvement.",
            require_selection = true,
            extract = "```lua:```",
          },
          fix_code = {
            prompt = "Please fix the selected code.",
            require_selection = true,
            extract = "```lua:```",
          },
          optimize_code = {
            prompt = "Please optimize the selected code.",
            require_selection = true,
            extract = "```lua:```",
          },
          add_tests = {
            prompt = "Please add tests for the selected code.",
            require_selection = true,
            extract = "```lua:```",
          },
          fix_grammar = {
            prompt = "Please fix the grammar of the selected text.",
            require_selection = true,
            extract = "```lua:```",
          },
          translate = {
            prompt = "Please translate the selected text to English.",
            require_selection = true,
            extract = "```lua:```",
          },
        },
      })
      
      -- Keymaps for ChatGPT
      vim.keymap.set("n", "<leader>ac", ":ChatGPT<CR>", { desc = "ChatGPT - Open chat" })
      vim.keymap.set("n", "<leader>ae", ":ChatGPTEditWithInstruction<CR>", { desc = "ChatGPT - Edit with instruction" })
      vim.keymap.set("n", "<leader>ar", ":ChatGPTRun explain_code<CR>", { desc = "ChatGPT - Explain code" })
      vim.keymap.set("n", "<leader>af", ":ChatGPTRun fix_code<CR>", { desc = "ChatGPT - Fix code" })
      vim.keymap.set("n", "<leader>ao", ":ChatGPTRun optimize_code<CR>", { desc = "ChatGPT - Optimize code" })
      vim.keymap.set("n", "<leader>at", ":ChatGPTRun add_tests<CR>", { desc = "ChatGPT - Generate tests" })
      vim.keymap.set("n", "<leader>ad", ":ChatGPTRun review_code<CR>", { desc = "ChatGPT - Review code" })
      
      -- Visual mode keymaps
      vim.keymap.set("v", "<leader>ac", ":ChatGPT<CR>", { desc = "ChatGPT - Open chat with selection" })
      vim.keymap.set("v", "<leader>ae", ":ChatGPTEditWithInstruction<CR>", { desc = "ChatGPT - Edit selection with instruction" })
      vim.keymap.set("v", "<leader>ar", ":ChatGPTRun explain_code<CR>", { desc = "ChatGPT - Explain selection" })
      vim.keymap.set("v", "<leader>af", ":ChatGPTRun fix_code<CR>", { desc = "ChatGPT - Fix selection" })
      vim.keymap.set("v", "<leader>ao", ":ChatGPTRun optimize_code<CR>", { desc = "ChatGPT - Optimize selection" })
      vim.keymap.set("v", "<leader>at", ":ChatGPTRun add_tests<CR>", { desc = "ChatGPT - Generate tests for selection" })
      vim.keymap.set("v", "<leader>ad", ":ChatGPTRun review_code<CR>", { desc = "ChatGPT - Review selection" })
    end,
  },
}
