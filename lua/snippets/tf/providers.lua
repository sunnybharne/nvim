local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Terraform providers snippet
ls.add_snippets('terraform', {
  -- Terraform with Azure (AzureRM + AzAPI + Random)
  s("provider-azure-lua", {
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
})

