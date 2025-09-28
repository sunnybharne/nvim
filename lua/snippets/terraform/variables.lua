local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Variable snippets
ls.add_snippets('terraform', {
  -- String variable
  s("var-string", {
    t({"variable \"example\" {",""}),
    t({"  description = \"Example string variable\"",""}),
    t({"", "  type        = string"}),
    t({"  default     = \"default-value\"",""}),
    t({"", "}"})
  }),

  -- Number variable
  s("var-number", {
    t({"variable \"count\" {",""}),
    t({"  description = \"Number of instances\"",""}),
    t({"", "  type        = number"}),
    t({"", "  default     = 1"}),
    t({"", "}"})
  }),

  -- Boolean variable
  s("var-bool", {
    t({"variable \"enabled\" {",""}),
    t({"  description = \"Enable the resource\"",""}),
    t({"", "  type        = bool"}),
    t({"", "  default     = true"}),
    t({"", "}"})
  }),

  -- List variable
  s("var-list", {
    t({"variable \"subnets\" {",""}),
    t({"  description = \"List of subnet CIDR blocks\"",""}),
    t({"", "  type        = list(string)"}),
    t({"  default     = [\"10.0.1.0/24\", \"10.0.2.0/24\"]",""}),
    t({"", "}"})
  }),

  -- Map variable
  s("var-map", {
    t({"variable \"tags\" {",""}),
    t({"  description = \"Tags to apply to resources\"",""}),
    t({"", "  type        = map(string)"}),
    t({"", "  default     = {"}),
    t({"    Environment = \"dev\"",""}),
    t({"    Project     = \"example\"",""}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Object variable
  s("var-object", {
    t({"variable \"database\" {",""}),
    t({"  description = \"Database configuration\"",""}),
    t({"", "  type = object({"}),
    t({"", "    name     = string"}),
    t({"", "    username = string"}),
    t({"", "    password = string"}),
    t({"", "    port     = number"}),
    t({"", "  })"}),
    t({"", "  default = {"}),
    t({"    name     = \"example\"",""}),
    t({"    username = \"admin\"",""}),
    t({"    password = \"password\"",""}),
    t({"", "    port     = 5432"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Set variable
  s("var-set", {
    t({"variable \"allowed_ports\" {",""}),
    t({"  description = \"Set of allowed ports\"",""}),
    t({"", "  type        = set(number)"}),
    t({"", "  default     = [22, 80, 443]"}),
    t({"", "}"})
  }),

  -- Tuple variable
  s("var-tuple", {
    t({"variable \"coordinates\" {",""}),
    t({"  description = \"X and Y coordinates\"",""}),
    t({"", "  type        = tuple([string, number])"}),
    t({"  default     = [\"north\", 100]",""}),
    t({"", "}"})
  }),

  -- Sensitive variable
  s("var-sensitive", {
    t({"variable \"password\" {",""}),
    t({"  description = \"Password for the resource\"",""}),
    t({"", "  type        = string"}),
    t({"", "  sensitive   = true"}),
    t({"", "}"})
  }),

  -- Variable with validation
  s("var-validation", {
    t({"variable \"instance_count\" {",""}),
    t({"  description = \"Number of instances\"",""}),
    t({"", "  type        = number"}),
    t({"", "  default     = 1"}),
    t({"",""}),
    t({"", "  validation {"}),
    t({"", "    condition     = var.instance_count > 0 && var.instance_count <= 10"}),
    t({"    error_message = \"Instance count must be between 1 and 10.\"",""}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Common variables
  s("vars-common", {
    t({"variable \"project_name\" {",""}),
    t({"  description = \"Name of the project\"",""}),
    t({"", "  type        = string"}),
    t({"", "}"}),
    t({"",""}),
    t({"variable \"environment\" {",""}),
    t({"  description = \"Environment (dev, staging, prod)\"",""}),
    t({"", "  type        = string"}),
    t({"  default     = \"dev\"",""}),
    t({"",""}),
    t({"", "  validation {"}),
    t({"    condition     = contains([\"dev\", \"staging\", \"prod\"], var.environment)",""}),
    t({"    error_message = \"Environment must be dev, staging, or prod.\"",""}),
    t({"", "  }"}),
    t({"", "}"}),
    t({"",""}),
    t({"variable \"location\" {",""}),
    t({"  description = \"Azure region\"",""}),
    t({"", "  type        = string"}),
    t({"  default     = \"East US\"",""}),
    t({"", "}"})
  }),

  -- AWS common variables
  s("vars-aws", {
    t({"variable \"aws_region\" {",""}),
    t({"  description = \"AWS region\"",""}),
    t({"", "  type        = string"}),
    t({"  default     = \"us-east-1\"",""}),
    t({"", "}"}),
    t({"",""}),
    t({"variable \"availability_zones\" {",""}),
    t({"  description = \"List of availability zones\"",""}),
    t({"", "  type        = list(string)"}),
    t({"  default     = [\"us-east-1a\", \"us-east-1b\"]",""}),
    t({"", "}"})
  }),

  -- Terraform variables
  s("vars-tf", {
    t({"variable \"tf_version\" {",""}),
    t({"  description = \"Terraform version\"",""}),
    t({"", "  type        = string"}),
    t({"  default     = \">= 1.0\"",""}),
    t({"", "}"}),
    t({"",""}),
    t({"variable \"backend_config\" {",""}),
    t({"  description = \"Backend configuration\"",""}),
    t({"", "  type = object({"}),
    t({"", "    resource_group_name  = string"}),
    t({"", "    storage_account_name = string"}),
    t({"", "    container_name       = string"}),
    t({"", "    key                  = string"}),
    t({"", "  })"}),
    t({"", "  default = {"}),
    t({"    resource_group_name  = \"tfstate-rg\"",""}),
    t({"    storage_account_name = \"tfstatestorage\"",""}),
    t({"    container_name       = \"tfstate\"",""}),
    t({"    key                  = \"terraform.tfstate\"",""}),
    t({"", "  }"}),
    t({"", "}"})
  })
})
