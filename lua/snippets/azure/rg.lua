local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node


--Reference
--https://learn.microsoft.com/en-us/azure/templates/microsoft.resources/resourcegroups?pivots=deployment-language-bicep
-- Scope: Subsceiption

-- Snippet for defining a resource group in Azure using bicep
--[[  --------------------------------------------------------------------------------
resource rgname 'Microsoft.Resources/resourceGroups@2025-03-01' = {
location: deployment().location
   name: 'rgname'
   tags: {
     'key': 'value'
   }
 }
--]]
ls.add_snippets('bicep', {
  s("resourcegroup-bicep", {
    t({"resource rgname 'Microsoft.Resources/resourceGroups@2024-11-01' = {", ""}),
    t({"  location: deployment().location", ""}),
    t({"  name: 'rgname'", ""}),
    t({"  tags: {", ""}),
    t({"    'key': 'value'", ""}),
    t({"  }", ""}),
    t({"}", ""})
  })
})
