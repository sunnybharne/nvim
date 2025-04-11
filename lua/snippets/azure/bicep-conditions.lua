local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

--Reference
--https://learn.microsoft.com/en-us/azure/templates/microsoft.resources/resourcegroups?pivots=deployment-language-bicep
-- Scope: Subscription

-- Array
--  ----------------------------------------------------------------------------------
--[[
param arrayname array = [
  'value1'
  'value2'
]
]]

ls.add_snippets('bicep', {
  s("array-bicep", {
    t({"param arrayName array = [", ""}),
    t({"  'value1',", ""}),
    t({"  'value2'", ""}),
    t({"]", ""})
  })
})

-- For loop
--  ----------------------------------------------------------------------------------
--[[
resource name 'type' = [for item in array : {
  'resource definition'
}]
]]

ls.add_snippets('bicep', {
  s("for-bicep", {
    t({"resource name 'type' = [for item in array : {", ""}),
    t({"  'resource definition'", ""}),
    t({"}]", ""})
  })
})
