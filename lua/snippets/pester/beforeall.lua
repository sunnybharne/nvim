local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- pester combined snippet
ls.add_snippets('ps1', {
  s("beforeall-pester", {
    t({"BeforeAll {", ""}),
    t({"    . $PSScriptRoot/Foo-Bar.ps1", ""}),
    t({"    # . $PSCommandPath.Replace('.Tests.ps1','.ps1')", ""}),
    t({"}", ""}),
    t({"", ""}),
  })
})
