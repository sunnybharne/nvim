local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

-- ============================================================================
-- BICEP SNIPPETS
-- ============================================================================

ls.add_snippets('bicep', {
  -- Target Scope
  s("targetScope : managementGroup", {
    t({"targetScope = '"}), i(1, "managementGroup"), t({"'"}),
  }),
  s("targetScope : resourceGroup", {
    t({"targetScope = '"}), i(1, "resourceGroup"), t({"'"}),
  }),
  s("targetScope : subscription", {
    t({"targetScope = '"}), i(1, "subscription"), t({"'"}),
  }),
  s("targetScope : tenant", {
    t({"targetScope = '"}), i(1, "tenant"), t({"'"}),
  }),

  -- Parameters
  s("param : string", {
    t({"@description('"}), i(1, "param_description"), t({"')"}),
    t({"", "param "}), i(2, "paramName"), t({" string = '"}), i(3, "default-value"), t({"'"}),
  }),

  s("param : array", {
    t({"@description('"}), i(1, "param_description"), t({"')"}),
    t({"", "param "}), i(2, "myArray"), t({" array = ["}),
    t({"", "  "}), i(3, "1"),
    t({"", "  '"}), i(4, "string"), t({"'"}),
    t({"", "  {"}), i(5, "objectkey"), t({": '"}), i(6, "objectValue"), t({"'}"}),
    t({"", "]"}),
  }),

  s("param : object", {
    t({"@description('"}), i(1, "This parameter accepts object data for resource configuration."), t({"')"}),
    t({"", "param "}), i(2, "myObject"), t({" object = {"}),
    t({"", "  "}), i(3, "name"), t({": '"}), i(4, "example"), t({"'"}),
    t({"", "  "}), i(5, "location"), t({": '"}), i(6, "eastus"), t({"'"}),
    t({"", "}"}),
  }),

  s("param : allowed", {
    t({"@allowed(["}),
    t({"", "  '"}), i(1, "value1"), t({"'"}),
    t({"", "  '"}), i(2, "value2"), t({"'"}),
    t({"", "])"}),
    t({"", "param "}), i(3, "paramName"), t({" "}), i(4, "string"), t({" = '"}), i(5, "value1"), t({"'"}),
    t({""}),
    i(0, ""),
  }),

  -- Variables
  s("var : variable", {
    t({"var "}), i(1, "varName"), t({" = '"}), i(2, "value"), t({"'"}),
  }),

  s("var : string", {
    t({"var "}), i(1, "varName"), t({" = '"}), i(2, "value"), t({"'"}),
  }),

  s("var : array", {
    t({"var "}), i(1, "myArray"), t({" = ["}),
    t({"", "  "}), i(2, "1"),
    t({"", "  '"}), i(3, "string"), t({"'"}),
    t({"", "  {"}), i(4, "objectkey"), t({": '"}), i(5, "objectValue"), t({"'}"}),
    t({"", "]"}),
  }),

  s("var : object", {
    t({"var "}), i(1, "myObject"), t({" = {"}),
    t({"", "  "}), i(2, "name"), t({": '"}), i(3, "example"), t({"'"}),
    t({"", "  "}), i(4, "location"), t({": '"}), i(5, "eastus"), t({"'"}),
    t({"", "  "}), i(6, "tags"), t({": {"}),
    t({"", "    "}), i(7, "environment"), t({": '"}), i(8, "dev"), t({"'"}),
    t({"", "    "}), i(9, "owner"), t({": '"}), i(10, "teamA"), t({"'"}),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  s("var : number", {
    t({"var "}), i(1, "myNumber"), t({" = "}), i(2, "1"),
  }),

  s("var : boolean", {
    t({"var "}), i(1, "myFlag"), t({" = "}), i(2, "true"),
  }),

  -- Functions
  s("func-string", {
    t({"@description('"}), i(1, "Function description"), t({"')"}),
    t({"", "func "}), i(2, "functionName"), t({"("}), i(3, "param1"), t({" string, "}), i(4, "param2"), t({" string) string => '${"}), i(5, "param1"), t({"}-${"}), i(6, "param2"), t({"}'"}),
  }),

  s("func-object", {
    t({"@description('"}), i(1, "Function description"), t({"')"}),
    t({"", "func "}), i(2, "functionName"), t({"("}), i(3, "param1"), t({" string, "}), i(4, "param2"), t({" int) object => {"}),
    t({"", "  name: "}), i(5, "param1"),
    t({"", "  value: "}), i(6, "param2"),
    t({"", "  enabled: true"}),
    t({"", "}"}),
  }),

  s("func-array", {
    t({"@description('"}), i(1, "Function description"), t({"')"}),
    t({"", "func "}), i(2, "functionName"), t({"("}), i(3, "param1"), t({" string, "}), i(4, "param2"), t({" string) array => ["}),
    t({"", "  '"}), i(5, "item1"), t({"'"}),
    t({"", "  '"}), i(6, "item2"), t({"'"}),
    t({"", "  '"}), i(7, "item3"), t({"'"}),
    t({"", "]"})}),
  }),

  -- Loops
  s("for : range", {
    t({"["}),
    t({"for "}), i(1, "index"), t({" in range("}), i(2, "0"), t({", "}), i(3, "3"), t({"): {"}),
    t({"", "  "}), i(4, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("for : array", {
    t({"["}),
    t({"for "}), i(1, "item"), t({" in "}), i(2, "collection"), t({": {"}),
    t({"", "  "}), i(3, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("for : items in object", {
    t({"["}),
    t({"for "}), i(1, "item"), t({" in items("}), i(2, "object"), t({"): {"}),
    t({"", "  "}), i(3, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("for : array-index", {
    t({"["}),
    t({"for ("}), i(1, "item"), t({", "}), i(2, "index"), t({") in "}), i(3, "collection"), t({": {"}),
    t({"", "  "}), i(4, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("for : conditional", {
    t({"["}),
    t({"for "}), i(1, "item"), t({" in "}), i(2, "collection"), t({": if("}), i(3, "condition"), t({") {"}),
    t({"", "  "}), i(4, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("resource : for-range", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for "}), i(2, "index"), t({" in range("}), i(3, "0"), t({", "}), i(4, "3"), t({"): {"}),
    t({"", "  "}), i(5, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("resource : for-array", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for "}), i(2, "item"), t({" in "}), i(3, "collection"), t({": {"}),
    t({"", "  "}), i(4, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("resource : for-items", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for "}), i(2, "item"), t({" in items("}), i(3, "object"), t({"): {"}),
    t({"", "  "}), i(4, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("resource : for-array-index", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for ("}), i(2, "item"), t({", "}), i(3, "index"), t({") in "}), i(4, "collection"), t({": {"}),
    t({"", "  "}), i(5, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  s("resource : for-conditional", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for "}), i(2, "item"), t({" in "}), i(3, "collection"), t({": if("}), i(4, "condition"), t({") {"}),
    t({"", "  "}), i(5, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Modules
  s("module", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = {"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(4, "someParam: 'someValue'"),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  s("module-name", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = {"}),
    t({"", "  name: '"}), i(4, "module-deployment-name"), t({"'"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(5, "someParam: 'someValue'"),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  s("module-scope", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = {"}),
    t({"", "  name: '"}), i(4, "module-deployment-name"), t({"'"}),
    t({"", "  scope: "}), c(5, { t("resourceGroup()"), t("subscription()"), t("managementGroup()"), t("tenant()") }),
    t({"", "  params: {"}),
    t({"", "    "}), i(6, "someParam: 'someValue'"),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  s("module-depends", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = {"}),
    t({"", "  name: '"}), i(4, "module-deployment-name"), t({"'"}),
    t({"", "  dependsOn: ["}),
    t({"", "    "}), i(5, "otherResource"),
    t({"", "  ]"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(6, "someParam: 'someValue'"),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  s("module-if", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = if ("}), i(4, "condition"), t({") {"}),
    t({"", "  name: '"}), i(5, "module-deployment-name"), t({"'"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(6, "someParam: 'someValue'"),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  s("module-for", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = [for "}), i(4, "item"), t({" in "}), i(5, "array"), t({": {"}),
    t({"", "  name: '"}), i(6, "module-deployment-name"), t({"'"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(7, "someParam: item.property"),
    t({"", "  }"}),
    t({"", "}}]"}),
  }),

  s("module-for-index", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = [for (item, index) in "}), i(4, "array"), t({": {"}),
    t({"", "  name: '"}), i(5, "module-deployment-name"), t({"'"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(6, "someParam: item.property"),
    t({"", "  }"}),
    t({"", "}}]"}),
  }),

  s("module-complex", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = {"}),
    t({"", "  name: '"}), i(4, "module-deployment-name"), t({"'"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(5, "stringParam"), t({": '"}), i(6, "stringValue"), t({"'"}),
    t({"", "    "}), i(7, "numberParam"), t({": "}), i(8, "123"),
    t({"", "    "}), i(9, "arrayParam"), t({": ["}),
    t({"", "      '"}), i(10, "item1"), t({"'"}),
    t({"", "      '"}), i(11, "item2"), t({"'"}),
    t({"", "    ]"}),
    t({"", "    "}), i(12, "objectParam"), t({": {"}),
    t({"", "      "}), i(13, "property1"), t({": '"}), i(14, "value1"), t({"'"}),
    t({"", "      "}), i(15, "property2"), t({": "}), i(16, "value2"),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  s("module-output", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = {"}),
    t({"", "  name: '"}), i(4, "module-deployment-name"), t({"'"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(5, "someParam: 'someValue'"),
    t({"", "  }"}),
    t({"", "}"}),
    t({"", ""}),
    t({"var "}), i(6, "outputVariable"), t({" = "}), i(7, "resourceName"), t({".outputs."}), i(8, "outputName"),
  }),

  s("module-tags", {
    t({"@description('"}), i(1, "Module description"), t({"')"}),
    t({"", "module "}), i(2, "resourceName"), t({" '"}), i(3, "modules/resource.bicep"), t({"' = {"}),
    t({"", "  name: '"}), i(4, "module-deployment-name"), t({"'"}),
    t({"", "  tags: {"}),
    t({"", "    Environment: '"}), i(5, "dev"), t({"'"}),
    t({"", "    Project: '"}), i(6, "projectName"), t({"'"}),
    t({"", "    CreatedBy: '"}), i(7, "Bicep"), t({"'"}),
    t({"", "  }"}),
    t({"", "  params: {"}),
    t({"", "    "}), i(8, "someParam: 'someValue'"),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  -- Management Group
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

  -- Subscription
  s("sub : create", {
    t({"@description('"}), i(1, "Subscription Deployment"), t({"')"}),
    t({"", "resource "}), i(2, "sub"), t({" 'Microsoft.Subscription/aliases@2021-10-01' = {"}),
    t({"", "  scope: tenant()"}),
    t({"", "  name: '"}), i(3, "subscriptionName"), t({"'"}),
    t({"", "  properties: {"}),
    t({"", "    additionalProperties: {"}),
    t({"", "      managementGroupId: '"}), i(4, "managementGroupId"), t({"'"}),
    t({"", "      // subscriptionOwnerId: 'string'"}),
    t({"", "      // subscriptionTenantId: 'string'"}),
    t({"", "      tags: "}), i(5, "tags"),
    t({"", "    }"}),
    t({"", "    billingScope: '/providers/Microsoft.Billing/billingAccounts/${"}), i(6, "billingScope"), t({"/billingProfiles/${"}), i(7, "billingProfile"), t({"/invoiceSections/${"}), i(8, "invoiceSection"), t({"}'"}),
    t({"", "    displayName: '"}), i(9, "string"), t({"'"}),
    t({"", "    // resellerId: 'string'"}),
    t({"", "    // subscriptionId: 'string'"}),
    t({"", "    workload: '"}), i(10, "Production"), t({"' # 'DevTest'"}),
    t({"", "  }"}),
    t({"", "}"}),
    t({"", ""}),
    t({"", "output subscriptionId string = "}), i(11, "sub"), t({".properties.subscriptionId"}),
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

  -- Policy Assignment
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

  -- Debug snippets (from debug.lua)
  s("test", {
    t({"-- This is a test snippet for Bicep", ""}),
    t({"param testParam string = 'test'"}),
  }),

  s("param-simple", {
    t({"@description('"}),
    i(1, "Parameter description"),
    t({"')", ""}),
    t({"param "}),
    i(2, "parameterName"),
    t({" string = '"}),
    i(3, "defaultValue"),
    t({"'"}),
  }),
})

