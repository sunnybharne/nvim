local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Management Group snippets
ls.add_snippets('terraform', {
  -- Management Group
  s("mg", {
    t({"resource \"azurerm_management_group\" \"example\" {",""}),
    t({"  display_name = \"Management Group\"",""}),
    t({"}",""})
  }),

  -- Policy Assignment
  s("policy", {
    t({"resource \"azurerm_management_group_policy_assignment\" \"example\" {",""}),
    t({"  name                 = \"policy-assignment\"",""}),
    t({"  management_group_id  = azurerm_management_group.example.id",""}),
    t({"  policy_definition_id = \"/providers/Microsoft.Authorization/policyDefinitions/...\"",""}),
    t({"}",""})
  }),

  -- Role Assignment
  s("role", {
    t({"resource \"azurerm_role_assignment\" \"example\" {",""}),
    t({"  scope                = azurerm_management_group.example.id",""}),
    t({"  role_definition_name = \"Contributor\"",""}),
    t({"  principal_id         = \"principal-id\"",""}),
    t({"}",""})
  })
})
