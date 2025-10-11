local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Bicep policy assignment snippet
ls.add_snippets('bicep', {
  s("policy : assignment", {
    t({"resource "}), i(1, "policyAssignment"), t({" 'Microsoft.Authorization/policyAssignments@2025-03-01' = {"}),
    t({"", "  name: '"}), i(2, "assignment-name"), t({"'"}),
    t({"", "  identity: {"}),
    t({"", "    type: '"}), i(3, "SystemAssigned"), t({"'"}),
    t({"", "  }"}),
    t({"", "  location: '"}), i(4, "location"), t({"'"}),
    t({"", "  properties: {"}),
    t({"", "    description: '"}), i(5, "description"), t({"'"}),
    t({"", "    displayName: '"}), i(6, "display-name"), t({"'"}),
    t({"", "    enforcementMode: '"}), i(7, "DoNotEnforce"), t({"'"}),
    t({"", "    nonComplianceMessages: ["}),
    t({"", "      {"}),
    t({"", "        message: '"}), i(8, "non-compliance-message"), t({"'"}),
    t({"", "      }"}),
    t({"", "    ]"}),
    t({"", "    parameters: {"}),
    t({"", "      "}), i(9, "tagName"), t({": {"}),
    t({"", "        value: '"}), i(10, "tagkey"), t({"'"}),
    t({"", "      }"}),
    t({"", "      "}), i(11, "tagValue"), t({": {"}),
    t({"", "        value: '"}), i(12, "tagValue"), t({"'"}),
    t({"", "      }"}),
    t({"", "    }"}),
    t({"", "    policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/{"}), i(13, "policyDefinitionId"), t({"}'"}),
    t({"", "  }"}),
    t({"", "}"}),
    t({""}),
    i(0, ""),
  }),
})
