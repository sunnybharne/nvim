local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node

-- local function fn(args, parent, user_args)
--   return '' .. args[1][1] .. user_args .. ''
-- end

--Reference
--https://learn.microsoft.com/en-us/azure/templates/microsoft.resources/resourcegroups?pivots=deployment-language-bicep
-- Scope: Subscription

-- Snippet for defining a management group in Azure using bicep
-- Deploy management groups on subscription scope mg scope does not work
--  ----------------------------------------------------------------------------------
--[[
resource mg 'Microsoft.Management/managementGroups@2023-04-01' = { 
  scope: tenant()
  name: 'mg'
  displayName: 'mgname'
  properties: {
    details: {
      parent: {
        id: '/providers/Microsoft.Management/managementGroups/parentname'
      }
    }
  }
}
]]

ls.add_snippets('bicep', {
  s("managementgroup-bicep", {
    t("resource "), i(1, "mg"), t(" 'Microsoft.Management/managementGroups@2023-04-01' = {"),
    -- t({"resource mg 'Microsoft.Management/managementGroups@2023-04-01' = {", ""}),
    t({"  scope: tenant()", ""}),
    t({"  name: 'mg'", ""}),
    t({"  displayName: 'mgname'", ""}),
    t({"  properties: {", ""}),
    t({"    details: {", ""}),
    t({"      parent: {", ""}),
    t({"        id: '/providers/Microsoft.Management/managementGroups/parentname'", ""}),
    t({"      }", ""}),
    t({"    }", ""}),
    t({"  }", ""}),
    t({"}", ""})
  })
})
