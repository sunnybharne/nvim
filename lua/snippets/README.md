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

## Snippet Authoring Style Guide (Global)

Use these rules for creating new LuaSnip snippets across all languages. This ensures future AI assistants and contributors follow the same style.

- **Commented preview first**: At the top of each snippet file, add a commented block that shows the exact code the snippet will expand to. Use realistic defaults. This is a preview for users and a contract for maintainers.
- **Focused snippets**: Prefer one clear concern per snippet (e.g., a resource, parameter, config block). Larger templates are fine but keep triggers distinct and purposeful.
- **Trigger naming**: Keep triggers short and readable. Optionally use a category-like prefix for clarity (e.g., `targetScope : subscription`, `param : string`, `mg : create`).
- **File naming**: Group related snippets in logically named files (e.g., `variables.lua`, `targetscope.lua`, `mg.lua`).
- **Insert nodes for edits**: Anything a user is likely to change should be an insert node (`i(...)`) with helpful defaults.
- **Optional sections**: Represent optional parts as commented lines in both the preview and the emitted snippet so users can quickly uncomment.
- **Indentation consistency**: Match existing indentation and spacing in each directory. Do not change indentation styles within a file.
- **No extra narration**: Comments in snippet bodies should explain the resulting target code only, not meta instructions.
- **Directory READMEs**: Add directory-specific rules and exceptions in each directory’s `README.md`.

### Minimal LuaSnip pattern to follow

```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Commented preview of the final expanded code goes here
-- Example:
-- resource example 'Provider/type@2021-01-01' = {
--   name: 'example-name'
-- }

ls.add_snippets('filetype', {
  s("trigger : action", {
    t({"code "}), i(1, "with-insert-node"), t({" more code"}),
  }),
})
```

### Language-specific notes

- **Bicep**: Follow Azure Bicep syntax strictly. Decorators are valid on `param` and `output`, but NOT on `targetScope`. Include commented optional blocks for commonly toggled sections.
- **Terraform**: Keep HCL formatting with two-space indentation. Use insert nodes for variable names, types, and defaults.
- **Docker**: Favor commonly used base images and commands as defaults; keep lines short for readability.
- **GitHub Actions / Azure Pipelines**: Use YAML-safe quoting in previews and snippet bodies. Keep indentation exact.

### Quick checklist

- Commented preview matches the snippet output
- Trigger is short and descriptive
- All user-editable values use insert nodes with sane defaults
- Indentation and spacing match the existing files
- Directory-specific exceptions are respected