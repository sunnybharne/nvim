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

      -- LuaSnip keymaps (as per official documentation)
      vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() luasnip.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, {silent = true})

      -- Smart Tab mapping for LuaSnip and nvim-cmp
      vim.keymap.set({"i", "s"}, "<Tab>", function()
        if luasnip.expand_or_jumpable() then
          return luasnip.expand_or_jump()
        elseif luasnip.jumpable(1) then
          return luasnip.jump(1)
        else
          return "<Tab>"
        end
      end, { expr = true, silent = true })

      vim.keymap.set({"i", "s"}, "<S-Tab>", function()
        if luasnip.jumpable(-1) then
          return luasnip.jump(-1)
        else
          return "<S-Tab>"
        end
      end, { expr = true, silent = true })

      -- Additional navigation keys for better snippet control
      -- Note: <C-L> and <C-J> are already defined above for snippet navigation

      -- Exit snippet completely
      vim.keymap.set({"i", "s"}, "<C-c>", function()
        if luasnip.get_active_snippet() then
          luasnip.unlink_current()
        end
      end, { silent = true })

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
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger manual completion
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
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
