local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Azure Pipelines pool snippet
ls.add_snippets('yaml', {
  s("pool-lua", {
    t({"pool: 'selfhosted' # 'default'"}),
    t({"", ""}),
  }),
})

