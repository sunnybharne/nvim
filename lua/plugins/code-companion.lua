return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ravitemer/mcphub.nvim",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  config = function()
    -- Configure MCP Hub first
    vim.g.mcphub = {
      config = "/Users/sunnybharne/.config/mcphub/servers.json",
      port = 37373,
    }

    require("mcphub").setup({
      global_env = {
          -- CUSTOM_VAR = "custom_value",
      },
      auto_approve = true,
    })

    require("codecompanion").setup({
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true
          }
        }
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
        }
      },
      -- Enable file access and workspace context
      file_access = true,
      workspace_context = true,
      -- Chat window configuration using the correct format
      display = {
        chat = {
          window = {
            layout = "vertical",  -- Use vertical split instead of float
            width = 0.25,         -- 25% of screen width (narrow)
            height = 1.0,         -- 100% of screen height (full height)
            border = "single",
            position = "right",   -- Right side
            relative = "editor",
            opts = {
              wrap = true,
              linebreak = true,
              signcolumn = "no",
              number = false,
              relativenumber = false,
            },
          },
        },
      },
    })

    -- Keymaps for CodeCompanion
    vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>", { desc = "CodeCompanion Chat" })
    vim.keymap.set("n", "<leader>ci", ":CodeCompanion<CR>", { desc = "CodeCompanion Inline" })
    vim.keymap.set("n", "<leader>cmd", ":CodeCompanionCmd<CR>", { desc = "CodeCompanion Command" })
    vim.keymap.set("n", "<leader>ca", ":CodeCompanionActions<CR>", { desc = "CodeCompanion Actions" })
    
    -- Visual mode keymaps
    vim.keymap.set("v", "<leader>cc", ":CodeCompanionChat<CR>", { desc = "CodeCompanion Chat (selection)" })
    vim.keymap.set("v", "<leader>ci", ":CodeCompanion<CR>", { desc = "CodeCompanion Inline (selection)" })
  end
}

