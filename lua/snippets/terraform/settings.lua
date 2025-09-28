local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- terraform settings and provider block
ls.add_snippets('terraform', {
  s("terraform-settingsandprovider-block-azure", {
    t({"", "terraform {"}),
    t({"  required_version = \">= 0.12\"",""}),
    t({"", "  required_providers {"}),
    t({"", "    azurerm = {"}),
    t({"      source = \"hashicorp/azurerm\"",""}),
    t({"      version = \">= 1.0.0\"",""}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"}),
    t({"",""}),
    t({"",""}),
    t({"provider \"azurerm\" {",""}),
    t({"", "  features {}"}),
    t({"  subscription_id = \"\"",""}),
    t({"", "}"})
  })
})

-- terraform settings block
ls.add_snippets('terraform', {
  s("terraform-settingsa-block-azure", {
    t({"", "terraform {"}),
    t({"  required_version = \">= 0.12\"",""}),
    t({"", "  required_providers {"}),
    t({"", "    azurerm = {"}),
    t({"      source = \"hashicorp/azurerm\"",""}),
    t({"      version = \">= 1.0.0\"",""}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"}),
    t({"",""}),
    t({"",""})
  })
})
