local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('ps1', {
  s("it-pester", {
    t({"It \"Returns <expected> (<name>)\" -ForEach @(", ""}),
    t({"    @{ Name = \"cactus\"; Expected = '🌵'}", ""}),
    t({"    @{ Name = \"giraffe\"; Expected = '🦒'}", ""}),
    t({") {", ""}),
    t({"    Get-Emoji -Name $name | Should -Be $expected", ""}),
    t({"}", ""}),
  })
})
