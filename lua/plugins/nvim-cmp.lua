
return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local cmp = require('cmp')

      -- Set highlight groups for better visibility
      vim.cmd [[
        " Background color (match your tmux bar)
        highlight! Pmenu guibg=#0f1a0e guifg=#a6e3a1  

        " Selection color (brighter green)
        highlight! PmenuSel guibg=#a6e3a1 guifg=#000000  

        " Border color (match Tmux border/status)
        highlight! PmenuBorder guifg=#a6e3a1 guibg=#0f1a0e  

        " Scroll bar color
        highlight! PmenuThumb guibg=#a6e3a1  
      ]]

      -- Setup nvim-cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded", -- Rounded edges for a smoother look
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,Search:None"
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,Search:None"
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'copilot' },
          { name = "terraformls" },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = "buffer" },
          { name = 'path' },
        })
      })
    end
  },
  -- Add Copilot plugin dependencies
  {
    'zbirenbaum/copilot.lua',
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
