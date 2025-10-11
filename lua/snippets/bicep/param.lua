local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Bicep parameter with @allowed values
ls.add_snippets('bicep', {
  s("param : allowed", {
    t({"@allowed(["}),
    t({"", "  '"}), i(1, "value1"), t({"'"}),
    t({"", "  '"}), i(2, "value2"), t({"'"}),
    t({"", "])"}),
    t({"", "param "}), i(3, "paramName"), t({" "}), i(4, "string"), t({" = '"}), i(5, "value1"), t({"'"}),
    t({""}),
    i(0, ""),
  }),
})


