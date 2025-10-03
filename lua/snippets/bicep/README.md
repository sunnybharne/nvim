# Bicep Snippets

## Installation
Default nvim configuration does not work out of the box. you need to do the manual installation from here.

## Files
- `basic-snippets.lua` - Core Bicep snippets
- `azure-resources.lua` - Azure resources
- `bicep.lua` - Bicep constructs
- `management.lua` - Management groups

## Key Snippets
- `param` - Parameter with dynamic description
- `var` - Variable declaration  
- `output` - Output with dynamic description
- `module` - Module reference
- `array` - Array parameter
- `for` - For loop construct

## Utilities
```lua
local utils = require("snippets.utils")
local fn = utils.fn
```
