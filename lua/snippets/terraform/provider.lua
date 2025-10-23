local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Provider snippets
ls.add_snippets('terraform', {
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
      "}",
      "",
      "provider \"azurerm\" {",
      "  features {}",
      "}",
      "",
      "provider \"azapi\" {",
      "  tenant_id       = \""
    }), 
    i(1, "tenantId"), 
    t({
      "\"",
      "  subscription_id = \""
    }), 
    i(2, "subId"), 
    t({
      "\"",
      "}",
      "",
      "provider \"random\" {",
      "}"
    }),
    i(0)
  }),
})
