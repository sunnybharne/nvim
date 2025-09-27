local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Simplified Terraform snippets - no complex variables
ls.add_snippets('terraform', {
  -- Basic Resources
  s("rg", {
    t({"resource \"azurerm_resource_group\" \"example\" {",""}),
    t({"  name     = \"example-rg\"",""}),
    t({"  location = \"East US\"",""}),
    t({"}",""})
  }),

  s("vnet", {
    t({"resource \"azurerm_virtual_network\" \"example\" {",""}),
    t({"  name                = \"example-vnet\"",""}),
    t({"  address_space       = [\"10.0.0.0/16\"]",""}),
    t({"  location            = \"East US\"",""}),
    t({"  resource_group_name = \"example-rg\"",""}),
    t({"}",""})
  }),

  s("subnet", {
    t({"resource \"azurerm_subnet\" \"example\" {",""}),
    t({"  name                 = \"example-subnet\"",""}),
    t({"  resource_group_name  = \"example-rg\"",""}),
    t({"  virtual_network_name = \"example-vnet\"",""}),
    t({"  address_prefixes     = [\"10.0.1.0/24\"]",""}),
    t({"}",""})
  }),

  s("vm", {
    t({"resource \"azurerm_linux_virtual_machine\" \"example\" {",""}),
    t({"  name                = \"example-vm\"",""}),
    t({"  resource_group_name = \"example-rg\"",""}),
    t({"  location            = \"East US\"",""}),
    t({"  size                = \"Standard_B1s\"",""}),
    t({"  admin_username      = \"adminuser\"",""}),
    t({"",""}),
    t({"  admin_ssh_key {",""}),
    t({"    username   = \"adminuser\"",""}),
    t({"    public_key = file(\"~/.ssh/id_rsa.pub\")",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  network_interface_ids = [",""}),
    t({"    azurerm_network_interface.example.id",""}),
    t({"  ]",""}),
    t({"",""}),
    t({"  os_disk {",""}),
    t({"    caching              = \"ReadWrite\"",""}),
    t({"    storage_account_type = \"Standard_LRS\"",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  source_image_reference {",""}),
    t({"    publisher = \"Canonical\"",""}),
    t({"    offer     = \"0001-com-ubuntu-server-jammy\"",""}),
    t({"    sku       = \"22_04-lts\"",""}),
    t({"    version   = \"latest\"",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  s("sa", {
    t({"resource \"azurerm_storage_account\" \"example\" {",""}),
    t({"  name                     = \"examplestorage\"",""}),
    t({"  resource_group_name      = \"example-rg\"",""}),
    t({"  location                 = \"East US\"",""}),
    t({"  account_tier             = \"Standard\"",""}),
    t({"  account_replication_type = \"LRS\"",""}),
    t({"}",""})
  }),

  -- AWS Resources
  s("vpc", {
    t({"resource \"aws_vpc\" \"example\" {",""}),
    t({"  cidr_block           = \"10.0.0.0/16\"",""}),
    t({"  enable_dns_hostnames = true",""}),
    t({"  enable_dns_support   = true",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Name = \"example-vpc\"",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  s("ec2", {
    t({"resource \"aws_instance\" \"example\" {",""}),
    t({"  ami           = \"ami-0c02fb55956c7d316\"",""}),
    t({"  instance_type = \"t3.micro\"",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Name = \"example-instance\"",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  s("s3", {
    t({"resource \"aws_s3_bucket\" \"example\" {",""}),
    t({"  bucket = \"example-bucket\"",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Name = \"example-bucket\"",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Common Patterns
  s("variable", {
    t({"variable \"example\" {",""}),
    t({"  description = \"Example variable\"",""}),
    t({"  type        = string",""}),
    t({"  default     = \"default-value\"",""}),
    t({"}",""})
  }),

  s("output", {
    t({"output \"example\" {",""}),
    t({"  description = \"Example output\"",""}),
    t({"  value       = resource.example.name",""}),
    t({"}",""})
  }),

  s("data", {
    t({"data \"azurerm_resource_group\" \"example\" {",""}),
    t({"  name = \"example-rg\"",""}),
    t({"}",""})
  }),

  s("locals", {
    t({"locals {",""}),
    t({"  common_tags = {",""}),
    t({"    Environment = \"dev\"",""}),
    t({"    Project     = \"example\"",""}),
    t({"  }",""}),
    t({"}",""})
  })
})
