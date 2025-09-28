local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Terraform configuration snippets
-- Version: 1.2.0
-- Last Updated: 2024-12-19
-- Changelog:
--   v1.2.0 - Added AWS provider support
--   v1.1.0 - Added locals and data sources
--   v1.0.0 - Initial terraform snippets

local terraform_snippets = {
  -- Basic terraform block
  s("terraform", {
    t({
      "terraform {",
      "  required_version = \">= 1.0\"",
      "  required_providers {",
      "    azurerm = {",
      "      source  = \"hashicorp/azurerm\"",
      "      version = \"~> 3.0\"",
      "    }",
      "  }",
      "",
      "  backend \"azurerm\" {",
      "    # Configure your backend",
      "  }",
      "}"
    })
  }),

  -- Terraform with AWS
  s("terraform-aws", {
    t({"", "terraform {"}),
    t({"  required_version = \">= 1.0\"",""}),
    t({"", "  required_providers {"}),
    t({"", "    aws = {"}),
    t({"      source  = \"hashicorp/aws\"",""}),
    t({"      version = \"~> 5.0\"",""}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Variables block
  s("variables", {
    t({"variable \"example\" {",""}),
    t({"  description = \"Example variable\"",""}),
    t({"", "  type        = string"}),
    t({"  default     = \"default-value\"",""}),
    t({"", "}"})
  }),

  -- Output block
  s("output", {
    t({"output \"example\" {",""}),
    t({"  description = \"Example output\"",""}),
    t({"", "  value       = resource.example.name"}),
    t({"", "}"})
  }),

  -- Data source
  s("data", {
    t({"data \"azurerm_resource_group\" \"example\" {",""}),
    t({"  name = \"example-rg\"",""}),
    t({"", "}"})
  }),

  -- Local values
  s("locals", {
    t({"", "locals {"}),
    t({"", "  common_tags = {"}),
    t({"    Environment = \"dev\"",""}),
    t({"    Project     = \"example\"",""}),
    t({"", "  }"}),
    t({"", "}"})
  })
}

-- Version metadata
local version_info = {
  version = "1.2.0",
  last_updated = "2024-12-19",
  author = "sunnybharne",
  description = "Terraform configuration snippets",
  changelog = {
    ["1.2.0"] = "Added AWS provider support and improved formatting",
    ["1.1.0"] = "Added locals and data sources",
    ["1.0.0"] = "Initial terraform snippets with basic blocks"
  }
}

-- Register snippets with version info
ls.add_snippets('terraform', terraform_snippets)

-- Export version info for debugging/info
return {
  snippets = terraform_snippets,
  version = version_info
}
