return  {
  {
    'hrsh7th/cmp-buffer'
  },
  {
    'hrsh7th/cmp-path'
  },
  {
    'hrsh7th/cmp-cmdline'
  },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'saadparwaiz1/cmp_luasnip'
  },
  {
    'rafamadriz/friendly-snippets'
  },
  {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- Keymaps
      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})

      -- Snippets
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/snippets" } })
      require('luasnip.loaders.from_lua').load({paths = "~/.config/nvim/lua/snippets"})
    end
  }
}
