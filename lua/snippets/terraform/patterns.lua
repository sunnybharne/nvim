local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Common Terraform patterns and best practices
ls.add_snippets('terraform', {
  -- Module structure
  s("module", {
    t({"module \"example\" {",""}),
    t({"  source = \"./modules/example\"",""}),
    t({"",""}),
    t({"", "  # Input variables"}),
    t({"", "  name        = var.name"}),
    t({"", "  environment = var.environment"}),
    t({"", "  location    = var.location"}),
    t({"",""}),
    t({"", "  # Optional variables with defaults"}),
    t({"", "  # size = var.size"}),
    t({"", "}"})
  }),

  -- Data source for current client config
  s("data-client", {
    t({"data \"azurerm_client_config\" \"current\" {}",""})
  }),

  -- Data source for availability zones
  s("data-az", {
    t({"data \"aws_availability_zones\" \"available\" {",""}),
    t({"  state = \"available\"",""}),
    t({"", "}"})
  }),

  -- Data source for AMI
  s("data-ami", {
    t({"data \"aws_ami\" \"ubuntu\" {",""}),
    t({"", "  most_recent = true"}),
    t({"  owners      = [\"099720109477\"] # Canonical",""}),
    t({"",""}),
    t({"", "  filter {"}),
    t({"    name   = \"name\"",""}),
    t({"    values = [\"ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*\"]",""}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  filter {"}),
    t({"    name   = \"virtualization-type\"",""}),
    t({"    values = [\"hvm\"]",""}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Random password
  s("random-password", {
    t({"resource \"random_password\" \"main\" {",""}),
    t({"", "  length  = 16"}),
    t({"", "  special = true"}),
    t({"", "}"})
  }),

  -- Random ID
  s("random-id", {
    t({"resource \"random_id\" \"main\" {",""}),
    t({"", "  byte_length = 8"}),
    t({"", "}"})
  }),

  -- File template
  s("templatefile", {
    t({"templatefile(\"${path.module}/templates/example.tpl\", {",""}),
    t({"", "  variable1 = var.value1"}),
    t({"", "  variable2 = var.value2"}),
    t({"", "})"})
  }),

  -- For each loop
  s("foreach", {
    t({"", "for_each = {"}),
    t({"  \"resource1\" = \"value1\"",""}),
    t({"  \"resource2\" = \"value2\"",""}),
    t({"", "}"})
  }),

  -- Count
  s("count", {
    t({"", "count = var.instance_count"})
  }),

  -- Conditional resource
  s("conditional", {
    t({"", "count = var.create_resource ? 1 : 0"})
  }),

  -- Lifecycle rules
  s("lifecycle", {
    t({"", "lifecycle {"}),
    t({"", "  create_before_destroy = true"}),
    t({"", "  prevent_destroy       = false"}),
    t({"", "  ignore_changes = ["}),
    t({"", "    tags,"}),
    t({"", "  ]"}),
    t({"", "}"})
  }),

  -- Depends on
  s("depends", {
    t({"", "depends_on = ["}),
    t({"", "  azurerm_resource_group.main"}),
    t({"", "]"})
  }),

  -- Time sleep
  s("sleep", {
    t({"resource \"time_sleep\" \"wait\" {",""}),
    t({"", "  depends_on = [azurerm_resource_group.main]"}),
    t({"  create_duration = \"30s\"",""}),
    t({"", "}"})
  }),

  -- Null resource with local-exec
  s("null-local", {
    t({"resource \"null_resource\" \"example\" {",""}),
    t({"  provisioner \"local-exec\" {",""}),
    t({"    command = \"echo 'Hello World'\"",""}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  triggers = {"}),
    t({"", "    always_run = timestamp()"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Taint resource
  s("taint", {
    t({"", "# terraform taint azurerm_virtual_machine.main"})
  }),

  -- Import resource
  s("import", {
    t({"", "# terraform import azurerm_virtual_machine.main /subscriptions/.../resourceGroups/.../providers/Microsoft.Compute/virtualMachines/..."})
  }),

  -- Workspace
  s("workspace", {
    t({"", "terraform {"}),
    t({"  backend \"local\" {",""}),
    t({"    path = \"terraform.tfstate\"",""}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Remote state
  s("remote-state", {
    t({"data \"terraform_remote_state\" \"example\" {",""}),
    t({"  backend = \"azurerm\"",""}),
    t({"", "  config = {"}),
    t({"    resource_group_name  = \"example-rg\"",""}),
    t({"    storage_account_name = \"examplestorage\"",""}),
    t({"    container_name       = \"tfstate\"",""}),
    t({"    key                  = \"example.tfstate\"",""}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Validation rules
  s("validation", {
    t({"variable \"example\" {",""}),
    t({"  description = \"Example variable\"",""}),
    t({"", "  type        = string"}),
    t({"",""}),
    t({"", "  validation {"}),
    t({"", "    condition     = length(var.example) > 0"}),
    t({"    error_message = \"The example value must not be empty.\"",""}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Sensitive variable
  s("sensitive", {
    t({"variable \"password\" {",""}),
    t({"  description = \"Password for the resource\"",""}),
    t({"", "  type        = string"}),
    t({"", "  sensitive   = true"}),
    t({"", "}"})
  }),

  -- Output with sensitive
  s("output-sensitive", {
    t({"output \"password\" {",""}),
    t({"  description = \"Password for the resource\"",""}),
    t({"", "  value       = random_password.main.result"}),
    t({"", "  sensitive   = true"}),
    t({"", "}"})
  }),

  -- Data source for existing resource
  s("data-existing", {
    t({"data \"azurerm_resource_group\" \"existing\" {",""}),
    t({"  name = \"existing-rg\"",""}),
    t({"", "}"})
  }),

  -- Move block
  s("moved", {
    t({"", "moved {"}),
    t({"", "  from = azurerm_resource_group.old"}),
    t({"", "  to   = azurerm_resource_group.new"}),
    t({"", "}"})
  }),

  -- Import block
  s("import-block", {
    t({"", "import {"}),
    t({"", "  to = azurerm_resource_group.example"}),
    t({"  id = \"/subscriptions/.../resourceGroups/example\"",""}),
    t({"", "}"})
  })
})
