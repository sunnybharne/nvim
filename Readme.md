# Keymaps

## File Explorer (Neo-tree)
| Keymap | Description |
|--------|-------------|
| `<Leader>e` | Toggle Neo-tree file explorer |
| `<Leader>o` | Focus Neo-tree |

## Markdown Preview
| Keymap | Description |
|--------|-------------|
| `<Leader>mp` | Start markdown preview |
| `<Leader>ms` | Stop markdown preview |
| `<Leader>mt` | Toggle markdown preview |

## General
| Keymap | Description |
|--------|-------------|
| `<Leader>rr` | Reload Neovim configuration |

## Window Navigation
| Keymap | Description |
|--------|-------------|
| `<C-h>` | Move to the left window |
| `<C-j>` | Move to the window below |
| `<C-k>` | Move to the window above |
| `<C-l>` | Move to the right window |

## Telescope
| Keymap | Description |
|--------|-------------|
| `<Leader>ff` | Find files |
| `<Leader>fg` | Live grep (search in files) |
| `<Leader>fb` | Find buffers |
| `<Leader>fh` | Help tags |
| `<Leader>fr` | Recent files |
| `<Leader>fc` | Commands |
| `<Leader>fk` | Keymaps |
| `<C-x>` | Go to file selection as a split |
| `<C-v>` | Go to file selection as a vsplit |
| `<C-t>` | Go to a file in a new tab |

### Git Navigation
| Keymap | Description |
|--------|-------------|
| `<Leader>tf` | Git files (tracked files only) |
| `<Leader>ts` | Git status (modified/staged files) |
| `<Leader>tb` | Git branches |
| `<Leader>tgc` | Git commits |
| `<Leader>tC` | Git buffer commits |

#### Git Navigation Features:
- **Git files vs Find files**: `<Leader>gf` is often faster than `<Leader>ff` because it only searches tracked files
- **Git status**: Perfect for seeing what you've changed before committing
- **Git branches**: Switch between feature branches with visual preview
- **Git commits**: Browse commit history and checkout specific commits
- **Git buffer commits**: See commit history for the current file specifically
- **Navigation shortcuts**: All Git pickers support `<C-x>` (split), `<C-v>` (vsplit), `<C-t>` (new tab)

## Git Signs (gitsigns.nvim)
| Keymap | Description |
|--------|-------------|
| `]c` | Next hunk |
| `[c` | Previous hunk |
| `<Leader>hs` | Stage hunk |
| `<Leader>hr` | Reset hunk |
| `<Leader>hS` | Stage buffer |
| `<Leader>hR` | Reset buffer |
| `<Leader>hp` | Preview hunk |
| `<Leader>hi` | Preview hunk inline |
| `<Leader>hb` | Blame line |
| `<Leader>hd` | Diff this |
| `<Leader>hD` | Diff this (~) |
| `<Leader>hQ` | Set quickfix list (all) |
| `<Leader>hq` | Set quickfix list |
| `<Leader>tb` | Toggle current line blame |
| `<Leader>tw` | Toggle word diff |
| `ih` | Select hunk (text object) |

### Git Signs Features:
- **Visual indicators**: See `+`, `~`, `_` signs for added, modified, deleted lines
- **Blame information**: Hover over lines to see who changed them and when
- **Hunk navigation**: Jump between code changes with `]c` and `[c`
- **Precise staging**: Stage only specific parts of files instead of entire files
- **Diff preview**: See exactly what changed before committing
- **Text objects**: Select hunks with `ih` for precise editing

## Project Management
| Keymap | Description |
|--------|-------------|
| `<Leader>p` | Open project picker |
| `<Leader>P` | Change to project root |
| `<Leader>f` | Find files in project |
| `<Leader>sg` | Live grep in project |

### Project Features:
- **Project detection**: Auto-detect project roots (Git, package.json, etc.)
- **Recent projects**: Quick access to recently opened projects
- **Session management**: Save/restore project sessions
- **Telescope integration**: Beautiful project picker interface
- **Git integration**: Works with Git repositories
- **Custom patterns**: Define project detection rules

### Project Detection Patterns:
- **Version Control**: `.git`, `.hg`, `.bzr`, `.svn`, `_darcs`
- **Programming Languages**: `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `pom.xml`, `Gemfile`
- **Build Systems**: `Makefile`, `CMakeLists.txt`, `meson.build`, `configure.ac`
- **Container & Infrastructure**: `Dockerfile`, `docker-compose.yml`, `terraform.tf`, `ansible.cfg`
- **Kubernetes & Cloud**: `k8s.yaml`, `helm.yaml`, `skaffold.yaml`, `pulumi.yaml`
- **CI/CD**: `azure-pipelines.yml`, `Jenkinsfile`, `.github`, `gitlab-ci.yml`
- **Frontend**: `tsconfig.json`, `angular.json`, `vue.config.js`, `next.config.js`
- **Testing**: `jest.config.js`, `cypress.json`, `playwright.config.js`
- **Code Quality**: `eslint.config.js`, `prettier.config.js`, `husky.config.js`

### How Project Detection Works:
1. **LSP Detection**: Uses language server to find project roots
2. **Pattern Detection**: Looks for specific files/folders in directory tree
3. **Priority Order**: LSP first, then pattern matching
4. **Automatic**: Detects projects when you open files
5. **Session Management**: Remembers project locations

## Git Power Combo (Complete Git Workflow)

### LazyGit (Quick Git Operations)
| Keymap | Description |
|--------|-------------|
| `<Leader>lg` | Open LazyGit |
| `<Leader>lc` | LazyGit current file |
| `<Leader>lf` | LazyGit filter |
| `<Leader>lF` | LazyGit filter current file |

### Neogit (Advanced Git Interface)
| Keymap | Description |
|--------|-------------|
| `<Leader>gn` | Open Neogit |
| `<Leader>nc` | Neogit commit |
| `<Leader>np` | Neogit push |
| `<Leader>nP` | Neogit pull |
| `<Leader>nb` | Neogit branch |
| `<Leader>nr` | Neogit rebase |
| `<Leader>nm` | Neogit merge |
| `<Leader>ns` | Neogit stash |
| `<Leader>nR` | Neogit reset |

### Diffview (Git Diff Viewer)
| Keymap | Description |
|--------|-------------|
| `<Leader>dd` | Open diffview |
| `<Leader>dD` | Close diffview |
| `<Leader>dh` | Open file history |
| `<Leader>dH` | Open file history for current file |
| `<Leader>df` | Focus files panel |
| `<Leader>dt` | Toggle files panel |
| `<Leader>dl` | Open commit log |
| `<Leader>dr` | Refresh diffview |

### Git Workflow Features:
- **LazyGit**: Quick branching, stashing, rebasing, and interactive Git operations
- **Neogit**: Advanced Git interface with staging, committing, and repository management
- **Diffview**: Beautiful diff viewer with file history and conflict resolution
- **Gitsigns**: Inline Git indicators and hunk operations
- **Complete Integration**: All tools work together seamlessly

## Bufferline (Tab Line)
| Keymap | Description |
|--------|-------------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<Leader>bp` | Toggle pin buffer |
| `<Leader>bo` | Close other buffers |
| `<Leader>br` | Close buffers to the right |
| `<Leader>bl` | Close buffers to the left |
| `<Leader>bx` | Pick buffer to close |
| `<Leader>b1-9` | Go to buffer 1-9 |

### Bufferline Features:
- **Buffer tabs**: Visual tabs for open buffers
- **File icons**: Shows file type icons
- **Modified indicators**: Shows unsaved changes
- **Buffer navigation**: Easy switching between buffers
- **Buffer management**: Close, pin, and organize buffers
- **Diagnostics**: Shows LSP errors/warnings in tabs
- **Hover information**: Buffer details on hover
- **Smart sorting**: Intelligent buffer ordering

## Lualine (Status Line)
| Feature | Description |
|---------|-------------|
| **Mode** | Current vim mode (Normal, Insert, Visual, etc.) |
| **Branch** | Git branch name |
| **Diff** | Git diff indicators |
| **Diagnostics** | LSP diagnostics (errors, warnings, hints) |
| **Filename** | Current file name and path |
| **Encoding** | File encoding (UTF-8, etc.) |
| **File Format** | Line endings (Unix, Windows, Mac) |
| **File Type** | File type (lua, python, javascript, etc.) |
| **Progress** | Cursor position in file |
| **Location** | Line and column numbers |

### Lualine Features:
- **Git integration**: Shows branch, diff, and diagnostics
- **LSP integration**: Displays language server information
- **File information**: Encoding, format, and type
- **Navigation info**: Progress and location
- **Theme support**: Matches your tokyonight theme
- **Extension support**: Works with nvim-tree, telescope, lazy

## nvim-cmp (Code Completion)
| Keymap | Description |
|--------|-------------|
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<Tab>` | Select next item / Expand snippet |
| `<S-Tab>` | Select previous item / Jump snippet |
| `<CR>` | Confirm selection |
| `<C-b>` | Scroll documentation up |
| `<C-f>` | Scroll documentation down |

### Completion Sources:
- **[LSP]**: Language Server Protocol completions
- **[Snippet]**: Code snippets and templates
- **[Buffer]**: Words from current and other buffers
- **[Path]**: File system paths
- **[Cmdline]**: Command line completions

### nvim-cmp Features:
- **Intelligent completion**: Context-aware suggestions
- **Multiple sources**: LSP, snippets, buffer, paths
- **Snippet support**: Expand code templates with Tab
- **Documentation**: Hover documentation for functions
- **Command line completion**: Complete commands and paths
- **Visual indicators**: See source of each completion

### Custom Snippets Available:
- **Lua**: Neovim configuration and Lua programming snippets
- **Terraform**: Infrastructure as Code snippets
- **Azure**: Azure resource and ADO pipeline snippets
- **Docker**: Container and compose file snippets
- **GitHub Actions**: CI/CD workflow snippets
- **Pester**: PowerShell testing framework snippets
- **TypeScript**: CDK and TypeScript snippets
- **Bicep**: Azure Bicep template snippets

### Snippet Navigation:
| Keymap | Description |
|--------|-------------|
| `<Tab>` | Expand snippet / Jump to next placeholder |
| `<S-Tab>` | Jump to previous placeholder |
| `<C-k>` | Expand or jump forward in snippet |
| `<C-j>` | Jump backward in snippet |
| `<C-l>` | Change snippet choice |

## Tab Management
| Keymap | Description |
|--------|-------------|
| `<Leader>tn` | New tab |
| `<Leader>tc` | Close current tab |
| `<Leader>to` | Close other tabs |
| `<Leader>tt` | Switch tabs (Telescope picker) |
| `<Leader>t1` to `<Leader>t9` | Go to tab 1-9 |

### Tab Management Features:
- **Project-based tabs**: Each tab shows project root directory name
- **Telescope integration**: Fuzzy finder for tab switching
- **Tab preview**: See project info, CWD, and current file
- **Quick navigation**: Direct access to tabs 1-9
- **Tab operations**: Create, close, and manage tabs
- **Project isolation**: Use tabs for different projects

## Visual Mode
| Keymap | Description |
|--------|-------------|
| `<` | Indent left and reselect |
| `>` | Indent right and reselect |
