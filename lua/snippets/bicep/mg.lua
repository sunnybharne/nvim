local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Management Group creation snippet
-- @description('mg description')
-- resource mg 'Microsoft.Management/managementGroups@2023-04-01' = {
--   scope: tenant()
--   name: 'mgId'
--   properties: {
--     // details: { 
--     //   parent: {
--     //     id: 'parent-id' // if no parent mg will be created on tenant root
--     //   }
--     // }
--     displayName: 'mg display name'
--   }
-- }
ls.add_snippets('bicep', {
  s("mg : create", {
    t({"@description('"}), i(1, "mg description"), t({"')"}),
    t({"", "resource "}), i(2, "mg"), t({" 'Microsoft.Management/managementGroups@2023-04-01' = {"}),
    t({"", "  scope: tenant()"}),
    t({"", "  name: '"}), i(3, "mgId"), t({"'"}),
    t({"", "  properties: {"}),
    t({"", "    // details: { "}),
    t({"", "    //   parent: {"}),
    t({"", "    //     id: 'parent-id' // if no parent mg will be created on tenant root"}),
    t({"", "    //   }"}),
    t({"", "    // }"}),
    t({"", "    displayName: '"}), i(4, "mg display name"), t({"'"}),
    t({"", "  }"}),
    t({"", "}"}),
  }),
})
