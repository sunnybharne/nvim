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
## Available Snippets

Below are the available snippet modules and how to use them. To expand a snippet, type the trigger word and press `<Tab>` (or your configured keymap).

| Module             | Description                        | Example Trigger(s)      | Usage Notes                       |
|--------------------|------------------------------------|-------------------------|------------------------------------|
| Bicep              | Azure Bicep templates               | `bicep-main`            | Creates a main Bicep template      |
| Terraform          | Terraform resources and modules     | `tf-main`, `tf-res`     | Main config, resource block        |
| TypeScript CDKTF   | CDK for Terraform in TypeScript     | `cdktf-main`            | Scaffold CDKTF app                 |
| Azure DevOps       | Azure DevOps pipeline YAML          | `azdo-pipeline`         | Pipeline starter                   |
| GitHub Actions     | GitHub Actions workflow YAML        | `gha-workflow`          | Workflow starter                   |
| Docker             | Dockerfile and Compose              | `dockerfile`, `compose` | Dockerfile, docker-compose.yml     |
| Pester             | PowerShell Pester tests             | `pester-test`           | Basic test block                   |
| Lua                | Lua config and plugin setup         | `lua-plugin`            | Neovim plugin setup                |
| Azure              | Azure CLI and ARM templates         | `az-cli`, `arm-main`    | CLI commands, ARM template starter |

You can customize triggers and snippet content in `lua/snippets/<module>.lua`.

| Plugin                | Description                                                                 | Key Features / Usage Notes                                  |
|-----------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------|
| bufferline            | Buffer/tab line for Neovim                                                  | Visual buffer management, icons, diagnostics                |
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
| pi-agent              | Personal Codex CLI bridge                                                   | Floating Codex terminal, buffer/selection prompts, status   |
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

## Telescope Keymaps

Telescope is your primary tool for finding files, searching code, and navigating your project.

### 📁 File Finding
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>ff` | `:Telescope find_files` | Find files in current directory |
| `<Space>fg` | `:Telescope live_grep` | Search text in files (live grep) |
| `<Space>fb` | `:Telescope buffers` | Find and switch between open buffers |
| `<Space>fr` | `:Telescope oldfiles` | Recent files (oldfiles) |

### 🔍 Help & Discovery
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>fh` | `:Telescope help_tags` | Search Neovim help documentation |
| `<Space>fc` | `:Telescope commands` | Search available commands |
| `<Space>fk` | `:Telescope keymaps` | Search all keybindings |
| `<Space>fm` | `:Telescope marks` | Jump to marks |
| `<Space>fj` | `:Telescope jumplist` | Navigate jump history |
| `<Space>fo` | `:Telescope vim_options` | Search/change vim settings |

### 🔎 Search Features
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>fw` | `:Telescope grep_string` | Search for word under cursor |
| `<Space>f/` | `:Telescope current_buffer_fuzzy_find` | Fuzzy find in current buffer |
| `<Space>fs` | `:Telescope spell_suggest` | Spelling suggestions |

### 🛠️ Code & LSP
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>fd` | `:Telescope diagnostics` | Browse all errors/warnings |
| `<Space>fq` | `:Telescope quickfix` | Browse quickfix list |
| `<Space>fl` | `:Telescope loclist` | Browse location list |
| `<Space>ft` | `:Telescope treesitter` | Browse functions/classes in file |

### 🔀 Git Integration
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>tf` | `:Telescope git_files` | Files tracked by git |
| `<Space>ts` | `:Telescope git_status` | Git changed files |
| `<Space>tb` | `:Telescope git_branches` | Switch git branches |
| `<Space>tgc` | `:Telescope git_commits` | Browse git commits |
| `<Space>tC` | `:Telescope git_bcommits` | Browse commits for current file |
| `<Space>tS` | `:Telescope git_stash` | Browse git stash |

### ⏱️ Resume & History
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>f.` | `:Telescope resume` | Reopen last telescope window |
| `<Space>f;` | `:Telescope command_history` | Browse command history |
| `<Space>f'` | `:Telescope search_history` | Browse search history |

### 💡 Telescope Navigation Tips
- **In Telescope picker:**
  - `<C-j>` / `<C-k>` - Move selection down/up
  - `<C-q>` - Send selected items to quickfix list
  - `<Esc>` or `<C-c>` - Close telescope
  - Type to filter results in real-time

## Git Keymaps

Multiple Git tools are integrated for different workflows.

### 🦥 LazyGit (Full Git UI)
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>gg` | `:LazyGit` | Open LazyGit (full git interface) |
| `<Space>lg` | `:LazyGit` | Open LazyGit (alias) |
| `<Space>lc` | `:LazyGitCurrentFile` | LazyGit for current file |
| `<Space>lf` | `:LazyGitFilter` | LazyGit filter |
| `<Space>lF` | `:LazyGitFilterCurrentFile` | LazyGit filter current file |

### 🌿 Neogit (Git UI in Neovim)
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>gn` | `:Neogit` | Open Neogit |
| `<Space>nc` | `:Neogit commit` | Neogit commit |
| `<Space>np` | `:Neogit push` | Neogit push |
| `<Space>nP` | `:Neogit pull` | Neogit pull |
| `<Space>nb` | `:Neogit branch` | Neogit branch management |
| `<Space>nr` | `:Neogit rebase` | Neogit rebase |
| `<Space>nm` | `:Neogit merge` | Neogit merge |
| `<Space>ns` | `:Neogit stash` | Neogit stash |
| `<Space>nR` | `:Neogit reset` | Neogit reset |

### 📊 Diffview (Diff Viewer)
| Keymap | Command | Description |
|--------|---------|-------------|
| `<Space>dd` | `:DiffviewOpen` | Open diffview |
| `<Space>dD` | `:DiffviewClose` | Close diffview |
| `<Space>dh` | `:DiffviewFileHistory` | Open file history |

**In Diffview windows:**
- `<Space>e` - Focus file panel
- `<Space>b` - Toggle file panel
- `<Space>co` - Choose OURS in conflict
- `<Space>ct` - Choose THEIRS in conflict
- `<Space>cb` - Choose BASE in conflict
- `<Space>ca` - Choose ALL in conflict

### 🔧 Gitsigns (Hunk Operations)
| Keymap | Command | Description |
|--------|---------|-------------|
| `]c` | Next hunk | Jump to next git change |
| `[c` | Previous hunk | Jump to previous git change |
| `<Space>hs` | Stage hunk | Stage current hunk |
| `<Space>hr` | Reset hunk | Reset current hunk |
| `<Space>hS` | Stage buffer | Stage entire file |
| `<Space>hR` | Reset buffer | Reset entire file |
| `<Space>hp` | Preview hunk | Preview hunk in float |
| `<Space>hi` | Preview hunk inline | Preview hunk inline |
| `<Space>hB` | Blame line | Show git blame for line |
| `<Space>hb` | Toggle line blame | Toggle inline blame |
| `<Space>hd` | Diff this | Diff current file |
| `<Space>hD` | Diff this ~ | Diff against HEAD~ |
| `<Space>hQ` | Quickfix all | All hunks to quickfix |
| `<Space>hq` | Quickfix | Current file hunks to quickfix |
| `<Space>tw` | Toggle word diff | Toggle word-level diff |

**In visual mode:**
- `<Space>hs` - Stage selected hunk
- `<Space>hr` - Reset selected hunk

**Text object:**
- `ih` - Select hunk (in visual/operator mode)

### 💡 Git Workflow Tips

**Quick commit workflow:**
1. `<Space>hs` - Stage hunks you want
2. `<Space>gg` - Open LazyGit
3. Make commit in LazyGit
4. Push

**Review changes:**
1. `<Space>dd` - Open Diffview to see all changes
2. `]c` / `[c` - Navigate between hunks
3. `<Space>hp` - Preview specific hunks

**Branch management:**
- Use `<Space>tb` for quick branch switching (Telescope)
- Use `<Space>gn` for full branch operations (Neogit)

---

## 🚀 Complete Git Workflow Guide

This section provides step-by-step workflows for mastering Git in Neovim.

### Level 1: Gitsigns (Hunk Operations)

**Core workflow:**
```
]c              → Jump to next change
<Space>hp       → Preview what changed
<Space>hs       → Stage the hunk
]c              → Move to next change
```

**Essential Gitsigns keys:**
| Key | Action | Use When |
|-----|--------|----------|
| `]c` / `[c` | Jump between changes | Navigating your edits |
| `<Space>hp` | Preview hunk | Want to see diff before staging |
| `<Space>hs` | Stage hunk | Ready to commit this change |
| `<Space>hu` | Unstage hunk | Accidentally staged wrong change |
| `<Space>hr` | Reset hunk | Discard change (⚠️ destructive!) |
| `<Space>hb` | Toggle blame | See who wrote each line |
| `<Space>hd` | Diff file | See all changes in current file |

**Visual mode staging (precision control):**
1. Select lines with `V` and `jjj`
2. Press `<Space>hs` to stage only selected lines
3. Split one change into multiple commits!

### Level 2: Neogit (Commit & Branch Management)

**Open Neogit:** `<Space>gn`

**Essential Neogit keys (inside Neogit buffer):**
| Key | Action | Description |
|-----|--------|-------------|
| `j` / `k` | Navigate | Move up/down (it's just Vim!) |
| `<Tab>` | Expand/collapse | Show/hide file details |
| `s` | Stage file/hunk | Stage item under cursor |
| `u` | Unstage file/hunk | Unstage item under cursor |
| `S` / `U` | Stage/unstage all | All files at once |
| `=` | View diff | See changes inline |
| `cc` | Commit | Open commit message buffer |
| `ca` | Amend | Edit last commit |
| `ce` | Extend | Add to last commit (no msg change) |
| `x` | Discard | Throw away changes (⚠️ destructive!) |
| `pp` | Push | Push to remote |
| `Pp` | Pull | Pull from remote |
| `bb` | Branch checkout | Switch branches (fuzzy search!) |
| `bc` | Branch create | Create new branch |
| `zz` | Stash | Save changes for later |
| `zp` | Pop stash | Restore stashed changes |
| `ll` | Log | View commit history |
| `r` | Refresh | Reload status |
| `?` | Help | Show all keybindings |
| `q` | Quit | Close Neogit |

**Complete commit workflow:**
```
<Space>gn       → Open Neogit
j j j           → Navigate to file
s               → Stage it
=               → Review diff (optional)
cc              → Commit
i               → Insert mode in commit buffer
```
Type commit message:
```
feat: add new feature

- Added cool thing
- Fixed bug
```
Then:
```
<Esc>
:wq             → Save and commit
pp              → Push to remote
q               → Close Neogit
```

**Branch workflow:**
```
<Space>gn       → Open Neogit
bb              → Branch checkout
```
Type to search, `<Enter>` to switch
```
bc              → Create new branch
```
Type name: "feature/new-thing", `<Enter>`

**Stash workflow:**
```
<Space>gn       → Open Neogit
zz              → Stash changes (they disappear)
```
Do other work...
```
<Space>gn       → Back to Neogit
zp              → Pop stash (changes come back)
```

### Level 3: Diffview (Code Review & Comparison)

**Open Diffview:** `<Space>dd`

**Essential Diffview commands:**
| Command | Description |
|---------|-------------|
| `:DiffviewOpen` or `<Space>dd` | Diff working directory changes |
| `:DiffviewOpen main` | Compare current branch vs main |
| `:DiffviewOpen HEAD~1` | Review last commit |
| `:DiffviewOpen abc123` | Review specific commit |
| `:DiffviewFileHistory %` | See history of current file |
| `:'<,'>DiffviewFileHistory` | History of selected lines only |
| `:DiffviewClose` | Close Diffview |

**Navigation in Diffview:**
| Key | Action |
|-----|--------|
| `<Tab>` | Focus file panel (left side) |
| `<Enter>` | Open file under cursor |
| `]c` / `[c` | Next/previous change (hunk) |
| `]D` / `[D` | Next/previous file |
| `j` / `k` | Scroll up/down |
| `/` | Search in file panel |

**Actions in file panel:**
| Key | Action |
|-----|--------|
| `s` | Stage file |
| `u` | Unstage file |
| `S` | Stage all |
| `U` | Unstage all |
| `=` | Toggle diff view inline |

**Merge conflict resolution:**
| Key | Action |
|-----|--------|
| `co` | Choose OURS (your changes) |
| `ct` | Choose THEIRS (their changes) |
| `cb` | Choose BASE (original) |
| `ca` | Choose ALL (both changes) |

**Review branch before PR:**
```
:DiffviewOpen main      → Compare with main
<Tab>                   → Focus file panel
j j j                   → Navigate files
<Enter>                 → View diff
]c                      → Jump through changes
]D                      → Next file
```
Review everything, then:
```
:DiffviewClose
<Space>gn → pp          → Push branch
```

**Review last commit:**
```
:DiffviewOpen HEAD~1    → See what you just committed
]c                      → Jump through changes
:DiffviewClose          → Close when done
```

**Resolve merge conflict:**
```
<Space>dd               → Open Diffview (shows conflict)
]c                      → Jump to conflict marker
co                      → Choose your version
```
Or:
```
ct                      → Choose their version
:w                      → Save file
<Space>gn               → Open Neogit
s                       → Stage resolved file
cc                      → Commit merge
```

### 🎯 The Complete Workflow (All Tools Combined)

**Scenario: Build a feature with multiple commits**

1. **Code and review as you go:**
   ```
   (Make changes in Neovim)
   ]c                  → Jump to changes
   <Space>hp           → Preview each change
   ```

2. **Stage precisely with Gitsigns:**
   ```
   <Space>hs           → Stage good changes
   V jjj <Space>hs     → Stage only selected lines
   ```

3. **Review everything with Diffview:**
   ```
   <Space>dd           → See all changes side-by-side
   ]c                  → Jump through hunks
   :DiffviewClose      → Close when satisfied
   ```

4. **Commit with Neogit:**
   ```
   <Space>gn           → Open Neogit
   =                   → Final review of staged changes
   cc                  → Commit
   i                   → Write message
   <Esc> :wq           → Save commit
   ```

5. **Before creating PR:**
   ```
   :DiffviewOpen main  → Compare with main branch
   <Tab> → j → <Enter> → Review every file
   ]D                  → Next file
   :DiffviewClose      → Done reviewing
   <Space>gn → pp      → Push to remote
   ```

**Scenario: Quick fix workflow**
```
(Fix bug in file)
<Space>hs           → Stage the fix
<Space>gn           → Open Neogit
cc                  → Commit
i                   → Type: "fix: resolve bug"
<Esc> :wq           → Save
pp                  → Push
q                   → Close Neogit
```

**Scenario: Split changes into multiple commits**
```
(Made 5 changes in one file)
]c                  → Jump to first change
<Space>hp           → Preview it
<Space>hs           → Stage it
]c                  → Next change
<Space>hs           → Stage this too
<Space>gn           → Neogit
cc                  → Commit first two changes
:wq                 → Save
]c                  → Jump to remaining changes
<Space>hs           → Stage next one
<Space>gn           → Neogit
cc                  → Second commit
:wq                 → Done!
```

### 🏆 Pro Tips

**Keyboard-only efficiency:**
- Neogit uses pure Vim motions - `j/k`, `gg/G`, `/search` all work
- Chain commands: `<Space>gn` → `s` → `cc` → `:wq` → `pp` → `q`
- Use `]c` in your code to audit all changes before committing

**Tool selection guide:**
- **Gitsigns** - Micro-level (jump between changes, stage hunks)
- **Neogit** - Macro-level (commit, branch, push, stash)
- **Diffview** - Review-level (compare branches, resolve conflicts, PR review)
- **Telescope** - Discovery-level (find files, search, switch branches)

**Muscle memory drills:**
1. Make 20 commits using: `]c` → `<Space>hp` → `<Space>hs` → `<Space>gn` → `cc`
2. Create and switch branches 10 times: `<Space>gn` → `bc` / `bb`
3. Review last 5 commits: `:DiffviewOpen HEAD~5..HEAD`

**See also:** Check `GIT_MASTERY_GUIDE.md` for detailed learning path with exercises!

## Contributing
- Follow the style guide in `lua/snippets/`
- Update documentation and changelogs
- Submit PRs with clear commit messages

## License
MIT

---
Happy coding with Neovim Snippets!
