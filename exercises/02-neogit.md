# Neogit Step-by-Step Guide

Complete guide to mastering Neogit for Git operations in Neovim.

---

## Step 1: Open Neogit Status

**Try it now:**
1. Press `<Space>gn` (git neogit)
2. You'll see the Neogit status buffer

You should see sections like:
```
Untracked files (1)
Unstaged changes (3)
Staged changes (2)
Recent commits (10)
```

**Key insight:** This is just a **normal Vim buffer** - all your Vim motions work!

---

## Step 2: Navigation (Pure Vim)

Navigate like you would in any file:

| Motion | What It Does |
|--------|--------------|
| `j` / `k` | Move down/up |
| `gg` | Top of buffer |
| `G` | Bottom of buffer |
| `/` | Search for text |
| `n` / `N` | Next/prev search result |

**Exercise:**
1. Press `gg` to go to top
2. Press `G` to go to bottom  
3. Press `/commit` to search for "commit"
4. Press `n` to jump between matches

See? It's just Vim!

---

## Step 3: Expand/Collapse Sections (Like Folding)

Sections can be expanded or collapsed:

| Key | Action |
|-----|--------|
| `<Tab>` | Toggle expand/collapse section |
| `za` | Also toggles (standard Vim fold) |

**Exercise:**
1. Put cursor on "Unstaged changes"
2. Press `<Tab>` - files expand
3. Press `<Tab>` again - files collapse
4. Navigate to "Recent commits"
5. Press `<Tab>` - see commit details

---

## Step 4: Stage Files (The Essential Skill)

This is where the magic happens:

| Key | Action |
|-----|--------|
| `s` | **Stage** file/hunk under cursor |
| `u` | **Unstage** file/hunk under cursor |
| `S` | Stage **everything** |
| `U` | Unstage **everything** |

**Exercise:**
1. Make a change to any file
2. Open Neogit: `<Space>gn`
3. Navigate to "Unstaged changes": `j` `j` `j`
4. Expand it: `<Tab>`
5. Put cursor on a file
6. Press `s` - watch it move to "Staged changes"!
7. Press `u` - it moves back

**Practice:** Stage and unstage 5 times until it's muscle memory.

---

## Step 5: Stage Individual Hunks (Precision Control)

You can stage parts of a file!

**Exercise:**
1. Make 3 changes in the same file (3 different locations)
2. Open Neogit: `<Space>gn`
3. Navigate to the file
4. Press `<Tab>` to expand - you'll see **individual hunks**!
5. Navigate to first hunk: `j`
6. Press `s` - only that hunk stages
7. Other hunks stay unstaged

**This is powerful:** You can split one file's changes across multiple commits.

---

## Step 6: Commit (Your Most-Used Command)

Time to commit staged changes:

| Key | Action |
|-----|--------|
| `cc` | **Commit** (opens commit message buffer) |
| `ca` | **Amend** last commit |
| `ce` | **Extend** last commit (no message change) |

**Exercise - Full Commit Flow:**
1. Stage a file: `s`
2. Press `cc` (commit)
3. A new buffer opens for commit message
4. Type your message in **insert mode**: `i`
5. Write something: "feat: add new feature"
6. Save and close: `<Esc>` then `:wq`
7. **Commit is done!** 🎉

**Practice:** Make 3 commits using this flow.

---

## Step 7: Commit Message Buffer (Edit Like a Pro)

The commit message buffer is just a normal buffer:

**Tips:**
- Line 1: Short summary (50 chars)
- Line 2: Blank
- Line 3+: Detailed description

**Exercise:**
1. Press `cc` to commit
2. Write a good commit message:
```
feat: add gitsigns tutorial

- Added step-by-step guide
- Included practice exercises
- Added cheat sheet
```
3. Save: `:wq`

**Abort a commit:** Close without saving: `:q!`

---

## Step 8: View Diffs (See What You're Committing)

Before committing, review your changes:

| Key | Action |
|-----|--------|
| `=` | Toggle **diff view** for item under cursor |
| `<Tab>` | Also works to expand diffs |

**Exercise:**
1. Stage a file: `s`
2. Put cursor on the staged file
3. Press `=` - see the full diff inline
4. Press `=` again - collapse it
5. Navigate through diff with `j` / `k`

**Best practice:** Always review diffs before pressing `cc`!

---

## Step 9: Discard Changes (Destructive!)

Sometimes you want to throw away changes:

| Key | Action |
|-----|--------|
| `x` | **Discard** unstaged change under cursor |

⚠️ **Warning:** This is permanent! No undo!

**Exercise:**
1. Make a test change
2. In Neogit, navigate to the unstaged file
3. Press `x`
4. Confirm: `y`
5. Change is **gone forever**

**Pro tip:** Always preview with `=` before discarding!

---

## Step 10: Refresh Status

Sometimes Neogit doesn't auto-refresh:

| Key | Action |
|-----|--------|
| `r` | **Refresh** status |
| `R` | **Refresh all** (slower, more thorough) |

**When to use:** After running terminal git commands or if status looks stale.

---

## Step 11: Push & Pull

Sync with remote:

| Key | Action |
|-----|--------|
| `pp` | **Push** to remote |
| `Pp` | **Pull** from remote |
| `po` | Push to **other** branch |

**Exercise:**
1. Make and commit a change
2. Press `pp` to push
3. Watch the push happen in status buffer

---

## Step 12: Branch Operations

Create and switch branches:

| Key | Action |
|-----|--------|
| `bb` | **Checkout** branch (with fuzzy search!) |
| `bc` | **Create** new branch |
| `br` | **Rename** branch |

**Exercise:**
1. Press `bb` (branch checkout)
2. Fuzzy search opens - type to filter
3. Select with `<Enter>`
4. You're on new branch!

**Create new branch:**
1. Press `bc`
2. Type branch name: "feature/test"
3. Press `<Enter>`

---

## Step 13: Stash (Save Work for Later)

Need to switch context quickly?

| Key | Action |
|-----|--------|
| `zz` | **Stash** changes |
| `zp` | **Pop** stash (apply and remove) |
| `za` | **Apply** stash (keep in stash list) |

**Exercise:**
1. Make some changes (don't stage)
2. Press `zz` - changes disappear
3. Do some other work
4. Press `zp` - changes come back!

---

## Step 14: Log & History

View commit history:

| Key | Action |
|-----|--------|
| `ll` | **Log** current branch |
| `lo` | Log **other** branch |
| `lh` | Log **HEAD** |

**Exercise:**
1. Press `ll`
2. Navigate through commits with `j` / `k`
3. Press `<Tab>` on a commit to see details
4. Press `q` to close log

---

## Step 15: Help (Your Safety Net)

Forgot a command?

| Key | Action |
|-----|--------|
| `?` | Open **help** menu |
| `q` | **Quit/Close** Neogit |

**Exercise:**
1. Press `?` - see all keybindings
2. Search for what you need: `/push`
3. Press `q` to close help

---

## The Complete Neogit Workflow

Here's your daily workflow:

### Scenario: Make a feature with 2 commits

**Step-by-step:**

1. **Make changes to 3 files**
   ```
   - file1.lua (new feature)
   - file2.lua (bug fix)
   - file3.lua (refactor)
   ```

2. **Open Neogit:** `<Space>gn`

3. **First commit (feature + bug fix):**
   ```
   j j j           → Navigate to Unstaged
   <Tab>           → Expand files
   j               → Move to file1.lua
   s               → Stage it
   j               → Move to file2.lua  
   s               → Stage it
   cc              → Commit
   i               → Insert mode
   ```
   Type: "feat: add feature and fix bug"
   ```
   <Esc>
   :wq             → Save commit
   ```

4. **Second commit (refactor):**
   ```
   j j j           → Navigate to unstaged file3.lua
   =               → Preview diff (make sure it's good)
   s               → Stage it
   cc              → Commit
   i               → Insert mode
   ```
   Type: "refactor: clean up file3"
   ```
   <Esc>
   :wq             → Save commit
   ```

5. **Push:**
   ```
   pp              → Push to remote
   ```

6. **Close Neogit:**
   ```
   q               → Done!
   ```

---

## Neogit Cheat Sheet

### Essential Keys (Memorize These First)
- `<Space>gn` - Open Neogit
- `j` / `k` - Navigate
- `<Tab>` - Expand/collapse
- `s` - Stage
- `u` - Unstage
- `=` - View diff
- `cc` - Commit
- `pp` - Push
- `q` - Quit

### Power User Keys
- `S` / `U` - Stage/unstage all
- `ca` - Amend commit
- `ce` - Extend commit
- `x` - Discard changes (⚠️ destructive)
- `bb` - Switch branch
- `bc` - Create branch
- `zz` - Stash
- `zp` - Pop stash
- `ll` - View log
- `r` - Refresh
- `?` - Help

---

## Practice Challenge

Complete this workflow to cement your learning:

1. Make changes to 2 files
2. Open Neogit: `<Space>gn`
3. Stage only the first file: `s`
4. View its diff: `=`
5. Commit it: `cc` → write message → `:wq`
6. Stage the second file: `s`
7. Commit it: `cc` → write message → `:wq`
8. View commit log: `ll`
9. Push both commits: `pp`
10. Close Neogit: `q`

**Goal:** Complete this in under 90 seconds once you have muscle memory.

---

## Combined Gitsigns + Neogit Workflow

Now that you know both, here's the **optimal workflow:**

### Scenario: Working on a complex feature

1. **Edit files normally in Neovim**

2. **Use Gitsigns to review as you work:**
   ```
   ]c              → Jump between changes
   <Space>hp       → Preview each change
   ```

3. **Use Gitsigns to stage precise hunks:**
   ```
   V               → Visual mode
   jjj             → Select lines
   <Space>hs       → Stage selection
   ```

4. **Use Neogit to commit:**
   ```
   <Space>gn       → Open Neogit
   =               → Review staged changes
   cc              → Commit
   ```

5. **Use Neogit for branch/push operations:**
   ```
   bb              → Switch branches
   pp              → Push
   ```

**The pattern:**
- **Gitsigns** = Micro-level (jumping, previewing, staging hunks)
- **Neogit** = Macro-level (committing, branching, pushing)

---

**Next:** Move to `03-diffview.md` to learn code review and branch comparison!
