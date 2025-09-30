# Terraform Snippets

## Files
- `terraform.lua` - Core Terraform snippets
- `aws-resources.lua` - AWS resources
- `azure-resources.lua` - Azure resources
- `mg.lua` - Management groups
- `patterns.lua` - Common patterns
- `provider.lua` - Provider configs
- `settings.lua` - Settings
- `simple-resources.lua` - Simple resources
- `variables.lua` - Variables

## Key Snippets
- `terraform` - Basic Terraform block
- `terraform-aws` - AWS provider block
- `variables` - Variable block with dynamic description
- `output` - Output block with dynamic description
- `data` - Data source block
- `locals` - Local values block

## Utilities
```lua
local utils = require("snippets.utils")
local fn = utils.fn
```
