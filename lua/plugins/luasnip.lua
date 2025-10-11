return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    
    -- Load custom snippets
    require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/snippets" } })
    
    -- Set up keymaps for snippet navigation
    local luasnip = require("luasnip")
    
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { desc = "LuaSnip expand or jump next" })
    
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { desc = "LuaSnip jump previous" })
    
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, { desc = "LuaSnip change choice" })
  end,
}