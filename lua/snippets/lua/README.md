# Lua Snippets

Lua programming snippets for Neovim configuration and general Lua development.

## Available Snippets

### Basic Programming Constructs

| Snippet | Description | Example |
|---------|-------------|---------|
| `function` | Basic function declaration | `function myFunction(params)` |
| `lfunction` | Local function declaration | `local function myFunction(params)` |
| `if` | If statement | `if condition then` |
| `ifelse` | If-else statement | `if condition then ... else ... end` |
| `for` | For loop | `for i = 1, 10 do` |
| `forin` | For-in loop | `for key, value in pairs(table) do` |
| `while` | While loop | `while condition do` |
| `table` | Table creation | `local myTable = {}` |
| `local` | Local variable | `local variableName = value` |
| `return` | Return statement | `return value` |

### Neovim-Specific Snippets

| Snippet | Description | Example |
|---------|-------------|---------|
| `keymap` | Neovim keymap | `vim.keymap.set("n", "<leader>key", function)` |
| `autocmd` | Neovim autocmd | `vim.api.nvim_create_autocmd("BufEnter", {...})` |
| `plugin` | Plugin configuration | `return { { "plugin.name", config = function() end } }` |
| `lazy` | Lazy.nvim plugin | `{ "plugin.name", event = "InsertEnter", config = function() end }` |

### Error Handling & Debugging

| Snippet | Description | Example |
|---------|-------------|---------|
| `pcall` | Protected call with error handling | `local success, result = pcall(function)` |
| `error` | Error statement | `error("error message")` |
| `assert` | Assert statement | `assert(condition, "error message")` |
| `print` | Print statement | `print("message")` |

### Comments & Documentation

| Snippet | Description | Example |
|---------|-------------|---------|
| `comment` | Single line comment | `-- comment text` |
| `mcomment` | Multi-line comment | `--[[ comment text ]]` |
| `type` | Type annotation | `---@type string` |
| `ftype` | Function type annotation | `---@param param string` |

## Usage Examples

### Basic Function
```lua
-- Type "function" and press Tab
function myFunction(params)
  -- function body
end
```

### Neovim Keymap
```lua
-- Type "keymap" and press Tab
vim.keymap.set("n", "<leader>key", function, { desc = "description" })
```

### Plugin Configuration
```lua
-- Type "lazy" and press Tab
{
  "plugin.name",
  event = "InsertEnter",
  dependencies = {
    -- dependencies
  },
  config = function()
    -- plugin configuration
  end
}
```

### Error Handling
```lua
-- Type "pcall" and press Tab
local success, result = pcall(function)
if not success then
  error("error message")
end
```

## Navigation

- **Tab**: Jump to next placeholder
- **Shift+Tab**: Jump to previous placeholder
- **Ctrl+k**: Expand or jump forward
- **Ctrl+j**: Jump backward
- **Ctrl+l**: Change choice (for choice nodes)

## File Types

These snippets are available for:
- `.lua` files
- Neovim configuration files
- Lua-based plugin configurations
