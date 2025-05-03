local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Snippet for creating a subscription alias at tenant scope in Azure using Bicep
-- Scope: Management Group

--[[
targetScope = 'managementGroup'

@description('EnrollmentAccount used for subscription billing')
param enrollmentAccount string

@description('BillingAccount used for subscription billing')
param billingAccount string

@description('Display name for the subscription')
param subscriptiondisplayname string

@description('Workload type for the subscription')
param subscriptionWorkload string

resource alias 'Microsoft.Subscription/aliases@2020-09-01' = {
  scope: tenant()
  name: subscriptiondisplayname
  properties: {
    workload: subscriptionWorkload
    displayName: subscriptionDisplayName
    billingScope: tenantResourceId('Microsoft.Billing/billingAccounts/enrollmentAccounts', billingAccount, enrollmentAccount)
  }
}

output subscriptionId string = alias.properties.subscriptionId
]]

ls.add_snippets('bicep', {
  s("subscription-alias-bicep", {
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
