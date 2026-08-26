local codex_acp_package = "@agentclientprotocol/codex-acp@1.6.2"

local function codex_acp_command()
  if vim.fn.executable("codex-acp") == 1 then
    return { "env", "-u", "OPENAI_API_KEY", "-u", "CODEX_API_KEY", "codex-acp" }
  end

  return { "env", "-u", "OPENAI_API_KEY", "-u", "CODEX_API_KEY", "npx", "-y", codex_acp_package }
end

return {
  "olimorris/codecompanion.nvim",
  tag = "v17.33.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "CodeCompanionActions",
    "CodeCompanionChat",
  },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    { "<leader>cc", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Selection to CodeCompanion" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = "v", desc = "CodeCompanion Actions" },
  },
  opts = function()
    return {
      adapters = {
        acp = {
          codex = function()
            local adapter = require("codecompanion.adapters").extend("codex", {
              commands = {
                default = codex_acp_command(),
              },
              defaults = {
                auth_method = "chat-gpt",
                timeout = 60000,
              },
            })

            adapter.env = {}
            return adapter
          end,
        },
      },
      strategies = {
        chat = {
          adapter = "codex",
        },
        inline = {
          adapter = "openai_responses",
        },
        cmd = {
          adapter = "openai_responses",
        },
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            width = 0.25,
            height = 1.0,
            border = "double",
            position = "right",
            relative = "editor",
            opts = {
              wrap = true,
              linebreak = true,
              signcolumn = "no",
              number = true,
              relativenumber = true,
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    require("codecompanion").setup(opts)
  end,
}
