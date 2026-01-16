local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Terraform random provider snippets
ls.add_snippets('terraform', {
  s("random-string-lua", {
    t({
      'resource "random_string" "',
    }),
    i(1, "example"),
    t({
      '" {',
      '  length  = ',
    }),
    i(2, "16"),
    t({
      '',
      '  special = ',
    }),
    i(3, "false"),
    t({
      '',
      '}',
    }),
    i(0),
  }),
})
