local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Provider snippets
ls.add_snippets('terraform', {
  -- Variable with validation
  s("variable", {
    t('variable "'),
    i(1, "variableName"),
    t({
      '" {',
      '  description = "'
    }),
    i(2, "description"),
    t({
      '"',
      '  type        = '
    }),
    i(3, "string"),
    t({
      '',
      '  default     = "'
    }),
    i(4, "default"),
    t({
      '"',
      '',
      '  validation {',
      '    condition     = contains(["'
    }),
    i(5, "default"),
    t('", "'),
    i(6, "somethingelse"),
    t('"], var.'),
    i(7, "variableName"),
    t({
      ')',
      '    error_message = "'
    }),
    i(8, "The error message"),
    t({
      '"',
      '  }',
      '}'
    }),
    i(0)
  }),

  -- Azure Policy Definition
  s("definitions-azapi", {
    t('resource "azapi_resource" "policy_definitions_'),
    i(1, "name"),
    t({
      '" {',
      '  type      = "Microsoft.Authorization/policyDefinitions@2025-03-01"',
      '  name      = "'
    }),
    i(2, "somename"),
    t({
      '"',
      '  parent_id = "/providers/Microsoft.Management/managementGroups/${'
    }),
    i(3, "mg_id"),
    t({
      '}"',
      '  body = {',
      '    properties = {',
      '      description = "'
    }),
    i(4, "some description"),
    t({
      '"',
      '      displayName = "'
    }),
    i(5, "some display name"),
    t({
      '"',
      '      policyType  = "Custom"',
      '      mode        = "All"',
      '      metadata = {',
      '        category = "'
    }),
    i(6, "General"),
    t({
      '"',
      '      }',
      '      parameters = {',
      '        allowedLocations = {',
      '          type = "Array"',
      '          metadata = {',
      '            displayName = "Allowed locations"',
      '            description = "The list of allowed locations for resources"',
      '          }',
      '          defaultValue = ["eastus", "westus"]',
      '        }',
      '      }',
      '      policyRule = {',
      '        if = {',
      '          field = "location"',
      '          in    = ["eastus", "westus"]',
      '        }',
      '        then = {',
      '          effect = "deny"',
      '        }',
      '      }',
      '      version = "string"',
      '      versions = [',
      '        "string"',
      '      ]',
      '    }',
      '  }',
      '}'
    }),
    i(0)
  }),

  -- Locals block with JSON decode
  -- locals {
  --   json_object = jsondecode(file("${path.module}/somejsonfiles.json"))
  -- }
  s("locals", {
    t({
      "locals {",
      "  "
    }),
    i(1, "json_object"),
    t(" = jsondecode(file(\"${path.module}/"),
    i(2, "somejsonfiles.json"),
    t({
      "\"))",
      "}",
    }),
    i(0)
  }),

  -- JSON decode function
  -- jsondecode(file("${path.module}/somejsonfiles.json"))
  s("jsondecode", {
    t("jsondecode(file(\"${path.module}/"),
    i(1, "somejsonfiles.json"),
    t("\"))"),
    i(0)
  }),

  -- Azure Billing MCA Account Scope and Subscription
  s("subscription-create", {
    t({
      'data "azurerm_billing_mca_account_scope" "scope" {',
      '  billing_account_name = var.billing_account_name',
      '  billing_profile_name = var.billing_profile_name',
      '  invoice_section_name = var.invoice_section_name',
      '}',
      '',
      'resource "azurerm_subscription" "subscription" {',
      '  subscription_name = var.subscription_name',
      '  billing_scope_id  = data.azurerm_billing_mca_account_scope.scope.id',
      '}',
    }),
    i(0)
  }),

  -- Azure Policy Definition with outputs
  -- resource "azurerm_policy_definition" "policy" {
  --   name         = "policy-name"
  --   policy_type  = "Custom"
  --   mode         = "All"
  --   display_name = "Display Name"
  --   description  = "Description"
  --   metadata = jsonencode({
  --     version  = "1.0.0"
  --     category = "General"
  --   })
  --   policy_rule = jsonencode({
  --     if = {
  --       field = "location"
  --       in    = ["eastus", "westus"]
  --     }
  --     then = {
  --       effect = "deny"
  --     }
  --   })
  --   parameters          = jsonencode({})
  --   management_group_id = "/providers/Microsoft.Management/managementGroups/management-group-id"
  -- }
  -- output "policy_definition_id" {
  --   value = azurerm_policy_definition.policy.id
  -- }
  -- output "policy_definition_name" {
  --   value = azurerm_policy_definition.policy.name
  -- }
  s("policy-definition", {
    t({'resource "azurerm_policy_definition" "'}),
    i(1, "policy"),
    t({
      '" {',
      '  name         = "'
    }),
    i(2, "policy-name"),
    t({
      '"',
      '  policy_type  = "'
    }),
    i(3, "Custom"),
    t({
      '" //BuiltIn, NotSpecified and Static',
      '  mode         = "'
    }),
    i(4, "All"),
    t({
      '"',
      '  display_name = "'
    }),
    i(5, "Display Name"),
    t({
      '"',
      '  description  = "'
    }),
    i(6, "Description"),
    t({
      '"',
      '  metadata = jsonencode({',
      '    version  = "'
    }),
    i(7, "1.0.0"),
    t({
      '" // Actual policy version',
      '    category = "'
    }),
    i(8, "General"),
    t({
      '"',
      '  })',
      '  policy_rule = jsonencode({',
      '    if = {',
      '      field = "'
    }),
    i(9, "location"),
    t({
      '"',
      '      in    = ['
    }),
    i(10, '"eastus", "westus"'),
    t({
      ']',
      '    }',
      '    then = {',
      '      effect = "'
    }),
    i(11, "deny"),
    t({
      '"',
      '    }',
      '  })',
      '  parameters          = jsonencode({})',
      '  management_group_id = "/providers/Microsoft.Management/managementGroups/'
    }),
    i(12, "management-group-id"),
    t({
      '"',
      '}',
      '',
      'output "policy_definition_id" {',
      '  value = azurerm_policy_definition.'
    }),
    i(13, "policy"),
    t({
      '.id',
      '}',
      '',
      'output "policy_definition_name" {',
      '  value = azurerm_policy_definition.'
    }),
    i(14, "policy"),
    t({
      '.name',
      '}',
    }),
    i(0)
  }),
})
