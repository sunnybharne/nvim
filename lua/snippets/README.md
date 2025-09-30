# Neovim Snippets Organization

## Directories
- `azure/` - Azure-specific snippets
- `azure-pipelines/` - Azure Pipelines snippets  
- `bicep/` - Bicep infrastructure snippets
- `docker/` - Docker containerization snippets
- `github-actions/` - GitHub Actions workflow snippets
- `pester/` - PowerShell testing snippets
- `terraform/` - Terraform infrastructure snippets
- `typescript/` - TypeScript and CDKTF snippets

## Structure
Each directory contains:
- Individual snippet files (e.g., `pipeline.lua`, `dockerfile.lua`)
- `README.md` - Directory-specific documentation

## Global Utilities
- `utils.lua` - **Single shared utilities file for all directories**

## Import Pattern
```lua
local utils = require("snippets.utils")
local fn = utils.fn
-- Import other specific functions as needed
```

## Available Utility Functions
- `fn` - Basic function for text generation

## Benefits
- **Single Source of Truth** - One utils file for all directories
- **Consistent Structure** - All directories follow the same pattern
- **Easy Maintenance** - Update shared functions in one place
- **Professional Organization** - Clean, scalable snippet management