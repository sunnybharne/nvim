local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- terraform settings block with azure providers
ls.add_snippets('terraform', {
  s("terraform-azure-block", {
    t({"terraform {",""}),
    t({"  required_version = \">= 0.12\"",""}),
    t({"  required_providers {",""}),
    t({"    azurerm = {",""}),
    t({"      source = \"hashicorp/azurerm\"",""}),
    t({"      version = \">= 1.0.0\"",""}),
    t({"    }",""}),
    t({"  }",""}),
    t({"}",""})
  })
})
