local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Provider snippets
ls.add_snippets('terraform', {
  -- Azure provider
  s("provider-azure", {
    t({"provider \"azurerm\" {",""}),
    t({"", "  features {"}),
    t({"", "    resource_group {"}),
    t({"", "      prevent_deletion_if_contains_resources = false"}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- AWS provider
  s("provider-aws", {
    t({"provider \"aws\" {",""}),
    t({"", "  region = var.aws_region"}),
    t({"", "  default_tags {"}),
    t({"", "    tags = {"}),
    t({"      Environment = \"dev\"",""}),
    t({"      Project     = \"example\"",""}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Google Cloud provider
  s("provider-gcp", {
    t({"provider \"google\" {",""}),
    t({"", "  project = var.gcp_project_id"}),
    t({"", "  region  = var.gcp_region"}),
    t({"", "}"})
  }),

  -- Multiple providers
  s("providers", {
    t({"", "terraform {"}),
    t({"", "  required_providers {"}),
    t({"", "    azurerm = {"}),
    t({"      source  = \"hashicorp/azurerm\"",""}),
    t({"      version = \"~> 3.0\"",""}),
    t({"", "    }"}),
    t({"", "    aws = {"}),
    t({"      source  = \"hashicorp/aws\"",""}),
    t({"      version = \"~> 5.0\"",""}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"})
  })
})
