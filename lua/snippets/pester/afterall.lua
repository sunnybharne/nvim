local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- pester afterall block
ls.add_snippets('ps1', {
  s("afterall-pester", {
    t({"AfterAll {", ""}),
    t({"}", ""})
  })
})
