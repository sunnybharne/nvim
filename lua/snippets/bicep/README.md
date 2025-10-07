# Bicep Snippets

Azure Bicep snippets for infrastructure as code development.

## Overview

This module contains comprehensive Bicep snippets for Azure Resource Manager templates, covering common infrastructure patterns and best practices.

## Available Snippets

### Basic Infrastructure
- **`bicep:resource`** - Standard Azure resource template
- **`bicep:param`** - Parameter definition
- **`bicep:var`** - Variable definition
- **`bicep:output`** - Output definition

### Advanced Patterns
- **`bicep:loop`** - Resource loops and iterations
- **`bicep:conditional`** - Conditional resource deployment
- **`bicep:module`** - Bicep module reference
- **`bicep:targetscope`** - Target scope definitions

### Azure Resources
- **`bicep:storage`** - Storage account templates
- **`bicep:vm`** - Virtual machine configurations
- **`bicep:network`** - Networking resources
- **`bicep:appservice`** - App Service configurations

## Usage

1. Open a `.bicep` file in Neovim
2. Type the snippet trigger (e.g., `bicep:resource`)
3. Press `<Tab>` to expand the snippet
4. Fill in the placeholders

## Examples

### Resource Template
```bicep
// Type 'bicep:resource' and press Tab
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'st${resourceGroup().name}${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  }
}
```

### Parameter Definition
```bicep
// Type 'bicep:param' and press Tab
@description('The name of the resource group')
param resourceGroupName string = 'rg-${uniqueString(resourceGroup().id)}'
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
4. Test snippets in `.bicep` files