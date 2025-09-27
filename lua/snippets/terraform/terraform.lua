local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Terraform configuration snippets
ls.add_snippets('terraform', {
  -- Basic terraform block
  s("terraform", {
    t({"terraform {",""}),
    t({"  required_version = \">= 1.0\"",""}),
    t({"  required_providers {",""}),
    t({"    azurerm = {",""}),
    t({"      source  = \"hashicorp/azurerm\"",""}),
    t({"      version = \"~> 3.0\"",""}),
    t({"    }",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  backend \"azurerm\" {",""}),
    t({"    # Configure your backend",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Terraform with AWS
  s("terraform-aws", {
    t({"terraform {",""}),
    t({"  required_version = \">= 1.0\"",""}),
    t({"  required_providers {",""}),
    t({"    aws = {",""}),
    t({"      source  = \"hashicorp/aws\"",""}),
    t({"      version = \"~> 5.0\"",""}),
    t({"    }",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Variables block
  s("variables", {
    t({"variable \"example\" {",""}),
    t({"  description = \"Example variable\"",""}),
    t({"  type        = string",""}),
    t({"  default     = \"default-value\"",""}),
    t({"}",""})
  }),

  -- Output block
  s("output", {
    t({"output \"example\" {",""}),
    t({"  description = \"Example output\"",""}),
    t({"  value       = resource.example.name",""}),
    t({"}",""})
  }),

  -- Data source
  s("data", {
    t({"data \"azurerm_resource_group\" \"example\" {",""}),
    t({"  name = \"example-rg\"",""}),
    t({"}",""})
  }),

  -- Local values
  s("locals", {
    t({"locals {",""}),
    t({"  common_tags = {",""}),
    t({"    Environment = \"dev\"",""}),
    t({"    Project     = \"example\"",""}),
    t({"  }",""}),
    t({"}",""})
  })
})
