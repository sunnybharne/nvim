# Diffview Step-by-Step Guide

Complete guide to mastering Diffview for code review, branch comparison, and merge conflicts.

---

## Step 1: Understanding Diffview's Purpose

Diffview shows you **side-by-side diffs** - much better than line-by-line diffs.

**Three main use cases:**
1. **Review your changes** before committing
2. **Compare branches** (yours vs main)
3. **Resolve merge conflicts** (the killer feature)

---

## Step 2: Open Diffview (Basic Usage)

Let's start simple:

| Command | What It Shows |
|---------|---------------|
| `<Space>dd` | Diff current changes (like `git diff`) |
| `:DiffviewOpen` | Same as above |
| `:DiffviewClose` | Close Diffview |

**Exercise:**
1. Make a change to any file
2. Press `<Space>dd`
3. You'll see **two panels:**
   - Left = **OLD** version (before changes)
   - Right = **NEW** version (with changes)

**Navigation:**
- Changes are highlighted in red (removed) and green (added)
- Your cursor works in both panels
- Use `j` / `k` to scroll

---

## Step 3: The Diffview Layout (Understanding What You See)

When you open Diffview, you get **3 areas:**

```
┌─────────────────┬─────────────────┐
│                 │                 │
│   File Panel    │   Diff Panel    │
│   (left side)   │  (side-by-side) │
│                 │                 │
│  file1.lua      │  OLD  │  NEW   │
│  file2.lua      │       │        │
│  file3.lua      │       │        │
└─────────────────┴─────────────────┘
```

**Key insight:** 
- **File Panel** = List of changed files (like Neogit)
- **Diff Panel** = The actual code comparison

---

## Step 4: Navigate Between Files

You have multiple files changed - let's jump between them:

| Key | Action |
|-----|--------|
| `<Tab>` | Jump to **file panel** |
| `<Enter>` | Open file under cursor |
| `]c` | Next change in **current file** |
| `[c` | Previous change in **current file** |
| `]D` | Next **file** |
| `[D` | Previous **file** |

**Exercise:**
1. Make changes to 3 files
2. Open Diffview: `<Space>dd`
3. Press `<Tab>` to focus file panel (left)
4. Navigate with `j` / `k`
5. Press `<Enter>` on a file to see its diff
6. Press `]D` to jump to next file
7. Press `[D` to go back

**Pro tip:** You can also use `/` to search in the file panel!

---

## Step 5: Navigate Within Diffs (Jump to Changes)

Within a file, jump between actual code changes:

| Key | Action |
|-----|--------|
| `]c` | Jump to **next change** (hunk) |
| `[c` | Jump to **previous change** (hunk) |

**Exercise:**
1. Open a file with 3+ changes
2. Open Diffview: `<Space>dd`
3. Press `]c` repeatedly - cursor jumps to each change
4. Press `[c` to go backwards

**This is huge:** You can quickly scan all changes without reading unchanged code!

---

## Step 6: Stage/Unstage from Diffview

You can stage directly from the diff view:

**In the file panel:**
| Key | Action |
|-----|--------|
| `s` | Stage file under cursor |
| `u` | Unstage file under cursor |
| `S` | Stage all |
| `U` | Unstage all |

**Exercise:**
1. Open Diffview with changes: `<Space>dd`
2. Press `<Tab>` to focus file panel
3. Navigate to a file: `j`
4. Press `s` - it stages
5. Notice the icon changes (staged vs unstaged)

---

## Step 7: Compare Branches (The Power Move)

This is where Diffview shines - comparing your branch against main:

**Command:**
```vim
:DiffviewOpen main
```

This shows **ALL differences** between your current branch and `main`.

**Exercise:**
1. Make sure you're on a feature branch
2. Make some commits
3. Run: `:DiffviewOpen main`
4. You'll see every file that differs from main
5. Navigate through them with `<Tab>` + `<Enter>` + `]D`

**Use cases:**
- Review your branch before creating PR
- See what changed in main while you were working
- Compare any two branches: `:DiffviewOpen branch1..branch2`

---

## Step 8: Review a Commit (Time Travel)

See what changed in a specific commit:

**Command:**
```vim
:DiffviewOpen HEAD~1
```

This shows the **last commit's changes**.

**More examples:**
- `:DiffviewOpen HEAD~2` - 2 commits ago
- `:DiffviewOpen abc123` - Specific commit hash
- `:DiffviewOpen HEAD~3..HEAD` - Last 3 commits combined

**Exercise:**
1. Run: `:DiffviewOpen HEAD~1`
2. Review what you changed in your last commit
3. Close: `:DiffviewClose`

**Use case:** "What did I change yesterday?" or "What does this commit do?"

---

## Step 9: File History (See How a File Evolved)

See all changes to a specific file over time:

**Command:**
```vim
:DiffviewFileHistory %
```

The `%` means "current file".

**Exercise:**
1. Open any file that has history: `:e lua/config/keymaps.lua`
2. Run: `:DiffviewFileHistory %`
3. You'll see a list of **all commits** that touched this file
4. Press `<Enter>` on a commit to see its diff
5. Navigate commits with `j` / `k`

**Specific file:**
```vim
:DiffviewFileHistory lua/config/keymaps.lua
```

---

## Step 10: File History for Visual Selection (Blame on Steroids)

See history of **specific lines** only:

**Exercise:**
1. Open a file
2. Enter visual mode: `V`
3. Select some lines: `jjj`
4. Run: `:'<,'>DiffviewFileHistory`
5. See only commits that changed **those specific lines**!

**This is incredible for:** "Who changed this function and why?"

---

## Step 11: Close Diffview (Multiple Ways)

| Command | Action |
|---------|--------|
| `:DiffviewClose` | Close Diffview |
| `:tabclose` | Close current tab (Diffview uses tabs) |
| `ZZ` | In file panel, closes Diffview |

**Pro tip:** Diffview opens in a new tab, so you can switch between it and your code with `:tabn` / `:tabp` or `gt` / `gT`.

---

## Step 12: Merge Conflict Resolution (The Killer Feature)

When you have merge conflicts, Diffview makes it **visual and easy**.

**Setup a conflict (for practice):**
1. Create a conflict (we can do this if you want)
2. Open Diffview: `<Space>dd`
3. You'll see a **3-way merge view:**
   ```
   OURS  │  BASE  │  THEIRS
   ```

**Conflict resolution keys:**

| Key | Action |
|-----|--------|
| `co` | Choose **OURS** (your changes) |
| `ct` | Choose **THEIRS** (their changes) |
| `cb` | Choose **BASE** (original) |
| `ca` | Choose **ALL** (both changes) |

**Exercise (we'll do this later when you have a conflict):**
1. Navigate to conflict with `]c`
2. Press `co` to choose your version
3. Or press `ct` to choose their version
4. Save the file: `:w`
5. Stage it in Neogit: `<Space>gn` → `s`
6. Commit: `cc`

**This alone saves hours of manual conflict editing!**

---

## Step 13: Combine with Neogit (The Ultimate Workflow)

Here's how Diffview + Neogit work together:

**Scenario: Review branch before PR**

1. **Get the big picture:**
   ```vim
   :DiffviewOpen main
   ```
   See all changes at once

2. **Review file by file:**
   ```
   <Tab>           → File panel
   j j j           → Navigate files
   <Enter>         → View diff
   ]c              → Jump through changes
   ]D              → Next file
   ```

3. **Stage good changes:**
   ```
   <Tab>           → Back to file panel
   s               → Stage reviewed files
   ```

4. **Close Diffview and commit:**
   ```
   :DiffviewClose
   <Space>gn       → Open Neogit
   cc              → Commit staged files
   ```

---

## Diffview Cheat Sheet

### Opening Diffview
- `<Space>dd` - Diff current changes
- `:DiffviewOpen` - Same as above
- `:DiffviewOpen main` - Compare with main branch
- `:DiffviewOpen HEAD~1` - Review last commit
- `:DiffviewFileHistory %` - File history (current file)
- `:'<,'>DiffviewFileHistory` - History for selected lines

### Navigation
- `<Tab>` - Focus file panel
- `<Enter>` - Open file under cursor
- `]c` / `[c` - Next/previous change (hunk)
- `]D` / `[D` - Next/previous file
- `j` / `k` - Scroll up/down
- `/` - Search in file panel

### Actions
- `s` / `u` - Stage/unstage file
- `S` / `U` - Stage/unstage all
- `:DiffviewClose` - Close Diffview
- `ZZ` - Close from file panel

### Conflict Resolution
- `co` - Choose OURS
- `ct` - Choose THEIRS
- `cb` - Choose BASE
- `ca` - Choose ALL

---

## Practice Challenge

Complete this workflow:

1. Make changes to 3 files
2. Open Diffview: `<Space>dd`
3. Focus file panel: `<Tab>`
4. Navigate to first file: `j`
5. Open it: `<Enter>`
6. Jump through changes: `]c` `]c` `]c`
7. Go to next file: `]D`
8. Review all files
9. Go back to file panel: `<Tab>`
10. Stage a file: `s`
11. Close Diffview: `:DiffviewClose`
12. Open Neogit: `<Space>gn`
13. Commit staged file: `cc`

**Goal:** Complete in under 2 minutes.

---

## The Complete Git Workflow (All Tools Combined)

Now you have the full arsenal:

### Day-to-Day Coding
```
1. Code in Neovim
2. Use Gitsigns to jump between changes: ]c
3. Preview changes: <Space>hp
4. Stage hunks: <Space>hs
```

### Before Committing
```
1. Open Diffview: <Space>dd
2. Review all changes carefully
3. Stage good changes: s
4. Close Diffview: :DiffviewClose
```

### Committing
```
1. Open Neogit: <Space>gn
2. Final review: =
3. Commit: cc
4. Push: pp
```

### Before Creating PR
```
1. Compare with main: :DiffviewOpen main
2. Review every file: <Tab> → <Enter> → ]D
3. Make sure everything looks good
4. Close: :DiffviewClose
5. Push branch: <Space>gn → pp
```

### Merge Conflicts
```
1. Pull changes (conflict occurs)
2. Open Diffview: <Space>dd
3. Navigate to conflicts: ]c
4. Choose sides: co / ct
5. Save: :w
6. Stage: <Tab> → s
7. Close: :DiffviewClose
8. Commit: <Space>gn → cc
```

---

**You're now a Neovim Git master!** 🎉

The combination of **Gitsigns + Neogit + Diffview** makes you faster than anyone using terminal git or GUI tools.

---

**Next:** Practice all three tools together using real projects! Check `04-complete-workflow.md` for advanced scenarios.
