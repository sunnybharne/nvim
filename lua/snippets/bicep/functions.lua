local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Bicep user-defined function snippets
ls.add_snippets('bicep', {
  -- Function with string interpolation (your example)
  s("func-string", fmt([[
@description('{}')
func {}({} string, {} string) string => '${}{}${}'
]], {
    i(1, "Function description"),
    i(2, "functionName"),
    i(3, "param1"),
    i(4, "param2"),
    i(5, "param1"),
    i(6, "-"),
    i(7, "param2"),
  })),

  -- Function returning object
  s("func-object", fmt([[
@description('{}')
func {}({} string, {} int) object => {{
  name: {}
  value: {}
  enabled: true
}}
]], {
    i(1, "Function description"),
    i(2, "functionName"),
    i(3, "param1"),
    i(4, "param2"),
    i(5, "param1"),
    i(6, "param2"),
  })),

  -- Function returning array
  s("func-array", fmt([[
@description('{}')
func {}({} string, {} string) array => [
  '{}'
  '{}'
  '{}'
]
]], {
    i(1, "Function description"),
    i(2, "functionName"),
    i(3, "param1"),
    i(4, "param2"),
    i(5, "item1"),
    i(6, "item2"),
    i(7, "item3"),
  })),
})
