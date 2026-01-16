local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- ============================================================================
-- PESTER SNIPPETS (PowerShell)
-- ============================================================================

ls.add_snippets('ps1', {
  -- AfterAll block
  s("afterall-pester", {
    t({ "AfterAll {", "" }),
    t({ "}", "" })
  }),

  -- BeforeAll block
  s("beforeall-pester", {
    t({ "BeforeAll {", "" }),
    t({ "    . $PSScriptRoot/Foo-Bar.ps1", "" }),
    t({ "    # . $PSCommandPath.Replace('.Tests.ps1','.ps1')", "" }),
    t({ "}", "" }),
    t({ "", "" }),
  }),

  -- Boilerplate
  s("boilerplate-pester", {
    t({ "BeforeAll {", "" }),
    t({ "    . $PSScriptRoot/Foo-Bar.ps1", "" }),
    t({ "    # . $PSCommandPath.Replace('.Tests.ps1','.ps1')", "" }),
    t({ "}", "" }),
    t({ "", "" }),
    t({ "Describe 'Suite 1' {", "" }),
    t({ "    BeforeAll {", "" }),
    t({ "    }", "" }),
    t({ "", "" }),
    t({ "    Context 'Nested suite 1' {", "" }),
    t({ "      It 'Test 1' {", "" }),
    t({ "      }", "" }),
    t({ "      It 'Test 2' {", "" }),
    t({ "      }", "" }),
    t({ "    }", "" }),
    t({ "", "" }),
    t({ "    Context 'Nested suite 2' {", "" }),
    t({ "      It 'Test 1' {", "" }),
    t({ "      }", "" }),
    t({ "      It 'Test 2' {", "" }),
    t({ "      }", "" }),
    t({ "    }", "" }),
    t({ "", "" }),
    t({ "    AfterAll {", "" }),
    t({ "    }", "" }),
    t({ "}", "" }),
    t({ "", "" }),
    t({ "AfterAll {", "" }),
    t({ "}", "" }),
  }),

  -- Describe block
  s("describe-pester", {
    t({ "Describe 'Suite' {", "" }),
    t({ "    BeforeAll {", "" }),
    t({ "    }", "" }),
    t({ "", "" }),
    t({ "    Context 'Nested suite' {", "" }),
    t({ "      It 'Test 1' {", "" }),
    t({ "      }", "" }),
    t({ "    }", "" }),
    t({ "", "" }),
    t({ "    AfterAll {", "" }),
    t({ "    }", "" }),
    t({ "}", "" }),
  }),

  -- It block
  s("it-pester", {
    t({ "It \"Returns <expected> (<name>)\" -ForEach @(", "" }),
    t({ "    @{ Name = \"cactus\"; Expected = '🌵'}", "" }),
    t({ "    @{ Name = \"giraffe\"; Expected = '🦒'}", "" }),
    t({ ") {", "" }),
    t({ "    Get-Emoji -Name $name | Should -Be $expected", "" }),
    t({ "}", "" }),
  }),
})
