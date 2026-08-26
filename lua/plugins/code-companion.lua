local github_models_adapter = "papliba_githubmodels"

return {
  "olimorris/codecompanion.nvim",
  tag = "v17.33.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
  },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    { "<leader>ci", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion Inline" },
    { "<leader>cmd", "<cmd>CodeCompanionCmd<cr>", desc = "CodeCompanion Command" },
    { "<leader>cc", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Selection to CodeCompanion" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = "v", desc = "CodeCompanion Actions" },
    { "<leader>ci", "<cmd>CodeCompanion<cr>", mode = "v", desc = "CodeCompanion Inline" },
  },
  opts = function()
    local secrets = require("config.secrets")

    local function setup_github_models(self)
      local model = self.schema.model.default
      local model_opts = self.schema.model.choices[model]
      if model_opts and model_opts.opts then
        self.opts = vim.tbl_deep_extend("force", self.opts, model_opts.opts)
      end

      if self.opts and self.opts.stream then
        self.parameters.stream = true
      end

      local token, err = secrets.github_token()
      if not token then
        vim.notify("CodeCompanion: " .. err, vim.log.levels.ERROR)
        return false
      end

      return true
    end

    return {
      adapters = {
        http = {
          [github_models_adapter] = function()
            return require("codecompanion.adapters").extend("githubmodels", {
              name = github_models_adapter,
              formatted_name = "GitHub Models (Papliba)",
              env = {
                api_key = function()
                  return secrets.github_token()
                end,
              },
              handlers = {
                setup = setup_github_models,
              },
            })
          end,
        },
      },
      strategies = {
        chat = {
          adapter = github_models_adapter,
        },
        inline = {
          adapter = github_models_adapter,
        },
        cmd = {
          adapter = github_models_adapter,
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
