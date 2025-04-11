local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

-- Scope: management group are only deployed on tenant level

ls.add_snippets('bicep', {
 s("managementgroup-bicep", c(1, {
 	t({
      "targetScope = 'managementGroup'",
      "",
      "@description('The name of the management group.')",
      "param mgName string",
      "",
      "@description('The Id of the parent management group.')",
      "param parentId string",
      "",
      "resource parentManagementGroup 'Microsoft.Management/managementGroups@2021-04-01' existing = {",
      "  name: parentId",
      "  scope: tenant()",
      "}",
      "",
      "resource mg 'Microsoft.Management/managementGroups@2023-04-01' = {",
      "  scope: tenant()",
      "  name: mgName",
      "  properties: {",
      "    details: {",
      "      parent: {",
      "        id: parentManagementGroup.id",
      "      }",
      "    }",
      "    displayName: mgName",
      "  }",
      "}",
      "",
      "@description('The name of the management group.')",
      "output name string = mg.name",
      "",
      "@description('The resource ID of the management group.')",
      "output resourceId string = mg.id"
    }),
 	t({
      "resource mg 'Microsoft.Management/managementGroups@2023-04-01' = {",
      "  scope: tenant()",
      "  name: 'mgName'",
      "  properties: {",
      "    details: {",
      "      parent: {",
      "        id: 'parentId'",
      "      }",
      "    },",
      "    displayName: 'mgName'",
      "  }",
      "}"
    })
 }))
})
