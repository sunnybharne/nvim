# Neovim Git Mastery Guide 🚀

## Philosophy: Choose Your Workflow

You have **4 powerful Git tools** installed. Each has its strengths:

1. **LazyGit** (`<Space>gg`) - Best for: Complex operations, visual learners
2. **Neogit** (`<Space>gn`) - Best for: Native Neovim feel, keyboard-first
3. **Gitsigns** (`<Space>h*`) - Best for: Line-by-line staging, quick hunks
4. **Diffview** (`<Space>dd`) - Best for: Code review, merge conflicts

## 🎯 Level 1: Basic Git Workflow (Start Here)

### Daily Commit Workflow

```
1. Make changes to files
2. <Space>hs - Stage individual hunks (or <Space>hS for whole file)
3. <Space>gg - Open LazyGit
4. Press 'c' to commit
5. Write commit message
6. Press 'P' to push
```

**Practice this 10 times until it's muscle memory.**

### Understanding What Changed

```
1. ]c / [c - Jump between changes in current file
2. <Space>hp - Preview what changed in a popup
3. <Space>hb - Toggle git blame to see who changed what
```

**Practice:** Make 3 changes to a file, navigate between them, preview each one.

## 🚀 Level 2: Efficient Staging & Committing

### Master Hunk Operations (Gitsigns)

**The Power of Hunks:**
- A "hunk" is a block of changed lines
- Stage only what you need for a logical commit
- Keep commits small and focused

```
Workflow:
1. Edit multiple parts of a file
2. ]c to jump to first change
3. <Space>hp to preview it
4. <Space>hs to stage if good
5. Repeat for each hunk
6. <Space>gg to commit
```

**Exercise:**
- Make 3 unrelated changes to one file
- Stage them as 3 separate commits with meaningful messages

### Visual Mode Staging

```
1. Select lines in VISUAL mode (V)
2. <Space>hs - Stage only selected lines
3. This creates surgical commits!
```

**Pro Tip:** This is how you create atomic commits even when you forgot to commit earlier.

## 💪 Level 3: LazyGit Mastery

### Essential LazyGit Commands

Open LazyGit: `<Space>gg`

**In LazyGit:**
```
Navigation:
1,2,3,4,5 - Jump to panels (Files, Branches, Commits, Stash, etc.)
j/k       - Move up/down
h/l       - Collapse/expand

Staging:
<Space>   - Stage/unstage file or hunk
a         - Stage all
d         - Discard changes (be careful!)

Committing:
c         - Commit
C         - Commit using git commit (opens editor)
A         - Amend last commit

Branches:
n         - New branch
<Space>   - Checkout branch
M         - Merge
r         - Rebase
d         - Delete branch

Remote:
P         - Push
p         - Pull
f         - Fetch

Advanced:
e         - Edit file
o         - Open file
<Enter>   - View details/diff
?         - Help menu (USE THIS!)
```

**Exercises:**
1. Create a new branch, make changes, commit, push
2. Switch between branches
3. Merge a branch
4. Amend your last commit
5. Stash changes, switch branch, pop stash

### LazyGit Workflows

**Feature Branch Workflow:**
```
1. <Space>gg
2. Press 'n' to create new branch
3. Name it: feature/my-feature
4. Make changes, stage, commit
5. Press 'P' to push
6. Switch to main (press 2 for branches, select main)
7. Press 'M' to merge your feature
```

**Interactive Rebase (Advanced):**
```
1. <Space>gg
2. Navigate to Commits (press 3)
3. Select commit, press 'r' for rebase
4. Use 'e' to edit, 's' to squash, 'd' to drop
5. This rewrites history - use carefully!
```

## 🔥 Level 4: Code Review & Diffs

### Diffview - Your Review Tool

**Review All Changes Before Commit:**
```
1. <Space>dd - Open Diffview
2. j/k to navigate files
3. ]c/[c to navigate hunks within file
4. <Space>e - Focus file panel
5. <Space>b - Toggle file panel
6. Review everything
7. <Space>dD - Close when done
```

**View File History:**
```
1. <Space>dh - Open file history
2. See all commits that touched current file
3. Perfect for understanding "why this code exists"
```

**Merge Conflict Resolution:**
```
When you have conflicts:
1. <Space>dd - Open Diffview
2. You'll see 3-way diff (OURS | BASE | THEIRS)
3. <Space>co - Choose OURS
4. <Space>ct - Choose THEIRS
5. <Space>cb - Choose BASE
6. Or manually edit in the middle panel
7. Save and <Space>dD to close
```

**Exercise:**
- Create a conflict (edit same line in two branches)
- Merge and resolve using Diffview

## ⚡ Level 5: Advanced Workflows

### Partial File Staging (The Secret Weapon)

```
You edited 5 different functions in one file, but they should be 3 commits:

1. Open file
2. ]c to jump to first change
3. <Space>hp to preview
4. Visual select just the lines you want (V)
5. <Space>hs to stage only those lines
6. <Space>gg, commit
7. Repeat for other logical groups
```

**This is how senior developers work!**

### Stash Workflow

```
Scenario: You're working on feature A, urgent bug comes up

1. <Space>gg
2. Press 's' to see stash menu
3. Press 's' again to stash with message
4. Fix urgent bug, commit, push
5. Press 's' to open stash
6. <Space> on your stash to pop it back
```

### Worktree Workflow (Super Advanced)

```
Work on multiple branches simultaneously:

1. <Space>gg
2. Press 'w' for worktree
3. Add new worktree for different branch
4. Each worktree is a different directory
5. No need to stash when switching!
```

## 📊 Level 6: Neogit Power User

### Why Use Neogit?

- Fully integrated in Neovim
- Magit-like interface (Emacs gold standard)
- Better for keyboard-only workflow

**Essential Neogit:**
```
<Space>gn  - Open Neogit

In Neogit:
Tab        - Toggle diff/fold
s          - Stage file/hunk
u          - Unstage
c c        - Commit
c a        - Amend
P p        - Push
F p        - Pull
b b        - Checkout branch
b c        - Create branch
l l        - Log
r r        - Rebase
?          - Show help
```

**When to use Neogit over LazyGit:**
- You're already in a buffer and don't want to switch context
- Keyboard-only workflow
- Need to reference code while committing
- Working on remote server (no terminal UI)

## 🎓 Mastery Checklist

### Week 1: Foundations
- [ ] Make 20 commits using `<Space>hs` + `<Space>gg`
- [ ] Navigate hunks with `]c` and `[c` 20 times
- [ ] Preview 10 hunks with `<Space>hp`
- [ ] Use `<Space>hb` to check blame on 10 different lines

### Week 2: Branching
- [ ] Create 5 feature branches
- [ ] Merge 3 branches using LazyGit
- [ ] Resolve 2 merge conflicts with Diffview
- [ ] Stash and pop changes 5 times

### Week 3: Advanced Staging
- [ ] Stage partial files (visual mode) 10 times
- [ ] Make 5 "surgical commits" from messy changes
- [ ] Use `<Space>dh` to review file history 10 times
- [ ] Amend commits 5 times

### Week 4: Power User
- [ ] Interactive rebase 3 commits
- [ ] Use Neogit for a full workflow (stage, commit, push)
- [ ] Set up a worktree
- [ ] Cherry-pick commits between branches

## 🔑 Pro Tips

### 1. Think in Hunks, Not Files
```
❌ Bad:  Stage whole file with random changes
✅ Good: Stage logical hunks that belong together
```

### 2. Commit Message Quality
```
❌ Bad:  "fixed stuff"
✅ Good: "fix: Add null check in user authentication

- Prevents crash when user.email is undefined
- Adds test case for edge case
- Fixes #123"
```

### 3. Review Before Commit
```
Always:
1. <Space>dd - Open Diffview
2. Review every change
3. Ask: "Is this logical? Tested? Complete?"
4. Only then commit
```

### 4. Use Blame to Learn
```
When you see weird code:
1. <Space>hb - Toggle blame
2. See who wrote it and when
3. Look up the commit to understand WHY
4. This builds context over time
```

### 5. Keyboard Shortcuts You Must Know
```
In any Git tool:
?         - Always shows help
q/Esc     - Usually quits/closes
<Enter>   - Usually expands/shows detail
<Space>   - Usually toggles/selects
j/k       - Navigate (Vim style)
```

## 🚨 Common Mistakes to Avoid

1. **Never commit without reviewing:**
   - Always `<Space>dd` before committing

2. **Don't stage everything blindly:**
   - Use hunks! Be selective!

3. **Don't amend pushed commits:**
   - Rewrites history, confuses teammates

4. **Don't force push to main:**
   - Use feature branches, then merge

5. **Don't resolve conflicts blindly:**
   - Use Diffview 3-way merge to understand both sides

## 📚 Learning Path

### Month 1: Build Muscle Memory
- Use Gitsigns for all staging
- Use LazyGit for all commits
- Use Diffview for all reviews

### Month 2: Add Complexity
- Start using Neogit
- Practice branching workflows
- Learn interactive rebase

### Month 3: Master Advanced
- Partial file staging
- Cherry-picking
- Worktrees
- Custom workflows

## 🎯 Your Personal Git Workflow (Customize This!)

```markdown
1. Start work:
   - <Space>tb to switch/create branch

2. Make changes:
   - Code normally
   - Use ]c/[c to review changes as you go

3. Before commit:
   - <Space>dd to review everything
   - Ask: Is this logical? Tested?

4. Stage:
   - <Space>hs for each logical hunk
   - Or visual mode + <Space>hs for partial staging

5. Commit:
   - <Space>gg
   - Press 'c', write good message
   - Consider using conventional commits

6. Push:
   - In LazyGit, press 'P'

7. Code review (others' PRs):
   - <Space>tb to checkout PR branch
   - <Space>dd to review all changes
   - <Space>dh to see file history if needed
   - <Space>hb to see blame for context
```

## 🏆 Final Goal: The 10-Second Commit

**Mastery is when you can:**
1. Review changes
2. Stage hunks
3. Write commit message
4. Push

**All in under 10 seconds, without thinking.**

Practice until it's automatic. That's mastery.

---

## Quick Reference Card

```
Daily Commands (Memorize These):
<Space>gg  - LazyGit
<Space>hs  - Stage hunk
<Space>hp  - Preview hunk
<Space>dd  - Diffview
]c / [c    - Next/prev hunk
<Space>hb  - Toggle blame

Emergency Commands:
<Space>hr  - Reset hunk (undo changes)
<Space>hR  - Reset file (undo all changes)

When Lost:
?          - Help in any Git tool
:help gitsigns  - Gitsigns documentation
:help neogit    - Neogit documentation
```

---

**Remember: Git mastery is not about knowing every command. It's about having efficient workflows that become second nature.**

**Start with Level 1. Master it. Then level up. 🚀**
