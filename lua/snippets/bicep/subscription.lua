local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Bicep subscription deployment snippets
ls.add_snippets('bicep', {
  s("sub : create", {
    t({"@description('"}), i(1, "Subscription Deployment"), t({"')"}),
    t({"", "resource "}), i(2, "sub"), t({" 'Microsoft.Subscription/aliases@2024-08-01-preview' = {"}),
    t({"", "  scope: tenant()"}),
    t({"", "  name: '"}), i(3, "subscriptionName"), t({"'"}),
    t({"", "  properties: {"}),
    t({"", "    additionalProperties: {"}),
    t({"", "      managementGroupId: '"}), i(4, "managementGroupId"), t({"'"}),
    t({"", "      // subscriptionOwnerId: 'string'"}),
    t({"", "      // subscriptionTenantId: 'string'"}),
    t({"", "      tags: "}), i(5, "tags"),
    t({"", "    }"}),
    t({"", "    billingScope: '"}), i(6, "string"), t({"'"}),
    t({"", "    displayName: '"}), i(7, "string"), t({"'"}),
    t({"", "    // resellerId: 'string'"}),
    t({"", "    // subscriptionId: 'string'"}),
    t({"", "    workload: '"}), i(8, "Production"), t({"' # 'DevTest'"}),
    t({"", "  }"}),
    t({"", "}"}),
    t({""}),
    i(0, ""),
  }),
  s("sub : move", {
    t({"resource "}), i(1, "subToMG"), t({" 'Microsoft.Management/managementGroups/subscriptions@2020-05-01' = {"}),
    t({"", "  scope: tenant()"}),
    t({"", "  name: '${"}), i(2, "targetMgId"), t({"/${"}), i(3, "subscriptionId"), t({"}'"}),
    t({"", "}"}),
    t({""}),
    i(0, ""),
  }),
})


