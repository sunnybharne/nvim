# GitHub Actions

## Git Basic

### User Configuration
```bash
# View current configuration
git config user.name
git config user.email

# Set global configuration
git config --global user.name "Sunny Bharne"
git config --global user.email "example@email"
```

### Essential Git Commands
```bash
# Repository initialization and status
git init
git status

# File operations
git add file1 file2
git commit -m "commit message"
git push
git log --all

# File management
git rm --cached File.name
git restore --staged File.name

# Branch operations
git checkout -b branchName
git branch branchName
git branch
git branch -d branchName
git checkout commitHash
git merge BranchName

# Remote repository operations
git remote add origin https:/github.git
git clone https https:/github.git
git pull
```

### Commit Management
```bash
# Modify previous commits
git revert "commitHash"    # Create new commit with changes
git reset --soft "commitHash"  # Remove last commit, keep changes
git reset --hard "commitHash"  # Remove last commit and changes
```

### Stash Operations
```bash
git stash
git stash list
git stash apply stash@{0}
git stash drop stash@{0}
```

### Gitignore Configuration
```gitignore
# Ignore all files in root directory
*
# Except this file
```

### Rebase Operations
```bash
git rebase branchName
git rebase --continue
git rebase --abort
```

## GitHub Actions

### Core Concepts
- **Workflow**: Contains one or more jobs that can run in parallel
- **Job**: Runs on a separate VM
  - Executes scripts or actions
  - Actions are reusable code units
  - Steps run sequentially
- **Events**: Trigger workflows
  - Push, Pull request, Issue, etc.
- **Runner**: VM that executes jobs
  - Types:
    - Repository runner
    - Organization runner
    - Enterprise runner
    - Self-hosted runner
    - GitHub-hosted runner

### System Limitations
- Workflow runtime: 35 days
- Job execution time: 5 days
- Job queue time: 24 hours
- API request limit: 1000 requests per hour per repository
- Job matrix: 256 jobs per workflow
- Workflow runs queue: 500 workflows can be queued in a 10-second interval per repository
- Self-hosted runners: Maximum 10,000 runners per runner group
- Workflow timeout: Workflows are discarded if not queued within 30 minutes of triggering

### Workflow Configuration
```yaml
# Workflow file location
.github/workflows/main.yml
```

### Workflow Components
1. Event triggers
2. Runner selection
3. Job definitions
4. Step configurations
