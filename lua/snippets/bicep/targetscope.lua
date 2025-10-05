local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- @description('mgdescription')
-- targetScope = 'managementGroup'
ls.add_snippets('bicep', {
  s("targetScope : managementGroup", {
    t({"@description('"}), i(1, "mgdescription"), t({"')"}),
    t({"", "targetScope = '"}), i(2, "managementGroup"), t({"'"}),
  }),
  s("targetScope : resourceGroup", {
    t({"@description('"}), i(1, "rgdescription"), t({"')"}),
    t({"", "targetScope = '"}), i(2, "resourceGroup"), t({"'"}),
  }),
  s("targetScope : subscription", {
    t({"@description('"}), i(1, "subdescription"), t({"')"}),
    t({"", "targetScope = '"}), i(2, "subscription"), t({"'"}),
  }),
  s("targetScope : tenant", {
    t({"@description('"}), i(1, "tendescription"), t({"')"}),
    t({"", "targetScope = '"}), i(2, "tenant"), t({"'"}),
  }),
})
