local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('ps1', {
  s("describe-pester", {
    t({"Describe 'Suite' {", ""}),
    t({"    BeforeAll {", ""}),
    t({"    }", ""}),
    t({"", ""}),
    t({"    Context 'Nested suite' {", ""}),
    t({"      It 'Test 1' {", ""}),
    t({"      }", ""}),
    t({"    }", ""}),
    t({"", ""}),
    t({"    AfterAll {", ""}),
    t({"    }", ""}),
    t({"}", ""}),
  })
})
