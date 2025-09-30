local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn
local generate_resource_name = utils.generate_resource_name
local generate_var_description = utils.generate_var_description
local generate_output_description = utils.generate_output_description
local generate_tags = utils.generate_tags

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
    t({"variable \""}), i(1, "variableName"), t({"\" {",""}),
    t({"  description = \""}), f(generate_var_description, {1}), t({"\""}),
    t({"", "  type        = "}), i(2, "string"),
    t({"", "  default     = "}), i(3, "\"default-value\""),
    t({"", "}"}),
    t({"", ""}),
    i(0, ""), -- Final insert node
  }),

  -- Output block
  s("output", {
    t({"output \""}), i(1, "outputName"), t({"\" {",""}),
    t({"  description = \""}), f(generate_output_description, {1}), t({"\""}),
    t({"", "  value       = "}), i(2, "resource.example.name"),
    t({"", "}"}),
    t({"", ""}),
    i(0, ""), -- Final insert node
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
