local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Snippet for defining an AzureRM provider block in Terraform
ls.add_snippets('terraform', {
  s("provider-azure-block", {
    t({"provider \"azurerm\" {", ""}),
    t({"  features {}", ""}),
    t({"  subscription_id = \"\"", ""}),
    t({"}", ""})
  })
})
