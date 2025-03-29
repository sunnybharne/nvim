local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('ps1', {
  s("boilerplate-pester", {
    t({"BeforeAll {", ""}),
    t({"    . $PSScriptRoot/Foo-Bar.ps1", ""}),
    t({"    # . $PSCommandPath.Replace('.Tests.ps1','.ps1')", ""}),
    t({"}", ""}),
    t({"", ""}),
    t({"Describe 'Suite 1' {", ""}),
    t({"    BeforeAll {", ""}),
    t({"    }", ""}),
    t({"", ""}),
    t({"    Context 'Nested suite 1' {", ""}),
    t({"      It 'Test 1' {", ""}),
    t({"      }", ""}),
    t({"      It 'Test 2' {", ""}),
    t({"      }", ""}),
    t({"    }", ""}),
    t({"", ""}),
    t({"    Context 'Nested suite 2' {", ""}),
    t({"      It 'Test 1' {", ""}),
    t({"      }", ""}),
    t({"      It 'Test 2' {", ""}),
    t({"      }", ""}),
    t({"    }", ""}),
    t({"", ""}),
    t({"    AfterAll {", ""}),
    t({"    }", ""}),
    t({"}", ""}),
    t({"", ""}),
    t({"AfterAll {", ""}),
    t({"}", ""}),
  })
})
