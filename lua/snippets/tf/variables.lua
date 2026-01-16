local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Terraform variable snippet
ls.add_snippets('terraform', {
  s("variable-lua", {
    t('variable "'),
    i(1, "id"),
    t({
      '" {',
      '  description = "',
    }),
    i(2, "The ID (name) of the management group"),
    t({
      '"',
      '  type        = ',
    }),
    i(3, "string"),
    t({
      '',
      '}',
    }),
    i(0),
  }),
})

