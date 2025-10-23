# Neovim Exercises - Step-by-Step Guides

Comprehensive, hands-on exercises to master Git and Telescope workflows in Neovim.

---

## 📚 Learning Path

Work through these guides in order for the best learning experience:

### 1. Gitsigns (30 minutes)
**File:** `01-gitsigns.md`

**What you'll learn:**
- Jump between changes with `]c` / `[c`
- Preview changes with `<Space>hp`
- Stage/unstage hunks
- Visual mode staging (precision control)
- Discard changes
- View blame

**Why start here:** Gitsigns is your foundation - you'll use it constantly for micro-level Git operations.

---

### 2. Neogit (45 minutes)
**File:** `02-neogit.md`

**What you'll learn:**
- Navigate Neogit buffer (pure Vim motions!)
- Stage files and individual hunks
- Commit workflow
- Branch operations (create, switch)
- Push and pull
- Stash management
- View commit log

**Why next:** Neogit is your Git command center - handles commits, branches, and remote operations.

---

### 3. Diffview (30 minutes)
**File:** `03-diffview.md`

**What you'll learn:**
- Side-by-side diff viewing
- Compare branches
- Review commits
- File history
- Merge conflict resolution
- Navigate between files and changes

**Why third:** Diffview is for review and comparison - essential before creating PRs and resolving conflicts.

---

### 4. Telescope (45 minutes)
**File:** `04-telescope.md`

**What you'll learn:**
- Find files instantly
- Live grep (search code)
- Buffer management
- Help and command discovery
- Git integration
- Quickfix workflow

**Why fourth:** Telescope is your discovery tool - find anything instantly without leaving Neovim.

---

### 5. Complete Workflows (60+ minutes)
**File:** `05-complete-workflows.md`

**What you'll learn:**
- End-to-end feature development
- Bug fix workflow
- Code review process
- Merge conflict resolution
- Refactoring with multiple commits
- Stash and context switching
- Search and replace across project
- File history investigation

**Why last:** Combines all tools into real-world scenarios - this is where everything clicks!

---

## 🎯 Quick Start

### Option 1: Full Course (3-4 hours)
Work through all guides in order:
```
01-gitsigns.md
  ↓
02-neogit.md
  ↓
03-diffview.md
  ↓
04-telescope.md
  ↓
05-complete-workflows.md
```

### Option 2: Git Focus (2 hours)
Focus on Git mastery:
```
01-gitsigns.md → 02-neogit.md → 03-diffview.md → 05-complete-workflows.md
```

### Option 3: Quick Wins (30 minutes)
Learn the essentials:
```
01-gitsigns.md (Steps 1-4)
02-neogit.md (Steps 1-6)
04-telescope.md (Steps 1-6)
```

---

## 💡 How to Use These Guides

### Each Guide Contains:
1. **Step-by-step exercises** - Hands-on practice
2. **Real examples** - Type these commands yourself
3. **Practice challenges** - Test your knowledge
4. **Cheat sheets** - Quick reference
5. **Workflows** - Real-world usage patterns

### Learning Tips:
- **Do the exercises!** Don't just read - type every command
- **Practice in a test repo** - Make mistakes safely
- **Build muscle memory** - Repeat exercises until automatic
- **Time yourself** - Speed comes from repetition
- **Use the cheat sheets** - Keep them open while working

---

## 🚀 After Completing These Guides

You'll be able to:
- ✅ Navigate Git changes faster than any GUI user
- ✅ Stage precise hunks with visual selections
- ✅ Commit, branch, and push without terminal commands
- ✅ Review code with side-by-side diffs
- ✅ Resolve merge conflicts visually
- ✅ Find files and code instantly with fuzzy search
- ✅ Complete entire workflows without leaving Neovim
- ✅ Work keyboard-only (no mouse needed!)

---

## 📖 Additional Resources

### In This Config:
- `GIT_MASTERY_GUIDE.md` - Comprehensive Git learning path with 6 levels
- `README.md` - Quick reference for all keymaps
- `lua/config/keymaps.lua` - Keymap definitions (customize here!)

### Plugin Documentation:
- **Gitsigns:** [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- **Neogit:** [NeogitOrg/neogit](https://github.com/NeogitOrg/neogit)
- **Diffview:** [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim)
- **Telescope:** [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

---

## 🎓 Skill Levels

### Beginner (Week 1)
- Complete guides 1-4
- Practice basic workflows
- Build muscle memory for essential keys

### Intermediate (Week 2-3)
- Complete guide 5 (all workflows)
- Practice daily standup prep
- Start using visual mode staging

### Advanced (Week 4+)
- Create custom workflows
- Interactive rebase
- Advanced conflict resolution
- Integrate with CI/CD

---

## 🏆 Practice Challenges

### Daily Challenges:
1. **Make 20 commits** using `]c → <Space>hs → <Space>gn → cc`
2. **Switch branches 10 times** using `<Space>gn → bb`
3. **Find 10 files** without typing full names using `<Space>ff`
4. **Review last 5 commits** using `:DiffviewOpen HEAD~5..HEAD`

### Weekly Goals:
- Week 1: Complete all basic exercises
- Week 2: No terminal git commands for 7 days
- Week 3: Average < 60 seconds per commit
- Week 4: Complete feature branch start-to-PR in < 5 minutes

---

## 🛠️ Troubleshooting

### "I forgot a keymap!"
```vim
<Space>fk       " Search keymaps in Telescope
```

### "The guide references a file I don't have"
```vim
:e test.lua     " Create any test file to practice
```

### "I want to customize keymaps"
Edit: `lua/config/keymaps.lua`

### "Something broke!"
```vim
:checkhealth    " Check plugin health
```

---

## 🤝 Contributing

Found an error or have suggestions?
- Open an issue
- Submit a PR with improvements
- Share your custom workflows!

---

## 📝 Notes

- **Time estimates** are approximate - take your time!
- **Practice in a safe environment** - use a test repo
- **Muscle memory** is the goal - speed comes from repetition
- **Keyboard-only** workflows are faster once learned
- **Have fun!** Git mastery is a superpower 🚀

---

**Ready to become a Neovim Git master?** Start with `01-gitsigns.md`!

Happy learning! 🎉
