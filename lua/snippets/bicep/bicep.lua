local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
  s("management-group-create",
    t({
"targetScope = 'tenant'",
"",
"@description ('Name of the management group to create')",
"param managementGroupsName string",
"",
"@description ('ID of the parent management group')",
"param managementGroupsParentId string",
"",
"resource symbolicname 'Microsoft.Management/managementGroups@2021-04-01' = {",
"  name: 'mgmtGroups-${managementGroupsName}'",
"  scope: tenant()",
"  properties: {",
"    details: {",
"      parent: {",
"        id: managementGroupsParentId",
"      }",
"    }",
"    displayName: managementGroupsName",
"  }",
"}",
    }))
})

