# Terraform Snippets

Terraform snippets for multi-cloud infrastructure provisioning.

## Overview

This module contains comprehensive Terraform snippets for infrastructure as code, covering AWS, Azure, and other cloud providers.

## Available Snippets

### Core Terraform
- **`tf:resource`** - Standard Terraform resource
- **`tf:variable`** - Variable definition
- **`tf:output`** - Output definition
- **`tf:data`** - Data source

### Providers
- **`tf:aws`** - AWS provider configuration
- **`tf:azure`** - Azure provider configuration
- **`tf:gcp`** - Google Cloud provider configuration

### AWS Resources
- **`tf:aws:ec2`** - EC2 instance templates
- **`tf:aws:s3`** - S3 bucket configurations
- **`tf:aws:lambda`** - Lambda function templates

### Azure Resources
- **`tf:azure:rg`** - Resource group templates
- **`tf:azure:storage`** - Storage account configurations
- **`tf:azure:vm`** - Virtual machine templates

## Usage

1. Open a `.tf` file in Neovim
2. Type the snippet trigger (e.g., `tf:resource`)
3. Press `<Tab>` to expand the snippet
4. Fill in the placeholders

## Examples

### Resource Template
```hcl
# Type 'tf:resource' and press Tab
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
```

### Variable Definition
```hcl
# Type 'tf:variable' and press Tab
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-${random_string.suffix.result}"
}
```

## Version

Current version: 1.0.0

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history.

## Contributing

When adding new snippets:
1. Follow the existing snippet authoring style guide
2. Update this README with new snippet descriptions
3. Update the changelog
4. Test snippets in `.tf` files
