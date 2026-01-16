return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local luasnip = require("luasnip")

    -- Load vscode snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load custom Lua snippets directly from snippets folder
    local snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"
    local snippet_files = vim.fn.glob(snippets_path .. "/*.lua", false, true)

    for _, file in ipairs(snippet_files) do
      local filename = vim.fn.fnamemodify(file, ":t:r") -- Get filename without extension
      if filename ~= "utils" then -- Skip utils.lua
        local success, _ = pcall(require, "snippets." .. filename)
        if not success then
          vim.notify("Failed to load snippet file: " .. filename, vim.log.levels.WARN)
        end
      end
    end

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
