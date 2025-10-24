return {
  "folke/sidekick.nvim",
  lazy = false,                        -- Load immediately to avoid conflicts
  dependencies = {
    "neovim/nvim-lspconfig",           -- Already in your setup
    "nvim-treesitter/nvim-treesitter", -- Already in your setup
  },
  opts = {
    -- Next Edit Suggestions configuration (disabled for now)
    nes = {
      enabled = false, -- Disable until Copilot LSP is properly configured
    },

    -- AI CLI Integration
    cli = {
      -- Enable tmux multiplexer (you have tmux configured)
      mux = {
        enabled = true,
        backend = "tmux", -- Use tmux for session persistence
      },

      -- Window configuration
      win = {
        relative = "editor",
        position = "bottom",
        size = 0.3, -- 30% of screen height
        border = "rounded",
        title = "AI Sidekick",
        keys = {
          -- Custom keymaps for CLI window
          { "q",      function(t) t:hide() end,                         mode = "n",          desc = "Hide terminal" },
          { "<c-q>",  function(t) t:hide() end,                         mode = "t",          desc = "Hide terminal" },
          { "<c-w>p", "<c-\\><c-n><c-w>p",                              mode = "t",          desc = "Go to previous window" },
          { "<c-p>",  function(t) require("sidekick.cli").prompt() end, mode = { "n", "t" }, desc = "Insert prompt" },
        },
      },

      -- Custom prompts that work well with your setup
      prompts = {
        explain = "Please explain {this} in detail",
        refactor = "Please refactor {this} to be more readable and maintainable",
        optimize = "Please optimize {this} for better performance",
        test = "Please write comprehensive tests for {this}",
        document = "Please add proper documentation for {this}",
        bicep = "Help me with this Bicep template: {this}",
        terraform = "Help me with this Terraform configuration: {this}",
        debug = "Help me debug this issue in {this}. Here are the diagnostics: {diagnostics}",
        security = "Please review {this} for security vulnerabilities",
        fix = "Please fix the issues in {this}. Problems: {diagnostics}",
      },

      -- Tools configuration (will auto-detect installed ones)
      tools = {
        -- Configure specific tools if needed
        claude = {
          name = "Claude",
          cmd = { "claude" },
          desc = "Claude AI Assistant",
        },
        copilot = {
          name = "Copilot CLI",
          cmd = { "gh", "copilot" },
          desc = "GitHub Copilot CLI",
        },
      },

      -- Selector configuration to avoid mini.pick conflicts
      selector = function(items, opts)
        local ok, telescope = pcall(require, "telescope.pickers")
        if ok then
          local finders = require("telescope.finders")
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")
          local conf = require("telescope.config").values

          telescope.new(opts or {}, {
            prompt_title = opts.prompt or "Select",
            finder = finders.new_table({
              results = items,
              entry_maker = function(entry)
                return {
                  value = entry,
                  display = entry.name or tostring(entry),
                  ordinal = entry.name or tostring(entry),
                }
              end,
            }),
            sorter = conf.generic_sorter(opts or {}),
            attach_mappings = function(prompt_bufnr, map)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection and opts.on_select then
                  opts.on_select(selection.value)
                end
              end)
              return true
            end,
          }):find()
        else
          -- Fallback to vim.ui.select
          vim.ui.select(items, opts, opts.on_select)
        end
      end,
    },

    -- Statusline integration (works with your lualine setup)
    status = {
      enabled = true,
    },
  },

  keys = {
    -- Next Edit Suggestions keymaps
    {
      "<Tab>",
      function()
        -- Enhanced Tab behavior that works with your nvim-cmp setup
        if not require("sidekick").nes_jump_or_apply() then
          -- Fallback to completion if available, otherwise normal tab
          local cmp = pcall(require, "cmp")
          if cmp and require("cmp").visible() then
            return require("cmp").select_next_item()
          else
            return "<Tab>"
          end
        end
      end,
      expr = true,
      desc = "Sidekick: Jump/Apply NES or Fallback",
      mode = { "i", "s" },
    },

    -- NES specific keymaps
    { "<leader>sa", function() require("sidekick.nes").apply() end,  desc = "Sidekick: Apply Edit" },
    { "<leader>sc", function() require("sidekick.nes").clear() end,  desc = "Sidekick: Clear Edits" },
    { "<leader>sj", function() require("sidekick.nes").jump() end,   desc = "Sidekick: Jump to Edit" },
    { "<leader>st", function() require("sidekick.nes").toggle() end, desc = "Sidekick: Toggle NES" },
    { "<leader>su", function() require("sidekick.nes").update() end, desc = "Sidekick: Update NES" },

    -- AI CLI keymaps (integrated with your existing leader key setup)
    {
      "<leader>aa",
      function()
        local ok, sidekick = pcall(require, "sidekick.cli")
        if ok then
          sidekick.toggle()
        else
          vim.notify("Sidekick CLI not available", vim.log.levels.WARN)
        end
      end,
      desc = "Sidekick: Toggle AI CLI"
    },
    {
      "<leader>as",
      function()
        local ok, sidekick = pcall(require, "sidekick.cli")
        if ok then
          sidekick.select()
        else
          vim.notify("Sidekick CLI not available", vim.log.levels.WARN)
        end
      end,
      desc = "Sidekick: Select AI Tool"
    },
    { "<leader>ad", function() require("sidekick.cli").close() end,                                    desc = "Sidekick: Close AI Session" },
    { "<leader>ap", function() require("sidekick.cli").prompt() end,                                   desc = "Sidekick: Select Prompt",        mode = { "n", "x" } },

    -- Context-aware sending (works great with your file types)
    { "<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end,                   desc = "Sidekick: Send Current Context", mode = { "n", "x" } },
    { "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end,                   desc = "Sidekick: Send File" },
    { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end,              desc = "Sidekick: Send Selection",       mode = "x" },

    -- Quick access to specific AI tools
    { "<leader>ac", function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,  desc = "Sidekick: Open Claude" },
    { "<leader>ag", function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end, desc = "Sidekick: Open Copilot CLI" },

    -- Integration with diagnostics (works with your LSP setup)
    {
      "<leader>aD",
      function()
        require("sidekick.cli").send({
          msg = "Help me fix these issues:\n{diagnostics}\n\nIn this code:\n{this}"
        })
      end,
      desc = "Sidekick: Send Diagnostics"
    },
  },

  config = function(_, opts)
    require("sidekick").setup(opts)

    -- Ensure keymaps are available immediately
    vim.keymap.set("n", "<leader>aa", function()
      local ok, cli = pcall(require, "sidekick.cli")
      if ok then
        cli.toggle()
      else
        vim.notify("Sidekick CLI not available", vim.log.levels.WARN)
      end
    end, { desc = "Sidekick: Toggle AI CLI" })

    -- Integration with which-key (you have which-key configured)
    local wk = require("which-key")
    wk.add({
      { "<leader>s", group = "Sidekick" },
      { "<leader>a", group = "AI Assistant" },
    })

    -- Optional: Add statusline component to lualine
    -- This can be added to your lualine config
    --[[
    require("lualine").setup({
      sections = {
        lualine_x = {
          function()
            return require("sidekick.status").copilot()
          end,
          function()
            return require("sidekick.status").cli()
          end,
        }
      }
    })
    --]]
  end,
}

