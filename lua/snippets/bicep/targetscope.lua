local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('bicep', {
  s("targetScope : managementGroup", {
    t({"targetScope = '"}), i(1, "managementGroup"), t({"'"}),
  }),
  s("targetScope : resourceGroup", {
    t({"targetScope = '"}), i(1, "resourceGroup"), t({"'"}),
  }),
  s("targetScope : subscription", {
    t({"targetScope = '"}), i(1, "subscription"), t({"'"}),
  }),
  s("targetScope : tenant", {
    t({"targetScope = '"}), i(1, "tenant"), t({"'"}),
  }),
})
