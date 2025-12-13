local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Azure Pipelines variables snippet
ls.add_snippets('yaml', {
  s("ado-variables", {
    t({"variables:"}),
    t({"", "  serviceConnectionDev: 'id-<resource>-vending-eus-dev-001'"}),
    t({"", "  serviceConnectionTest: 'id-<resource>-vending-eus-test-001'"}),
    t({"", "  serviceConnectionProd: 'id-<resource>-vending-eus-prod-001'"}),
    t({"", ""}),
  }),
})

