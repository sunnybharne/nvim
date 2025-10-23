# Telescope Step-by-Step Guide

Complete guide to mastering Telescope for finding files, searching code, and navigating your project.

---

## Step 1: Understanding Telescope

Telescope is your **fuzzy finder** - it helps you find anything in your project instantly.

**What can Telescope find?**
- Files
- Text in files (grep)
- Open buffers
- Git files and commits
- Help documentation
- Commands and keymaps
- And much more!

**Key feature:** As you type, results filter in **real-time**.

---

## Step 2: Find Files (Most Common Use)

The most-used Telescope command:

**Exercise:**
1. Press `<Space>ff` (find files)
2. Telescope picker opens
3. Start typing a filename
4. Press `<Enter>` to open the file

**Try these:**
```
<Space>ff       → Type "init"     → Opens init.lua
<Space>ff       → Type "readme"   → Opens README.md
<Space>ff       → Type "git"      → Shows all files with "git" in name
```

**Pro tip:** You don't need to type the exact name - "keymap" will find "keymaps.lua"!

---

## Step 3: Telescope Navigation Keys

Inside any Telescope picker:

| Key | Action |
|-----|--------|
| `<C-j>` | Move selection **down** |
| `<C-k>` | Move selection **up** |
| `<C-n>` | Next item (alternative) |
| `<C-p>` | Previous item (alternative) |
| `<Enter>` | Open selected file |
| `<C-x>` | Open in **horizontal split** |
| `<C-v>` | Open in **vertical split** |
| `<C-t>` | Open in new **tab** |
| `<C-q>` | Send to **quickfix list** |
| `<Esc>` or `<C-c>` | Close Telescope |

**Exercise:**
1. Press `<Space>ff`
2. Type to filter
3. Use `<C-j>` and `<C-k>` to navigate
4. Press `<C-v>` to open in vertical split

---

## Step 4: Live Grep (Search Text in Files)

Find text across your entire project:

**Exercise:**
1. Press `<Space>fg` (find grep / live grep)
2. Type any text (e.g., "function")
3. See all occurrences across all files
4. Navigate with `<C-j>` / `<C-k>`
5. Press `<Enter>` to jump to that line

**Try searching for:**
```
<Space>fg       → Type "require"  → Find all imports
<Space>fg       → Type "TODO"     → Find all TODOs
<Space>fg       → Type "keymap"   → Find keymap definitions
```

**This is incredibly powerful** - faster than manual searching!

---

## Step 5: Search Current Buffer (File You're In)

Search within the file you're currently editing:

**Exercise:**
1. Open a large file (e.g., `init.lua`)
2. Press `<Space>f/` (find in current buffer)
3. Type text to find
4. Jump directly to matches

**Use case:** "Where is that function in this file?"

---

## Step 6: Find Buffers (Open Files)

Switch between files you already have open:

**Exercise:**
1. Open 3-4 files
2. Press `<Space>fb` (find buffers)
3. See list of all open files
4. Type to filter
5. Press `<Enter>` to switch

**This is faster than:**
- `:ls` then `:b <number>`
- Clicking through tabs
- `:bnext` / `:bprev`

---

## Step 7: Recent Files (Oldfiles)

Access recently opened files:

**Exercise:**
1. Press `<Space>fr` (find recent)
2. See your file history
3. Type to filter
4. Open any recent file instantly

**Use case:** "What was I working on yesterday?"

---

## Step 8: Help Tags (Search Documentation)

Never leave Neovim to search help:

**Exercise:**
1. Press `<Space>fh` (find help)
2. Type "split" to find help on splits
3. Press `<Enter>` to open help doc
4. Try searching: "window", "buffer", "register"

**This is your built-in manual** - incredibly useful!

---

## Step 9: Search Word Under Cursor

Find all occurrences of the current word:

**Exercise:**
1. Put cursor on any word/function name
2. Press `<Space>fw` (find word)
3. See all occurrences across project
4. Jump to any occurrence

**Use case:** "Where is this function used?"

---

## Step 10: Commands (Find Available Commands)

See all available Neovim commands:

**Exercise:**
1. Press `<Space>fc` (find commands)
2. Type "Diff" to see all diff commands
3. Type "Telescope" to see all Telescope commands
4. Press `<Enter>` to run a command

**Discovery tool** - great for learning new features!

---

## Step 11: Keymaps (Find Your Keybindings)

Forgot a keymap? Search for it!

**Exercise:**
1. Press `<Space>fk` (find keymaps)
2. Type "git" to see all git keymaps
3. Type "telescope" to see telescope keymaps
4. Type "space" to see leader keymaps

**Never forget a keymap again!**

---

## Step 12: Git Integration (Files)

Find Git-tracked files only:

**Exercise:**
1. Press `<Space>tf` (telescope git files)
2. See only files tracked by git
3. Faster than `<Space>ff` in large projects

**Also try:**
```
<Space>ts       → Git status (changed files)
<Space>tb       → Git branches (switch branches)
<Space>tgc      → Git commits (browse history)
```

---

## Step 13: Git Branches (Quick Switch)

Switch branches instantly:

**Exercise:**
1. Press `<Space>tb` (telescope branches)
2. See all branches
3. Type to filter
4. Press `<Enter>` to checkout

**Faster than:** `git branch` + `git checkout`

---

## Step 14: Diagnostics (Errors & Warnings)

Browse all LSP errors/warnings:

**Exercise:**
1. If you have any errors in project
2. Press `<Space>fd` (find diagnostics)
3. See all errors listed
4. Jump to any error with `<Enter>`

**Use case:** "Show me all errors in project"

---

## Step 15: Treesitter (Navigate Functions/Classes)

Jump to functions and classes in current file:

**Exercise:**
1. Open a large file with functions
2. Press `<Space>ft` (find treesitter)
3. See all functions/classes/methods
4. Type to filter
5. Jump to any function

**Use case:** "Jump to the setup() function"

---

## Step 16: Resume Last Search

Reopen your last Telescope search:

**Exercise:**
1. Do any Telescope search
2. Close it with `<Esc>`
3. Press `<Space>f.` (resume)
4. Your last search reopens!

**Use case:** "I closed that search by mistake!"

---

## Step 17: Quickfix List

Send multiple results to quickfix:

**Exercise:**
1. Press `<Space>fg` and search for "function"
2. Mark multiple items with `<Tab>` (or `<S-Tab>` to unmark)
3. Press `<C-q>` to send to quickfix
4. Navigate quickfix with `:cnext` / `:cprev`

**Or open quickfix picker:**
```
<Space>fq       → Browse quickfix list in Telescope
```

---

## Step 18: Spell Suggestions

Get spelling suggestions for word under cursor:

**Exercise:**
1. Type a misspelled word: "teh"
2. Put cursor on it
3. Press `<Space>fs` (find spell)
4. See suggestions
5. Press `<Enter>` to replace

---

## Step 19: Vim Options

Search and change Vim settings:

**Exercise:**
1. Press `<Space>fo` (find options)
2. Type "number" to find number-related settings
3. Type "wrap" to find line wrapping
4. Press `<Enter>` to toggle/change

**Discovery tool** - see all available options!

---

## Step 20: Command History

See your previous commands:

**Exercise:**
1. Press `<Space>f;` (command history)
2. See all commands you've run
3. Press `<Enter>` to run again

**Also try:**
```
<Space>f'       → Search history (your / searches)
```

---

## Telescope Cheat Sheet

### Essential Keys (Memorize First)
- `<Space>ff` - Find files
- `<Space>fg` - Live grep (search text)
- `<Space>fb` - Find buffers
- `<Space>fr` - Recent files
- `<Space>f/` - Search current file

### Inside Telescope Picker
- `<C-j>` / `<C-k>` - Navigate down/up
- `<Enter>` - Open file
- `<C-x>` - Horizontal split
- `<C-v>` - Vertical split
- `<C-t>` - New tab
- `<C-q>` - Send to quickfix
- `<Esc>` - Close

### Help & Discovery
- `<Space>fh` - Help tags
- `<Space>fc` - Commands
- `<Space>fk` - Keymaps
- `<Space>fo` - Vim options

### Code Navigation
- `<Space>fw` - Word under cursor
- `<Space>fd` - Diagnostics (errors)
- `<Space>ft` - Functions/classes (treesitter)
- `<Space>fq` - Quickfix list

### Git
- `<Space>tf` - Git files
- `<Space>ts` - Git status
- `<Space>tb` - Git branches
- `<Space>tgc` - Git commits

### History
- `<Space>f.` - Resume last search
- `<Space>f;` - Command history
- `<Space>f'` - Search history

---

## Practice Challenge

Complete these tasks using Telescope:

1. Find and open `init.lua`: `<Space>ff` → type "init"
2. Search for "keymap" in all files: `<Space>fg` → type "keymap"
3. Switch to a buffer: `<Space>fb` → select one
4. Find help on "split": `<Space>fh` → type "split"
5. See all keymaps: `<Space>fk` → explore
6. Find word under cursor: put cursor on word → `<Space>fw`
7. Browse git branches: `<Space>tb` → navigate
8. Resume your search: `<Space>f.`
9. Check command history: `<Space>f;`
10. Find diagnostics: `<Space>fd`

**Goal:** Complete all 10 in under 3 minutes!

---

## Real-World Workflows

### Workflow 1: Finding a Function Definition
```
<Space>fg       → Type function name
<Enter>         → Jump to definition
```

### Workflow 2: Reviewing Changed Files
```
<Space>ts       → Git status
<C-j> / <C-k>   → Navigate files
<Enter>         → Open file
]c              → Jump to changes (Gitsigns)
```

### Workflow 3: Switching Context
```
<Space>tb       → Branches
<Enter>         → Switch branch
<Space>fr       → Recent files
<Enter>         → Open file you were working on
```

### Workflow 4: Project-Wide Refactor
```
<Space>fg       → Search old function name
<C-q>           → Send all to quickfix
:cdo s/old/new/gc → Replace in all files
:wa             → Save all
```

### Workflow 5: Learning New Features
```
<Space>fc       → Browse commands
Type "Telescope"
<Enter>         → Run command
<Space>fh       → Read help
```

---

**You're now a Telescope power user!** 🚀

Telescope is your command center - use it for everything. The more you use it, the faster you'll become.

**Pro tip:** Your fingers should instinctively reach for `<Space>f` whenever you need to find something!

---

**Next:** Combine Telescope with Git tools in `04-complete-workflow.md` for ultimate productivity!
