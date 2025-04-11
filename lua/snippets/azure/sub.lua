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
      "@description('EnrollmentAccount used for subscription billing')",
      "param enrollmentAccount string",
      "",
      "@description('BillingAccount used for subscription billing')",
      "param billingAccount string",
      "",
      "@description('Display name for the subscription')",
      "param subscriptiondisplayname string",
      "",
      "@description('Workload type for the subscription')",
      "param subscriptionWorkload string",
      "",
      "resource alias 'Microsoft.Subscription/aliases@2020-09-01' = {",
      "  scope: tenant()",
      "  name: subscriptiondisplayname",
      "  properties: {",
      "    workload: subscriptionWorkload",
      "    displayName: subscriptionDisplayName",
      "    billingScope: tenantResourceId('Microsoft.Billing/billingAccounts/enrollmentAccounts', billingAccount, enrollmentAccount)",
      "  }",
      "}",
      "",
      "output subscriptionId string = alias.properties.subscriptionId"
    })
  })
})
