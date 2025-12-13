-- Plugin specification for codecompanion.nvim
return {
  -- Main plugin repository
  "olimorris/codecompanion.nvim",
  -- Pin to version v17.33.0 to avoid breaking changes
  tag = "v17.33.0",
  -- Plugin options (empty for now, can be customized)
  opts = {},
  -- Required dependencies for codecompanion.nvim
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- Plugin configuration function
  config = function()
    -- Setup codecompanion with custom options
    require("codecompanion").setup({
      file_access = true,           -- Allow file access for code companion
      workspace_context = true,     -- Enable workspace context awareness
      adapters = {
        http = {
          copilot = "copilot",
        },
      },
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
        },
      },
      display = {
        chat = {
          window = {
            layout = "vertical",   -- Chat window layout
            width = 0.25,           -- Chat window width (25% of editor)
            height = 1.0,           -- Chat window height (full editor height)
            border = "double",     -- Double border for chat window
            position = "right",    -- Position chat window on the right
            relative = "editor",   -- Relative to the editor
            opts = {
              wrap = true,          -- Enable line wrapping
              linebreak = true,    -- Break lines at word boundaries
              signcolumn = "no",  -- Hide sign column
              number = true,       -- Show line numbers
              relativenumber = true, -- Show relative line numbers
            },
          },
        },
      },
      prompt_library = {
        ["My New Prompt"] = {
          strategy = "chat",
          description = "Some cool custom prompt you can do",
          prompts = {
            {
              role = "system",
              content = "You are an experienced developer with Lua and Neovim",
            },
            {
              role = "user",
              content = "Can you explain why ..."
            }
          },
        }
      },
    })

    -- Keybindings for codecompanion.nvim
    vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>", { desc = "CodeCompanion Chat" })           -- Open chat in normal mode
    vim.keymap.set("n", "<leader>ci", ":CodeCompanion<CR>", { desc = "CodeCompanion Inline" })              -- Inline code companion in normal mode
    vim.keymap.set("n", "<leader>cmd", ":CodeCompanionCmd<CR>", { desc = "CodeCompanion Command" })         -- Run code companion command
    vim.keymap.set("n", "<leader>ca", ":CodeCompanionActions<CR>", { desc = "CodeCompanion Actions" })      -- Show code companion actions
    vim.keymap.set("v", "<leader>cc", ":CodeCompanionChat<CR>", { desc = "CodeCompanion Chat (selection)" }) -- Chat for visual selection
    vim.keymap.set("v", "<leader>ci", ":CodeCompanion<CR>", { desc = "CodeCompanion Inline (selection)" })    -- Inline for visual selection
  end
}
