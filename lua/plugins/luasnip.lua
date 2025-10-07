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
  end,
}