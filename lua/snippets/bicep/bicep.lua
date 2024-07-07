local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
  s("trigger azure devops pipeline",
    t({
"some other ",
"files ",
"with bice",
"code",
"",
    }))
})

ls.add_snippets('all', {
  s("trigger azure devops pipeline",
    t({
"targetScope = 'managementGroup'",
"",
"@description('Provide a name for the alias. This name will also be the display name of the subscription.')",
"param subscriptionAliasName string",
"",
"@description('Provide the full resource ID of billing scope to use for subscription creation.')",
"param billingScope string",
"",
"resource subscriptionAlias 'Microsoft.Subscription/aliases@2021-10-01' = {",
"  scope: tenant()",
"  name: subscriptionAliasName",
"  properties: {",
"    workload: 'Production'",
"    displayName: subscriptionAliasName",
"    billingScope: billingScope",
"  }",
"}",
    }))
})

