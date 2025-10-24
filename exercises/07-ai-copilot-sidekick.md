# 🤖 AI-Powered Development with Copilot & Sidekick

Master AI-assisted coding with GitHub Copilot and Sidekick.nvim for maximum productivity.

## 📋 Prerequisites

- ✅ GitHub Copilot subscription active
- ✅ GitHub CLI (`gh`) installed and authenticated
- ✅ Plugins configured: `copilot.vim` and `sidekick.nvim`
- ✅ Basic Neovim navigation skills

---

## 🎯 Part 1: GitHub Copilot Basics

### Step 1: Understanding Copilot Suggestions

**What You'll See:**
- Gray/dimmed text appearing as you type
- Inline code completions
- Function implementations from comments

**Try This:**
```lua
-- Create a function that calculates fibonacci numbers
-- [Wait for Copilot suggestion to appear]
```

### Step 2: Accepting Suggestions

**Basic Controls:**
- `Tab` - Accept current suggestion
- `Ctrl+]` - Alternative accept
- `Alt+]` - Next suggestion
- `Alt+[` - Previous suggestion  
- `Ctrl+\` - Dismiss suggestion

**Practice:**
1. Open a new `.lua` file
2. Type: `-- Function to reverse a string`
3. Press `Enter` and wait for suggestion
4. Try `Alt+]` to see alternatives
5. Accept with `Tab`

### Step 3: Effective Prompting

**Best Practices:**
- Write descriptive comments
- Use clear function names
- Include type hints when possible

**Practice Prompts:**
```lua
-- TODO: Create a function that validates email addresses
-- TODO: Implement binary search algorithm
-- TODO: Parse JSON and handle errors gracefully
```

---

## 🦾 Part 2: Sidekick.nvim - AI CLI Assistant

### Step 4: Opening AI CLI

**Basic Commands:**
- `<leader>aa` - Toggle AI CLI window
- `<leader>ag` - Quick access to Copilot CLI
- `<leader>ac` - Quick access to Claude

**Try It:**
1. Press `<leader>aa`
2. Notice the terminal opens at bottom (30% height)
3. Press `q` to close it
4. Press `<leader>ag` to open Copilot CLI specifically

### Step 5: Sending Code Context

**Context Commands:**
- `<leader>at` - Send current function/block
- `<leader>af` - Send entire file
- `<leader>av` - Send selected text (visual mode)
- `<leader>aD` - Send diagnostics + code

**Practice Exercise:**
1. Create a function with a bug:
```lua
function calculate_average(numbers)
    local sum = 0
    for i, num in ipairs(numbers) do
        sum = sum + num
    end
    return sum / #numbers  -- What if numbers is empty?
end
```

2. Position cursor in the function
3. Press `<leader>at` (sends function to AI)
4. Ask: "What's wrong with this function?"

### Step 6: Using Pre-defined Prompts

**Prompt Selector:**
- `<leader>ap` - Opens prompt menu

**Available Prompts:**
- "Explain this code"
- "Find bugs in this"  
- "Optimize for performance"
- "Write tests for this"
- "Add documentation"
- "Refactor this code"

**Practice:**
1. Select some code (visual mode)
2. Press `<leader>ap`
3. Choose "Write tests for this"
4. See AI generate test cases

### Step 7: Debugging with AI

**Debug Workflow:**
1. Write code with intentional errors:
```lua
local function process_data(data)
    if data = nil then  -- Bug: should be ==
        return {}
    end
    
    local result = {}
    for i = 1, #data do
        table.insert(result, data[i] * 2
    end  -- Bug: missing closing parenthesis
    
    return result
end
```

2. Save the file (LSP will show errors)
3. Press `<leader>aD` (sends diagnostics + code)
4. AI gets both the errors AND the context
5. Ask: "How do I fix these syntax errors?"

---

## 🎮 Part 3: Advanced Workflows

### Step 8: Code Review Workflow

**Scenario:** Review code for improvements

1. Write suboptimal code:
```lua
function find_user_by_name(users, target_name)
    for i = 1, #users do
        for j = 1, #users[i].names do
            if users[i].names[j] == target_name then
                return users[i]
            end
        end
    end
    return nil
end
```

2. Select the entire function (visual mode)
3. Press `<leader>av` (send selection)
4. Ask: "Can you review this for performance issues?"
5. Get AI suggestions for optimization

### Step 9: Documentation Generation

**Workflow:**
1. Write a complex function without docs:
```lua
function merge_sorted_arrays(arr1, arr2, compareFn)
    local result = {}
    local i, j = 1, 1
    
    while i <= #arr1 and j <= #arr2 do
        if compareFn(arr1[i], arr2[j]) then
            table.insert(result, arr1[i])
            i = i + 1
        else
            table.insert(result, arr2[j])
            j = j + 1
        end
    end
    
    while i <= #arr1 do
        table.insert(result, arr1[i])
        i = i + 1
    end
    
    while j <= #arr2 do
        table.insert(result, arr2[j])
        j = j + 1
    end
    
    return result
end
```

2. Position cursor in function
3. Press `<leader>at`
4. Ask: "Generate comprehensive documentation for this function"

### Step 10: Test Generation

**Practice:**
1. Write a utility function:
```lua
function validate_email(email)
    if not email or type(email) ~= "string" then
        return false
    end
    
    local pattern = "^[%w._%+-]+@[%w.-]+%.%w+$"
    return string.match(email, pattern) ~= nil
end
```

2. Send to AI with `<leader>at`
3. Ask: "Generate comprehensive test cases including edge cases"

---

## 🔧 Part 4: Integration & Customization

### Step 11: Multi-Tool Switching

**Practice Tool Switching:**
1. Press `<leader>as` (select AI tool)
2. Try different tools:
   - Copilot CLI for code suggestions
   - Claude for explanations
   - Other configured tools

### Step 12: Terminal Controls

**When AI CLI is open:**
- `q` - Hide terminal (normal mode)
- `Ctrl+q` - Hide terminal (terminal mode)
- `Ctrl+w p` - Go back to code window
- `Ctrl+p` - Insert prompt template

**Practice:**
1. Open AI CLI with `<leader>aa`
2. Send some code with `<leader>at`
3. Practice switching between terminal and code
4. Use `Ctrl+w p` to navigate back and forth

### Step 13: Next Edit Suggestions (NES)

**NES Commands:**
- `<leader>su` - Update/request suggestions
- `<leader>sj` - Jump to next suggestion
- `<leader>sa` - Apply suggestion
- `<leader>sc` - Clear all suggestions
- `<leader>st` - Toggle NES on/off

**Practice:**
1. Write some improvable code:
```lua
function slow_search(list, item)
    for i = 1, #list do
        if list[i] == item then
            return i
        end
    end
    return -1
end
```

2. Press `<leader>su` (request suggestions)
3. Press `<leader>sj` (jump to suggestions)
4. Review the AI suggestions
5. Press `<leader>sa` to apply good ones

---

## 💡 Part 5: Pro Tips & Best Practices

### Effective Prompting Strategies

**For Copilot:**
```lua
-- Good: Specific and descriptive
-- Function to calculate compound interest with monthly contributions

-- Bad: Vague
-- Money function
```

**For Sidekick:**
- Be specific about what you want
- Include context about the project
- Ask follow-up questions
- Request explanations for learning

### Code Context Best Practices

**Smart Context Usage:**
1. Use `<leader>at` for function-level help
2. Use `<leader>af` for file-level architecture questions
3. Use `<leader>av` for specific code review
4. Use `<leader>aD` when you have errors

### Combining Both Tools

**Workflow Example:**
1. Use Copilot for quick completions while typing
2. Use Sidekick for complex problem-solving
3. Use Copilot for boilerplate generation
4. Use Sidekick for code review and optimization

---

## 🎯 Practice Challenges

### Challenge 1: Bug Hunt
Create a file with 5 intentional bugs and use AI to find and fix them.

### Challenge 2: Code Optimization
Write an inefficient algorithm and use AI to optimize it.

### Challenge 3: Test-Driven Development
Use AI to generate tests first, then implement the function.

### Challenge 4: Documentation Sprint
Take an undocumented codebase and use AI to add comprehensive docs.

### Challenge 5: Code Review Simulation
Write code and use AI as a code reviewer to improve quality.

---

## 🚀 Quick Reference Card

### Essential Keymaps

**Copilot:**
- `Tab` - Accept suggestion
- `Alt+]` / `Alt+[` - Navigate suggestions
- `Ctrl+\` - Dismiss

**Sidekick AI CLI:**
- `<leader>aa` - Toggle AI CLI
- `<leader>ag` - Copilot CLI
- `<leader>ac` - Claude

**Context Sending:**
- `<leader>at` - Current context
- `<leader>af` - Full file
- `<leader>av` - Selection
- `<leader>aD` - Diagnostics

**NES (Next Edit Suggestions):**
- `<leader>su` - Update suggestions
- `<leader>sj` - Jump to suggestion
- `<leader>sa` - Apply suggestion

### Smart Placeholders
- `{this}` - Current function/block
- `{file}` - Entire file
- `{selection}` - Selected text
- `{diagnostics}` - LSP errors

---

## 📚 What's Next?

After mastering AI assistance:
1. **Exercise 08**: Complete development workflows
2. **Exercise 09**: Advanced Git integration with AI
3. **Exercise 10**: Project-wide refactoring with AI

**Remember:** AI is a powerful assistant, but understanding the code it generates is crucial for becoming a better developer! 🎯

---

*💡 Pro Tip: The more context you provide to AI, the better suggestions you'll get. Always explain what you're trying to achieve!*