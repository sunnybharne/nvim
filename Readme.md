# Neovim Snippets

A curated collection of professional code snippets for Neovim using LuaSnip.

## Prerequisites
- Neovim 0.8+
- LuaSnip plugin

## Installation
```bash
git clone <your-repo-url> ~/.config/nvim
cd ~/.config/nvim
./install.sh
nvim
```

## Usage
- Expand snippets with `<Tab>` in supported file types
- Customize snippets in `lua/snippets/`

## Available Modules
- Bicep
- Terraform
- TypeScript CDKTF
- Azure DevOps
- GitHub Actions
- Docker
- Pester
- Lua
- Azure

## Plugins Used

| Plugin                | Description                                                                 | Key Features / Usage Notes                                  |
|-----------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------|
| bufferline            | Buffer/tab line for Neovim                                                  | Visual buffer management, icons, diagnostics                |
| code-companion        | AI-powered code assistant and chat                                          | Chat, inline, command strategies, integrates with MCP Hub   |
| comment               | Easy commenting for code                                                    | Toggle comments, supports custom filetypes                  |
| copilot-vim           | GitHub Copilot integration                                                  | AI code suggestions, accepts with Tab, filetype control     |
| dap                   | Debug Adapter Protocol integration                                          | Debugging, breakpoints, REPL, language adapters             |
| diffview              | Git diff viewer                                                             | Side-by-side diffs, file history, merge tool                |
| gitsigns              | Git change indicators in signcolumn                                         | Stage/reset hunks, blame, preview, quickfix integration     |
| img-clip              | Paste images from clipboard into buffers                                    | Markdown image support, custom keymaps                      |
| lazygit               | Launch LazyGit from Neovim                                                  | Floating window, git commands, file filtering               |
| leap                  | Fast navigation between text                                                | Jump to targets, multi-window support                       |
| lspconfig             | Built-in LSP client configuration                                           | Language servers, diagnostics, code actions                 |
| lualine               | Statusline plugin                                                           | Customizable statusline, theme integration                  |
| luasnip               | Snippet engine for Neovim                                                   | VSCode/Lua snippets, jump/expand keymaps                    |
| markdown-preview      | Live Markdown preview in browser                                            | Preview Markdown files, toggle commands                     |
| mini-diff             | Minimal diff viewer and hunk management                                     | Overlay, apply/reset hunks, custom signs                    |
| neogit                | Git UI for Neovim                                                           | Commit, push, pull, branch, stash, integrates with diffview |
| none-ls               | Inject LSP diagnostics/formatters                                           | Formatters, diagnostics, auto-format on save                |
| nvim-cmp              | Completion engine                                                           | Integrates with LSP, snippets, buffer, path, cmdline        |
| nvim-tree             | File explorer                                                               | Tree view, icons, git integration, auto-open/close          |
| project               | Project root detection and management                                       | Patterns, LSP/pattern detection, telescope integration      |
| render-markdown       | Enhanced Markdown rendering in Neovim                                       | Custom filetypes, improved Markdown display                 |
| tab-management        | Tab management via Telescope                                                | Tab navigation, picker integration                          |
| telescope             | Fuzzy finder for files, buffers, etc.                                       | File/buffer search, git, keymaps, extensions                |
| tiny-inline-diagnostic| Inline diagnostics display                                                  | Modern single-line messages, source/code display            |
| tmux-navigator        | Seamless navigation between tmux and Neovim splits                          | <C-h/j/k/l> navigation                                      |
| toggleterm            | Terminal management in Neovim                                               | Floating/horizontal/vertical terminals, keymaps             |
| tokyonight            | Colorscheme for Neovim                                                      | Multiple styles, theme integration                          |
| treesitter            | Syntax highlighting and code parsing                                        | Language parsers, highlighting, textobjects                 |
| ui-select             | UI select integration for Telescope                                         | Dropdown picker, FZF integration                            |
| visual-multi          | Multiple cursors and selections                                             | Multi-cursor editing, custom keymaps                        |
| which-key             | Displays available keybindings in a popup                                   | Keybinding hints, group registration                        |
## Contributing
- Follow the style guide in `lua/snippets/`
- Update documentation and changelogs
- Submit PRs with clear commit messages

## License
MIT

---
Happy coding with Neovim Snippets!
