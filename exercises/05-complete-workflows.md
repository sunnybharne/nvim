# Complete Workflow Guide

Advanced workflows combining Gitsigns, Neogit, Diffview, and Telescope.

---

## 🎯 The Complete Toolkit

You now have 4 powerful tools:

| Tool          | Purpose                | When to Use                                         |
| ------------- | ---------------------- | --------------------------------------------------- |
| **Gitsigns**  | Hunk-level operations  | Jump between changes, stage precise hunks           |
| **Neogit**    | Git operations         | Commit, branch, push, stash                         |
| **Diffview**  | Code review            | Compare branches, review commits, resolve conflicts |
| **Telescope** | Discovery & navigation | Find files, search code, switch branches            |

**Master principle:** Each tool excels at specific tasks. Use the right tool for the job!

---

## Workflow 1: Feature Development (End-to-End)

**Scenario:** Build a new feature from scratch to PR

### Phase 1: Setup

```
<Space>gn       → Open Neogit
bc              → Create new branch
```

Type: "feature/awesome-feature" → `<Enter>`

```
q               → Close Neogit
```

### Phase 2: Code & Review

```
(Make changes in Neovim)

]c              → Jump to next change (Gitsigns)
<Space>hp       → Preview change
]c              → Next change
<Space>hp       → Preview
```

### Phase 3: Selective Staging

```
]c              → Jump to first logical chunk
V               → Visual mode
jjj             → Select lines
<Space>hs       → Stage selection

]c              → Next change
<Space>hs       → Stage entire hunk
```

### Phase 4: First Commit

```
<Space>dd       → Open Diffview
<Tab>           → Focus file panel
j j             → Navigate files
<Enter>         → View diff
]c              → Jump through changes
:DiffviewClose  → Close when satisfied

<Space>gn       → Open Neogit
=               → Review staged changes
cc              → Commit
i               → Insert mode
```

Type commit message:

```
feat: add awesome feature core logic

- Implemented base functionality
- Added helper functions
```

```
<Esc>
:wq             → Save commit
```

### Phase 5: Continue Development

```
(Make more changes)

]c ]c ]c        → Review changes
<Space>hs       → Stage good changes
<Space>gn       → Neogit
cc              → Commit
```

Type: "feat: add tests"

```
:wq             → Save
```

### Phase 6: Pre-PR Review

```
:DiffviewOpen main  → Compare with main
<Tab>               → File panel
j                   → First file
<Enter>             → View diff
]c                  → Jump through changes
]D                  → Next file
```

Review every file, then:

```
:DiffviewClose
```

### Phase 7: Push & Create PR

```
<Space>gn       → Neogit
pp              → Push to remote
q               → Close
```

**Then create PR in GitHub/GitLab web interface**

---

## Workflow 2: Bug Fix (Quick Patch)

**Scenario:** Fix a critical bug and deploy fast

### Speed Run:

```
<Space>fg       → Search for bug location
```

Type the error/function name → `<Enter>`

```
(Fix the bug)

<Space>hs       → Stage the fix (Gitsigns)
<Space>gn       → Neogit
cc              → Commit
i               → Insert
```

Type: "fix: resolve critical bug in X"

```
<Esc>
:wq             → Save
pp              → Push
q               → Close
```

**Time:** Should take < 60 seconds once you have muscle memory!

---

## Workflow 3: Code Review (Review Someone's PR)

**Scenario:** Review a teammate's branch before approving

### Review Process:

```
<Space>gn       → Neogit
Pp              → Pull latest
bb              → Branch checkout
```

Type their branch name → `<Enter>`

```
q               → Close Neogit
```

### Compare Their Branch:

```
:DiffviewOpen main  → Compare with main
<Tab>               → File panel
j                   → First file
<Enter>             → View diff
]c                  → Jump to changes
```

Take notes mentally, then:

```
]D              → Next file
]c              → Review changes
```

Repeat for all files.

### Leave Comments (In Web Interface):

```
:DiffviewClose
```

Go to GitHub/GitLab, leave your review comments.

### Approve or Request Changes:

If approved:

```
<Space>gn       → Neogit
bb              → Switch back to main
```

---

## Workflow 4: Merge Conflict Resolution

**Scenario:** Your PR has conflicts with main

### Step 1: Update Your Branch

```
<Space>gn       → Neogit
bb              → Checkout main
Pp              → Pull latest
bb              → Switch back to your branch
```

Type your branch name → `<Enter>`

### Step 2: Merge Main

```
<Space>nm       → Neogit merge
```

Type: "main" → `<Enter>`

**Conflicts occur!**

### Step 3: Resolve with Diffview

```
<Space>dd       → Open Diffview
```

You'll see 3-way merge view:

```
OURS  │  BASE  │  THEIRS
```

### Step 4: Choose Sides

```
]c              → Jump to conflict
co              → Choose OURS (your code)
```

Or:

```
ct              → Choose THEIRS (main's code)
```

Or manually edit the conflict markers.

### Step 5: Stage & Commit

```
:w              → Save file
<Tab>           → File panel
s               → Stage resolved file
```

Repeat for all conflicted files, then:

```
:DiffviewClose
<Space>gn       → Neogit
cc              → Commit merge
i               → Insert
```

Type: "Merge branch 'main' into feature-branch"

```
<Esc>
:wq             → Save
pp              → Push
q               → Close
```

---

## Workflow 5: Refactoring (Split Into Multiple Commits)

**Scenario:** Made many changes, need to organize into logical commits

### Step 1: Audit All Changes

```
<Space>dd       → Diffview
<Tab>           → File panel
j j j           → Navigate
<Enter>         → View each file
]c              → Review changes
:DiffviewClose  → Close
```

### Step 2: Stage Related Changes

```
]c              → First change
```

If it's part of commit 1:

```
<Space>hs       → Stage it
```

If not:

```
]c              → Skip to next
```

Continue until all commit 1 changes are staged.

### Step 3: Commit First Logical Unit

```
<Space>gn       → Neogit
=               → Review staged (make sure it's complete)
cc              → Commit
i               → Insert
```

Type: "refactor: extract helper functions"

```
<Esc>
:wq             → Save
```

### Step 4: Repeat for Other Logical Units

```
]c              → Next unstaged change
<Space>hs       → Stage related changes
<Space>gn       → Neogit
cc              → Commit
```

Type: "refactor: rename variables for clarity"

```
:wq             → Save
```

### Step 5: Final Review & Push

```
:DiffviewOpen HEAD~3..HEAD  → Review last 3 commits
```

Verify commits are logical, then:

```
:DiffviewClose
<Space>gn       → Neogit
pp              → Push
q               → Close
```

---

## Workflow 6: Stash & Context Switch

**Scenario:** Working on feature A, urgent bug in production requires immediate attention

### Save Current Work:

```
<Space>gn       → Neogit
zz              → Stash changes
```

Type stash message: "WIP: feature A progress"

```
q               → Close
```

### Switch to Main & Create Hotfix:

```
<Space>gn       → Neogit
bb              → Checkout main
bc              → Create hotfix branch
```

Type: "hotfix/critical-bug"

```
q               → Close
```

### Fix Bug:

```
<Space>fg       → Find bug location
(Fix it)
<Space>hs       → Stage fix
<Space>gn       → Neogit
cc              → Commit
```

Type: "hotfix: resolve production issue"

```
:wq             → Save
pp              → Push
q               → Close
```

### Return to Feature Work:

```
<Space>gn       → Neogit
bb              → Switch back to feature branch
zp              → Pop stash (restore work)
q               → Close
```

**You're back where you left off!**

---

## Workflow 7: Search & Replace Across Project

**Scenario:** Rename a function used in 20 files

### Step 1: Find All Occurrences

```
<Space>fg       → Live grep
```

Type old function name: "oldFunction"

```
<C-q>           → Send to quickfix
<Esc>           → Close Telescope
```

### Step 2: Replace in All Files

```
:cdo s/oldFunction/newFunction/gc
```

The `c` flag asks for confirmation on each:

- `y` = yes, replace
- `n` = no, skip
- `a` = replace all in file
- `q` = quit

### Step 3: Save All Files

```
:wa             → Write all
```

### Step 4: Review Changes

```
<Space>dd       → Diffview
<Tab>           → File panel
j <Enter>       → Review first file
]D              → Next file
```

### Step 5: Commit

```
:DiffviewClose
<Space>gn       → Neogit
S               → Stage all
cc              → Commit
```

Type: "refactor: rename oldFunction to newFunction"

```
:wq             → Save
pp              → Push
q               → Close
```

---

## Workflow 8: Investigating File History

**Scenario:** "Who changed this function and why?"

### Step 1: Select Function

```
(Open file with the function)
V               → Visual mode
j j j           → Select function lines
```

### Step 2: View History

```
:'<,'>DiffviewFileHistory
```

You'll see all commits that touched those lines!

### Step 3: Review Commits

```
j               → Navigate commits
<Enter>         → View commit diff
]c              → Jump through changes
```

### Step 4: Find the Culprit

```
<Tab>           → On commit, see details
```

You can see:

- Commit message
- Author
- Date
- All changes

### Step 5: Close

```
:DiffviewClose
```

**Use case:** Understanding why code is the way it is.

---

## Workflow 9: Daily Standup Prep

**Scenario:** What did I work on yesterday?

### Review Recent Files:

```
<Space>fr       → Recent files
```

Scroll through, see what you touched.

### Review Commits:

```
<Space>gn       → Neogit
ll              → Log
j j j           → Navigate commits
<Tab>           → Expand commit details
```

### Review Specific Commit:

```
:DiffviewOpen HEAD~5  → Review 5th commit ago
]c ]D                 → Navigate changes
:DiffviewClose        → Close
```

**Prepare your standup:**

- "Yesterday I worked on X (show commit)"
- "Today I'm continuing Y"
- "No blockers"

---

## Workflow 10: Clean Up Before PR

**Scenario:** Made messy commits, want to clean up history

### Review Commit History:

```
<Space>gn       → Neogit
ll              → Log
```

See your commits, identify which to squash.

### Interactive Rebase (Advanced):

```
:!git rebase -i HEAD~3
```

Change `pick` to `squash` or `fixup` in editor.

Save and close.

### Force Push:

```
<Space>gn       → Neogit
```

In Neogit, press:

```
P               → Push menu
p               → Force push (with lease)
q               → Close
```

---

## Pro Tips for Maximum Speed

### 1. Chain Commands

Don't think, just type:

```
]c<Space>hp<Space>hs]c<Space>hs<Space>gncc
```

### 2. Use Telescope for Everything

```
<Space>f...     → Your first instinct should be Telescope
```

### 3. Preview Before Committing

```
Always: <Space>dd → Review → :DiffviewClose → <Space>gn → cc
```

### 4. Keep Commits Small

```
Stage often, commit often, push often
```

### 5. Use Visual Mode Staging

```
When in doubt: V → select → <Space>hs
```

---

## Muscle Memory Drills

### Drill 1: Speed Commit (30 seconds)

1. Make a change
2. `]c` → `<Space>hs` → `<Space>gn` → `cc` → type → `:wq` → `pp` → `q`

### Drill 2: Branch Switch (10 seconds)

1. `<Space>gn` → `bb` → type → `<Enter>` → `q`

### Drill 3: Search & Fix (45 seconds)

1. `<Space>fg` → type → `<Enter>` → fix → `<Space>hs` → `<Space>gn` → `cc` → `:wq`

### Drill 4: Conflict Resolution (60 seconds)

1. `<Space>dd` → `]c` → `co` → `:w` → `<Tab>` → `s` → `:DiffviewClose` → `<Space>gn` → `cc` → `:wq`

**Practice these daily until they're automatic!**

---

## Troubleshooting Common Issues

### Issue: "Telescope is slow"

```
<Space>tf       → Use git_files instead of find_files
```

### Issue: "Neogit not refreshing"

```
r               → In Neogit, press r to refresh
```

### Issue: "Diffview stuck open"

```
:DiffviewClose  → Always close explicitly
```

### Issue: "Forgot what I staged"

```
<Space>gn       → Neogit
=               → View staged changes
```

### Issue: "Made a bad commit"

```
<Space>gn       → Neogit
ca              → Amend commit (fix last commit)
```

---

## The Ultimate Daily Workflow

**Morning:**

```
<Space>gn → Pp  → Pull latest
<Space>fr       → See recent files
<Space>tb       → Switch to working branch
```

**During Work:**

```
(Code)
]c              → Jump to changes
<Space>hp       → Preview
<Space>hs       → Stage
<Space>gn       → Neogit
cc              → Commit
```

**Before Lunch:**

```
<Space>dd       → Review morning's work
:DiffviewClose
<Space>gn → pp  → Push progress
```

**End of Day:**

```
:DiffviewOpen main  → Review day's work
:DiffviewClose
<Space>gn           → Neogit
ll                  → View commit log
pp                  → Push everything
q                   → Close
```

---

**You've mastered the complete workflow!** 🏆

Practice these workflows daily, and you'll become faster than any GUI user or terminal git expert.

**Remember:** Tools are just tools. The real power is in your keyboard-driven workflow and muscle memory!

**Keep learning, keep practicing, keep shipping!** 🚀
