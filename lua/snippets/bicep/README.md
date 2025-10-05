# Bicep Snippets

## Comprehensive Bicep Support

This configuration provides comprehensive Bicep language support in Neovim with all VSCode features and extensive snippets.

## Features

### Language Server Protocol (LSP) Features
- ✅ Syntax highlighting and validation
- ✅ IntelliSense and autocompletion
- ✅ Hover information and signature help
- ✅ Go to definition and references
- ✅ Rename and refactoring
- ✅ Code actions and diagnostics
- ✅ Document and workspace symbols
- ✅ Folding and breadcrumbs
- ✅ Inlay hints and semantic highlighting
- ✅ Formatting and validation
- ✅ Decompilation support
- ✅ Azure Container Registry integration

### Comprehensive Snippets
- **Basic Structure**: Parameters, variables, outputs, resources, modules
- **Azure Resources**: 20+ common Azure resources with full configurations
- **Advanced Patterns**: Complex loops, conditionals, user-defined functions
- **VSCode Equivalents**: All VSCode Bicep extension snippets included
- **Best Practices**: Proper decorators, validation, and error handling

### Snippet Categories

#### Basic Snippets (`basic-snippets.lua`)
- Parameters with decorators and validation
- Variables and outputs
- Resources and modules
- Arrays and objects
- For loops and conditionals
- Target scope and metadata

#### Azure Resources (`comprehensive-resources.lua`)
- Storage Accounts, Virtual Networks, Subnets
- Network Security Groups, Public IPs, NICs
- Virtual Machines, App Services, Key Vaults
- SQL Servers, Container Registries, AKS
- Function Apps, Logic Apps, Event Hubs
- Service Bus, API Management, Redis Cache
- Cosmos DB, Application Insights, Log Analytics

#### Advanced Patterns (`advanced-patterns.lua`)
- Complex template structures
- Multi-environment configurations
- Nested loops and dependencies
- Cross-resource references
- User-defined functions
- Assertions and validation
- Complex parameter validation

#### Comprehensive Basic (`comprehensive-basic.lua`)
- All Bicep language constructs
- String, array, object, and numeric functions
- Logical and comparison functions
- Resource and deployment functions
- List functions and scope functions
- User-defined functions and assertions
- With statements and imports/exports

## Installation

The configuration is automatically set up with:
1. **LSP Configuration**: Enhanced Bicep language server with all features
2. **Treesitter Support**: Syntax highlighting and semantic tokens
3. **Filetype Detection**: Automatic `.bicep` file recognition
4. **Comprehensive Snippets**: 100+ snippets covering all scenarios

## Usage

### Snippet Triggers
- `param` - Parameter with decorators
- `var` - Variable declaration
- `output` - Output with description
- `resource` - Basic resource
- `module` - Module reference
- `for` - For loop
- `if` - Conditional resource
- `func` - User-defined function
- `assert` - Assertion
- `sa` - Storage Account
- `vnet` - Virtual Network
- `vm` - Virtual Machine
- `app` - App Service
- `kv` - Key Vault
- And many more...

### LSP Features
- `<leader>f` - Format document
- `K` - Hover information
- `gd` - Go to definition
- `gr` - References
- `<leader>rn` - Rename
- `<leader>ca` - Code actions
- `]d` / `[d` - Navigate diagnostics

## Configuration

The configuration includes:
- Enhanced LSP settings with all Bicep features enabled
- Treesitter with semantic highlighting
- Filetype detection for `.bicep` files
- Comprehensive snippet collection
- VSCode-equivalent functionality

## Requirements

- Neovim with LSP support
- Bicep CLI installed
- .NET SDK for language server
- LuaSnip for snippets
- Treesitter for syntax highlighting

## Troubleshooting

If you encounter issues:
1. Ensure Bicep CLI is installed: `az bicep install`
2. Verify .NET SDK is available
3. Check LSP server is running: `:LspInfo`
4. Update Treesitter: `:TSUpdate bicep`
