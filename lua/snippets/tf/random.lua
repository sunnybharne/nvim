local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Terraform random provider snippets
ls.add_snippets('terraform', {
  s("random-id", {
    t({
      'resource "random_id" "',
    }),
    i(1, "random"),
    t({
      '" {',
      '  byte_length = ',
    }),
    i(2, "4"),
    t({
      '',
      '}',
    }),
    i(0),
  }),
})

