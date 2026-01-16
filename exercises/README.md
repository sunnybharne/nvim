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

**Why fifth:** Combines all tools into real-world scenarios - this is where everything clicks!

---

### 6. Quickfix List (30 minutes)
**File:** `06-quickfix.md`

**What you'll learn:**
- Quickfix list basics
- Navigation between errors
- Project-wide find and replace
- Integration with Telescope and Git
- Custom quickfix workflows

**Why sixth:** Essential for project-wide operations and error handling.

---

### 7. Octa - AI-Powered Development (45 minutes)
**File:** `07-octa.md`

**What you'll learn:**
- AI-assisted code completion
- Interactive chat for problem solving
- Code generation from descriptions
- Intelligent refactoring suggestions
- Automated documentation generation
- Context-aware code explanations
- AI-powered debugging assistance

**Why seventh:** Master AI-assisted development for maximum productivity - learn to leverage AI as your coding partner!

---

### 8. Python Development (60+ minutes)
**File:** `08-python-development.md`

**What you'll learn:**
- LSP features (autocomplete, go-to-definition, hover)
- Debugging with DAP (debugpy)
- Formatting and linting (black, isort, flake8, mypy, ruff)
- Code navigation and symbol search
- Testing with pytest
- Virtual environment support
- Real-world Python workflows

**Why eighth:** Master Python development in Neovim - from simple scripts to complex projects with full IDE features!

---

### 9. C# Development (60+ minutes)
**File:** `09-csharp-development.md`

**What you'll learn:**
- OmniSharp LSP features (IntelliSense, code actions)
- Debugging with DAP (netcoredbg)
- Formatting with CSharpier
- Solution/project management
- NuGet package support
- Testing with xUnit/NUnit
- Async/await and LINQ support
- Real-world C# workflows

**Why ninth:** Master C# development in Neovim - build .NET applications with full IDE capabilities!

---

## 🎯 Quick Start

### Option 1: Full Course (7-8 hours)
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
  ↓
06-quickfix.md
  ↓
07-octa.md
  ↓
08-python-development.md
  ↓
09-csharp-development.md
```

### Option 2: Git Focus (2 hours)
Focus on Git mastery:
```
01-gitsigns.md → 02-neogit.md → 03-diffview.md → 05-complete-workflows.md
```

### Option 3: AI-Enhanced Development (2.5 hours)
Modern development with AI assistance:
```
01-gitsigns.md → 04-telescope.md → 07-octa.md
```

### Option 4: Quick Wins (30 minutes)
Learn the essentials:
```
01-gitsigns.md (Steps 1-4)
02-neogit.md (Steps 1-6)
04-telescope.md (Steps 1-6)
```

### Option 5: Language Development Focus (3-4 hours)
Master Python and C# development:
```
04-telescope.md (Steps 1-6)  → Navigation basics
08-python-development.md     → Python mastery
09-csharp-development.md    → C# mastery
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
- ✅ Develop Python with full IDE features (LSP, debugging, formatting)
- ✅ Develop C# with OmniSharp and .NET debugging
- ✅ Debug code directly in Neovim (Python and C#)
- ✅ Navigate large codebases efficiently

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
- **LSP:** [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- **DAP:** [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
- **Mason:** [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

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
- Master Python/C# development workflows
- Advanced debugging techniques
- Custom LSP configurations

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
