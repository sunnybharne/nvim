return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "neovim/nvim-lspconfig",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() luasnip.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, {silent = true})

      -- Load snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      require('luasnip.loaders.from_lua').load({paths = "~/.config/nvim/lua/snippets"})

      -- Add `capabilities` for LSP completion
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup nvim-cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Snippet expansion
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,Search:None"
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,Search:None"
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger manual completion
        }),

        sources = cmp.config.sources({
          { name = "copilot", priority = 1000 }, -- Copilot with highest priority
          { name = "nvim_lsp", priority = 900 }, -- LSP autocompletion
          { name = "luasnip", priority = 800 }, -- Snippets
          { name = "buffer", priority = 700 }, -- Buffer words
          { name = "path", priority = 600 }, -- Path suggestions
        })
      })
    end
  },

  -- GitHub Copilot Integration
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { 
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            next = "<C-n>",
            prev = "<C-p>",
            dismiss = "<C-c>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        method = "getCompletionsCycling",
        formatters = {
          label = require("copilot_cmp.format").format_label_text,
          insert_text = require("copilot_cmp.format").format_insert_text,
          preview = require("copilot_cmp.format").deindent,
        },
      })
    end,
  },
}
