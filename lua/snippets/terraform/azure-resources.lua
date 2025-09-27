local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Azure Resource snippets
ls.add_snippets('terraform', {
  -- Resource Group
  s("rg", {
    t({"resource \"azurerm_resource_group\" \"example\" {",""}),
    t({"  name     = \"example-rg\"",""}),
    t({"  location = \"East US\"",""}),
    t({"}",""})
  }),

  -- Virtual Network
  s("vnet", {
    t({"resource \"azurerm_virtual_network\" \"main\" {",""}),
    t({"  name                = \"${var.project_name}-${var.environment}-vnet\"",""}),
    t({"  address_space       = [\"10.0.0.0/16\"]",""}),
    t({"  location            = azurerm_resource_group.main.location",""}),
    t({"  resource_group_name = azurerm_resource_group.main.name",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Subnet
  s("subnet", {
    t({"resource \"azurerm_subnet\" \"main\" {",""}),
    t({"  name                 = \"${var.project_name}-${var.environment}-subnet\"",""}),
    t({"  resource_group_name  = azurerm_resource_group.main.name",""}),
    t({"  virtual_network_name = azurerm_virtual_network.main.name",""}),
    t({"  address_prefixes     = [\"10.0.1.0/24\"]",""}),
    t({"}",""})
  }),

  -- Network Security Group
  s("nsg", {
    t({"resource \"azurerm_network_security_group\" \"main\" {",""}),
    t({"  name                = \"${var.project_name}-${var.environment}-nsg\"",""}),
    t({"  location            = azurerm_resource_group.main.location",""}),
    t({"  resource_group_name = azurerm_resource_group.main.name",""}),
    t({"",""}),
    t({"  security_rule {",""}),
    t({"    name                       = \"SSH\"",""}),
    t({"    priority                   = 1001",""}),
    t({"    direction                  = \"Inbound\"",""}),
    t({"    access                     = \"Allow\"",""}),
    t({"    protocol                   = \"Tcp\"",""}),
    t({"    source_port_range          = \"*\"",""}),
    t({"    destination_port_range     = \"22\"",""}),
    t({"    source_address_prefix      = \"*\"",""}),
    t({"    destination_address_prefix = \"*\"",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Public IP
  s("pip", {
    t({"resource \"azurerm_public_ip\" \"main\" {",""}),
    t({"  name                = \"${var.project_name}-${var.environment}-pip\"",""}),
    t({"  resource_group_name = azurerm_resource_group.main.name",""}),
    t({"  location            = azurerm_resource_group.main.location",""}),
    t({"  allocation_method   = \"Static\"",""}),
    t({"  sku                 = \"Standard\"",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Network Interface
  s("nic", {
    t({"resource \"azurerm_network_interface\" \"main\" {",""}),
    t({"  name                = \"${var.project_name}-${var.environment}-nic\"",""}),
    t({"  location            = azurerm_resource_group.main.location",""}),
    t({"  resource_group_name = azurerm_resource_group.main.name",""}),
    t({"",""}),
    t({"  ip_configuration {",""}),
    t({"    name                          = \"internal\"",""}),
    t({"    subnet_id                     = azurerm_subnet.main.id",""}),
    t({"    private_ip_address_allocation = \"Dynamic\"",""}),
    t({"    public_ip_address_id          = azurerm_public_ip.main.id",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Virtual Machine
  s("vm", {
    t({"resource \"azurerm_linux_virtual_machine\" \"main\" {",""}),
    t({"  name                = \"${var.project_name}-${var.environment}-vm\"",""}),
    t({"  resource_group_name = azurerm_resource_group.main.name",""}),
    t({"  location            = azurerm_resource_group.main.location",""}),
    t({"  size                = \"Standard_B1s\"",""}),
    t({"  admin_username      = \"adminuser\"",""}),
    t({"",""}),
    t({"  admin_ssh_key {",""}),
    t({"    username   = \"adminuser\"",""}),
    t({"    public_key = file(\"~/.ssh/id_rsa.pub\")",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  network_interface_ids = [",""}),
    t({"    azurerm_network_interface.main.id",""}),
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
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Storage Account
  s("sa", {
    t({"resource \"azurerm_storage_account\" \"main\" {",""}),
    t({"  name                     = \"${var.project_name}${var.environment}sa\"",""}),
    t({"  resource_group_name      = azurerm_resource_group.main.name",""}),
    t({"  location                 = azurerm_resource_group.main.location",""}),
    t({"  account_tier             = \"Standard\"",""}),
    t({"  account_replication_type = \"LRS\"",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Key Vault
  s("kv", {
    t({"resource \"azurerm_key_vault\" \"main\" {",""}),
    t({"  name                = \"${var.project_name}-${var.environment}-kv\"",""}),
    t({"  location            = azurerm_resource_group.main.location",""}),
    t({"  resource_group_name = azurerm_resource_group.main.name",""}),
    t({"  tenant_id           = data.azurerm_client_config.current.tenant_id",""}),
    t({"  sku_name            = \"standard\"",""}),
    t({"",""}),
    t({"  access_policy {",""}),
    t({"    tenant_id = data.azurerm_client_config.current.tenant_id",""}),
    t({"    object_id = data.azurerm_client_config.current.object_id",""}),
    t({"",""}),
    t({"    key_permissions = [",""}),
    t({"      \"Get\"",""}),
    t({"    ]",""}),
    t({"",""}),
    t({"    secret_permissions = [",""}),
    t({"      \"Get\"",""}),
    t({"    ]",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- App Service Plan
  s("asp", {
    t({"resource \"azurerm_service_plan\" \"main\" {",""}),
    t({"  name                = \"${var.project_name}-${var.environment}-asp\"",""}),
    t({"  resource_group_name = azurerm_resource_group.main.name",""}),
    t({"  location            = azurerm_resource_group.main.location",""}),
    t({"  os_type             = \"Linux\"",""}),
    t({"  sku_name            = \"B1\"",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- App Service
  s("app", {
    t({"resource \"azurerm_linux_web_app\" \"main\" {",""}),
    t({"  name                = \"${var.project_name}-${var.environment}-app\"",""}),
    t({"  resource_group_name = azurerm_resource_group.main.name",""}),
    t({"  location            = azurerm_resource_group.main.location",""}),
    t({"  service_plan_id     = azurerm_service_plan.main.id",""}),
    t({"",""}),
    t({"  site_config {",""}),
    t({"    application_stack {",""}),
    t({"      node_version = \"18-lts\"",""}),
    t({"    }",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  tags = {",""}),
    t({"    Environment = var.environment",""}),
    t({"    Project     = var.project_name",""}),
    t({"  }",""}),
    t({"}",""})
  })
})
