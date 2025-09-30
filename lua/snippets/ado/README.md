# Azure Pipelines Snippets

## Files
- `pipeline.lua` - Main pipeline template
- `powershell.lua` - PowerShell task
- `azure-cli.lua` - Azure CLI task
- `build.lua` - Build task
- `test.lua` - Test task
- `publish.lua` - Publish task
- `publish-artifact.lua` - Publish artifact task
- `download-artifact.lua` - Download artifact task

## Key Snippets
- `pipeline` - Main Azure Pipeline template
- `powershell-task` - PowerShell task
- `azure-cli-task` - Azure CLI task
- `build-task` - Build task
- `test-task` - Test task
- `publish-task` - Publish task
- `publish-artifact` - Publish artifact task
- `download-artifact` - Download artifact task

## Utilities
```lua
local utils = require("snippets.utils")
local fn = utils.fn
```