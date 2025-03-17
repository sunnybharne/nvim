# Neovim Configuration

This repository contains the configuration files for Neovim, a highly customizable text editor. The configuration is written in Lua and includes various plugins to enhance the functionality of Neovim.

## Directory Structure

```bash
nvim
├── init.lua
├── lazy-lock.json
├── lua
    ├── config
    │   ├── keymap.lua
    │   ├── options.lua
    │   └── plugin-manager.lua
    └── plugins
        ├── auto-pair.lua
        ├── cmp.lua
        ├── colorize.lua
        ├── confirm.lua
        ├── copilot-chat.lua
        ├── copilot.lua
        ├── flash.lua
        ├── lazygit.lua
        ├── lint.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── mason-tools.lua
        ├── mini-files.lua
        ├── telescope.lua
        ├── tokyo-night.lua
        └── which-key.lua
```

## Configuration Files

### `init.lua`

The main configuration file that loads other configuration modules.

```lua
require("config.options")
require("config.plugin-manager")
require("config.keymap")
```

### `lua/config/keymap.lua`

Defines custom key mappings for Neovim.

### `lua/config/options.lua`

Sets various options for Neovim, such as leader key, mouse mode, break indent, undo history, and search behavior.

### `lua/config/plugin-manager.lua`

Configures the plugin manager and ensures that `lazy.nvim` is installed.

### `lua/plugins/*.lua`

Contains individual Lua scripts for configuring various Neovim plugins. Some of the key plugins configured are:

- `cmp.lua`: Configuration for the `nvim-cmp` completion plugin.
- `lsp.lua`: Configuration for Language Server Protocol (LSP) support.
- `lualine.lua`: Configuration for the status line.
- `telescope.lua`: Configuration for the fuzzy finder.
- `which-key.lua`: Configuration for keybinding hints.

## Installation

1. Clone this repository to your Neovim configuration directory:

```sh
git clone <repository_url> ~/.config/nvim
```

2. Open Neovim and the plugins will be automatically installed and configured.

## Usage

After installing the configuration, you can start using Neovim with the enhanced functionality provided by the plugins. Refer to the individual plugin documentation for more details on usage and customization.

## Contributing

Feel free to open issues or submit pull requests if you find any bugs or have suggestions for improvements.

## License

This project is licensed under the MIT License.
