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

  -- Terraform with Azure (AzureRM + AzAPI + Random)
  s("provider-azure", {
    t({
      "terraform {",
      "  required_providers {",
      "    azapi = {",
      "      source  = \"Azure/azapi\"",
      "      version = \"~>2.0\"",
      "    }",
      "    azurerm = {",
      "      source  = \"hashicorp/azurerm\"",
      "      version = \"~>4.0\"",
      "    }",
      "    random = {",
      "      source  = \"hashicorp/random\"",
      "      version = \"~>3.0\"",
      "    }",
      "  }",
      "",
      "  backend \"azurerm\" {",
      "    resource_group_name  = \"rgname\"",
      "    storage_account_name = \"storageaccountname\"",
      "    container_name       = \"containername\"",
      "    key                  = \"terraform.tfstate\"",
      "  }",
      "}",
      "",
      "provider \"azurerm\" {",
      "  features {}",
      "  tenant_id       = \"tenantId\"",
      "  subscription_id = \"subscriptionId\"",
      "}",
      "",
      "provider \"azapi\" {",
      "  tenant_id       = \"tenantId\"",
      "  subscription_id = \"subscriptionId\"",
      "}",
      "",
      "provider \"random\" {",
      "}",
    }),
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
})
