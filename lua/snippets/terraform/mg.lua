local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('terraform', {
  s("mg", {
    t({"# Parent Group",""}),
    t({"data \"azurerm_management_group\" \"Parent-MgGroup\" {",""}),
    t({"  display_name = \"Parent-MgGroup\"",""}),
    t({"}",""}),
    t({"",""}),
    t({"# Child Mg",""}),
    t({"resource \"azurerm_management_group\" \"ChildMg\" {",""}),
    t({"  display_name = \"ChildMg\"",""}),
    t({"  parent_management_group_id = data.azurerm_management_group.Parent-MgGroup.id",""}),
    t({"}",""}),
    t({"",""})
  })
})
