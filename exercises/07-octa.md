# Octa Step-by-Step Guide

Complete guide to mastering Octa.nvim for AI-powered development assistance.

---

## Step 1: Understanding Octa

Octa.nvim is an AI-powered coding assistant that integrates directly into Neovim, providing intelligent code completions, explanations, and refactoring suggestions.

**What Octa provides:**
- Context-aware code completions
- AI-powered code explanations
- Intelligent refactoring suggestions
- Interactive chat interface
- Code generation from natural language

---

## Step 2: Opening Octa Chat

The chat interface is your primary way to interact with Octa's AI.

**Exercise:**
1. Press `<Space>oc` (Octa chat)
2. A split window opens with the chat interface
3. Type a question: "Explain this file"
4. Press `<Enter>` to send

**Practice:**
- Open any Lua file in your config
- Ask Octa: "What does this code do?"
- Read the AI response

---

## Step 3: Code Completion Workflow

Octa provides intelligent code suggestions as you type.

**Exercise:**
1. Open a file: `:e test.lua`
2. Start typing a function:
```lua
function calculate_
```
3. Octa will suggest completions
4. Use `<Tab>` to accept or `<C-n>/<C-p>` to cycle through options

**The workflow:**
```
Start typing → See suggestions → Accept with <Tab> → Continue coding
```

---

## Step 4: Getting Code Explanations

Understanding complex code is easier with AI assistance.

**Exercise:**
1. Navigate to a complex function in your codebase
2. Select the function in visual mode: `V` + movement
3. Press `<Space>oe` (Octa explain)
4. Read the detailed explanation in the chat window

**Practice drill:** Explain 3 different functions to understand their behavior.

---

## Step 5: Code Refactoring

Octa can suggest improvements and refactor your code.

**Exercise:**
1. Select a code block with visual mode: `V`
2. Press `<Space>or` (Octa refactor)
3. Type your refactoring request: "Simplify this logic"
4. Review and apply the suggestions

**Common refactoring requests:**
- "Add error handling"
- "Optimize performance"
- "Make this more readable"
- "Add comments"

---

## Step 6: Code Generation

Generate code from natural language descriptions.

**Exercise:**
1. Press `<Space>og` (Octa generate)
2. Describe what you want: "Create a function that sorts a table by date"
3. Octa generates the code
4. Review and insert it where needed

**Practice:**
- "Create a validation function for email addresses"
- "Generate a binary search implementation"
- "Write a function to merge two tables"

---

## Step 7: Interactive Problem Solving

Use Octa's chat for complex problem-solving.

**Exercise:**
1. Open chat: `<Space>oc`
2. Paste error messages or describe issues
3. Get step-by-step solutions
4. Ask follow-up questions for clarification

**Example conversation:**
```
You: "I'm getting a nil value error on line 42"
Octa: [Analyzes and explains the issue]
You: "How do I fix it?"
Octa: [Provides solution with code]
```

---

## Step 8: Context-Aware Assistance

Octa understands your entire project context.

**Exercise:**
1. Open multiple related files
2. Ask Octa: "How do these files work together?"
3. Get an explanation of the architecture
4. Ask: "Where should I add new feature X?"

---

## Step 9: Documentation Generation

Generate documentation for your code automatically.

**Exercise:**
1. Select a function with visual mode: `V`
2. Press `<Space>od` (Octa document)
3. Octa generates formatted documentation comments
4. Review and adjust as needed

**Example output:**
```lua
--- Calculates the sum of two numbers
--- @param a number First number to add
--- @param b number Second number to add
--- @return number The sum of a and b
function add(a, b)
    return a + b
end
```

---

## Step 10: Real Workflow Practice

Combine all Octa features in a real development scenario.

**Challenge:** Implement a new feature with AI assistance

1. **Planning:**
   ```
   <Space>oc → Ask: "How should I implement feature X?"
   ```

2. **Generation:**
   ```
   <Space>og → Generate initial code structure
   ```

3. **Implementation:**
   ```
   Type code → Get completions → Accept with <Tab>
   ```

4. **Review:**
   ```
   Select code → <Space>oe → Understand what you wrote
   ```

5. **Refactoring:**
   ```
   Select code → <Space>or → "Improve error handling"
   ```

6. **Documentation:**
   ```
   Select functions → <Space>od → Generate docs
   ```

---

## Octa Cheat Sheet

### Chat & Queries
- `<Space>oc` - Open **chat** interface
- `<Space>oe` - **Explain** selected code
- `<Space>oq` - Quick **query** about current context

### Code Generation
- `<Space>og` - **Generate** code from description
- `<Space>or` - **Refactor** selected code
- `<Space>od` - Generate **documentation**

### Completions
- `<Tab>` - Accept completion
- `<C-n>` - Next suggestion
- `<C-p>` - Previous suggestion
- `<C-e>` - Dismiss completion

### Chat Navigation
- `<C-n>` - Next message
- `<C-p>` - Previous message
- `q` - Close chat window
- `<Esc>` - Exit input mode

---

## Integration with Other Tools

Octa works seamlessly with your Git workflow:

**Example: AI-Assisted Commit Messages**
```
]c              → Jump to change (Gitsigns)
<Space>oc       → Open Octa
Ask: "Write a commit message for this change"
Copy message → <Space>gn → Paste in commit
```

**Example: Code Review with AI**
```
:DiffviewOpen   → Review changes (Diffview)
<Space>oe       → Ask Octa to review the code
Apply feedback → Commit improvements
```

---

## Advanced Workflows

### 1. Debugging with AI
```
Encounter bug → Copy error → <Space>oc → Paste error
Ask: "Why is this happening and how do I fix it?"
Apply solution → Test → Iterate
```

### 2. Learning New APIs
```
<Space>oc → Ask: "Show me examples of using telescope.nvim API"
Review examples → Generate similar code → <Space>og
```

### 3. Code Architecture Discussions
```
<Space>oc → Ask: "Is this architecture scalable?"
Get feedback → Ask: "How would you restructure it?"
Implement suggestions
```

---

## Practice Challenge

**Complete this workflow RIGHT NOW:**

1. Create a new file: `:e calculator.lua`
2. Ask Octa to generate a calculator with basic operations:
   ```
   <Space>og → "Create a calculator module with add, subtract, multiply, divide"
   ```
3. Review the generated code
4. Select a function and ask for explanation:
   ```
   Vip → <Space>oe
   ```
5. Request a refactoring:
   ```
   Select code → <Space>or → "Add input validation"
   ```
6. Generate documentation:
   ```
   Select all → <Space>od
   ```
7. Commit your work:
   ```
   <Space>hs → <Space>gn → cc
   ```

**Time goal:** Complete in under 5 minutes once you're comfortable.

---

## Tips & Best Practices

### Getting Better Responses
1. **Be specific** - "Add error handling for nil values" vs "make it better"
2. **Provide context** - Include what you're trying to achieve
3. **Iterate** - Ask follow-up questions to refine answers
4. **Show examples** - "Like this: [example]" helps Octa understand

### When to Use Octa
✅ **Good for:**
- Understanding unfamiliar code
- Generating boilerplate
- Brainstorming solutions
- Learning new patterns
- Quick documentation

❌ **Less useful for:**
- Highly specialized domain logic
- Performance-critical optimizations
- When you need 100% precision
- Simple syntax you already know

### Productivity Habits
- Keep chat open in a split for quick questions
- Use completions for repetitive code
- Ask for code review before committing
- Generate tests with `<Space>og → "Write tests for this function"`

---

## Troubleshooting

### "Octa isn't responding"
```vim
:checkhealth octa    " Check plugin status
```

### "Completions are too slow"
- Check your API key configuration
- Adjust completion delay in settings
- Consider using for complex code only

### "Responses aren't relevant"
- Provide more context in your query
- Include file type/language in question
- Show example input/output

### "I want to customize keymaps"
Edit: `lua/config/keymaps.lua` - search for Octa mappings

---

## Learning Path

### Week 1: Basics
- Use chat for questions daily
- Accept at least 10 completions per session
- Explain 5 functions you don't understand

### Week 2: Generation
- Generate 3 functions from descriptions
- Refactor 5 code blocks
- Document your code with Octa

### Week 3: Integration
- Combine with Git workflow
- Use for code review
- Generate commit messages

### Week 4: Mastery
- Create custom prompts
- Build templates for common patterns
- Teach others your workflow

---

## Configuration Tips

### Customize Octa Behavior

Edit your Octa config in `lua/plugins/octa.lua`:

```lua
-- Example configuration
require('octa').setup({
    completion = {
        enabled = true,
        auto_trigger = true,
    },
    chat = {
        window_width = 80,
        position = 'right',
    },
    model = 'gpt-4',  -- or your preferred model
})
```

### Custom Keymaps

Add your own shortcuts in `lua/config/keymaps.lua`:

```lua
-- Custom Octa mappings
vim.keymap.set('n', '<Space>ot', '<cmd>OctaTest<cr>', { desc = 'Octa: Generate tests' })
vim.keymap.set('n', '<Space>ob', '<cmd>OctaDebug<cr>', { desc = 'Octa: Debug code' })
```

---

## Next Steps

### Combine with Other Tools

Once comfortable with Octa, integrate it into complete workflows from `05-complete-workflows.md`:

**AI-Enhanced Feature Development:**
```
1. Plan with Octa chat
2. Generate code structure
3. Stage changes with Gitsigns
4. Review with Diffview
5. Get AI code review
6. Commit via Neogit
7. Generate PR description with Octa
```

**AI-Powered Bug Fixing:**
```
1. Find bug with Telescope
2. Ask Octa for explanation
3. Generate fix with Octa
4. Preview with Gitsigns
5. Test and commit
```

---

## Resources

### Documentation
- `:help octa` - Plugin documentation
- GitHub repo for examples and updates
- Community prompts and templates

### Community
- Share your best prompts
- Learn from other users' workflows
- Contribute improvements

---

**Ready to supercharge your development with AI?** Start with simple queries and build up to complex workflows!

Happy coding with Octa! 🚀
