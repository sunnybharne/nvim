local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local c = ls.choice_node

-- Management Group and Subscription snippets
ls.add_snippets('bicep', {
  -- Management Group
  s("mg", c(1, {
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
      "    }",
      "    displayName: 'mgName'",
      "  }",
      "}"
    })
  })),

  -- Subscription Alias
  s("sub", {
    t({
      "targetScope = 'managementGroup'",
      "",
      "@description('Subscription name to be used for the alias')",
      "param subscriptionName string",
      "",
      "@description('Management group ID to be used for the subscription')",
      "param managementGroupId string",
      "",
      "@description('Billing scope to be used for the subscription')",
      "param billingScope string",
      "",
      "@description('workload name to be used for the subscription')",
      "param workload string",
      "",
      "@description('Subscription tags')",
      "param tags object",
      "",
      "@description('The name of the subscription to create')",
      "module subscription '../modules/papliba.subscription.bicep' = {",
      "  name: subscriptionName",
      "  params: {",
      "    subscriptionName: subscriptionName",
      "    managementGroupId: managementGroupId",
      "    billingScope: billingScope",
      "    workload: workload",
      "    tags: tags",
      "  }",
      "}"
    })
  })
})
