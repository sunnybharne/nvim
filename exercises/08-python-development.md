# Python Development in Neovim - Complete Guide

Master Python development using Neovim's powerful LSP, debugging, formatting, and navigation features.

---

## Prerequisites

Before starting, ensure you have:
- Python 3.x installed (`python3 --version`)
- Neovim with Mason installed (auto-installs Pyright LSP)
- Optional but recommended: `pip install black isort flake8 mypy ruff`

---

## Step 1: Understanding Python LSP (Language Server Protocol)

The LSP provides intelligent code assistance:

**What LSP gives you:**
- ✅ Autocomplete (IntelliSense)
- ✅ Go to definition/declaration
- ✅ Hover documentation
- ✅ Error detection (diagnostics)
- ✅ Code actions (quick fixes)
- ✅ Symbol navigation
- ✅ References finder

**Exercise:**
1. Create a test file: `:e test.py`
2. Type this code:
```python
def greet(name):
    return f"Hello, {name}!"

message = greet("World")
print(message)
```
3. Notice the **red underlines** (if any) - these are LSP diagnostics!

---

## Step 2: Autocomplete (IntelliSense)

Get intelligent code suggestions as you type:

**Exercise:**
1. In `test.py`, type: `import os`
2. On a new line, type: `os.`
3. **Autocomplete menu appears!** Press `<C-n>` to navigate, `<Enter>` to select
4. Try typing: `os.path.` - see more suggestions

**Pro tip:** Autocomplete also works for:
- Function parameters
- Class methods
- Module imports
- Variable names

**Practice:**
```python
import json
# Type: json.
# See all available methods

# Type: str.
# See string methods
```

---

## Step 3: Go to Definition (The Most Important Feature)

Jump to where functions/classes are defined:

**Exercise:**
1. Put cursor on `greet` in `message = greet("World")`
2. Press `gd` (go to definition)
3. **You jump to the function definition!**
4. Press `<C-o>` to jump back

**Also try:**
- `gD` - Go to declaration
- `gi` - Go to implementation
- `K` - Hover (see documentation without jumping)

**Practice drill:**
1. Create `utils.py`:
```python
def calculate_total(items):
    return sum(items)
```
2. In `test.py`, import it: `from utils import calculate_total`
3. Put cursor on `calculate_total`
4. Press `gd` - jumps to `utils.py`!
5. Press `<C-o>` to return

---

## Step 4: Hover Documentation (Quick Help)

See documentation without leaving your current location:

**Exercise:**
1. Put cursor on any function name (e.g., `print`, `len`, `sum`)
2. Press `K` (hover)
3. **Floating window shows documentation!**
4. Press `<Esc>` to close

**Try hovering on:**
- Built-in functions: `print`, `len`, `str`, `dict`
- Your own functions
- Imported modules

**This is faster than:** Opening browser or help docs!

---

## Step 5: Diagnostics (Error Detection)

LSP shows errors and warnings in real-time:

**Exercise:**
1. In `test.py`, add an error:
```python
undefined_variable = x  # x doesn't exist!
```
2. Notice the **red underline** on `x`
3. Press `<leader>de` (diagnostics open float)
4. See the error message!

**Navigation:**
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>fd` - Find all diagnostics (Telescope)

**Practice:**
1. Create intentional errors:
```python
def test():
    return undefined_var  # Error!
    print("unreachable")  # Warning!
```
2. Navigate between errors with `]d` and `[d`
3. Fix them one by one

---

## Step 6: Code Actions (Quick Fixes)

LSP can automatically fix some issues:

**Exercise:**
1. Create a file with an unused import:
```python
import os
import json  # Unused!

def test():
    return "hello"
```
2. Put cursor on the unused import
3. Press `<leader>ca` (code action)
4. See "Remove unused import" option
5. Select it to auto-fix!

**Common code actions:**
- Remove unused imports
- Add missing imports
- Extract variable/function
- Organize imports

---

## Step 7: Find References (Where is This Used?)

Find all places where a function/variable is used:

**Exercise:**
1. Create `math_utils.py`:
```python
def add(a, b):
    return a + b
```
2. In `test.py`:
```python
from math_utils import add

result1 = add(1, 2)
result2 = add(3, 4)
```
3. Put cursor on `add` in the import
4. Press `gr` (find references)
5. **See all usages listed!**
6. Press `<Enter>` on any to jump there

**Use case:** "Where is this function called?"

---

## Step 8: Symbol Navigation (Jump to Functions/Classes)

Quickly jump to any function or class in your file:

**Exercise:**
1. Create a file with multiple functions:
```python
def function_a():
    pass

def function_b():
    pass

class MyClass:
    def method(self):
        pass
```
2. Press `<Space>ft` (Telescope treesitter)
3. **See all functions and classes!**
4. Type to filter, press `<Enter>` to jump

**Also try:**
- `:Telescope lsp_document_symbols` - LSP symbols
- `:Telescope lsp_workspace_symbols` - All symbols in project

---

## Step 9: Rename Symbol (Refactor)

Rename a function/variable everywhere it's used:

**Exercise:**
1. Create a function:
```python
def old_name():
    return "test"

result = old_name()
```
2. Put cursor on `old_name`
3. Press `<leader>rn` (rename)
4. Type new name: `new_name`
5. Press `<Enter>`
6. **All occurrences are renamed!**

**This is incredibly powerful** - refactor safely across entire project!

---

## Step 10: Formatting (Auto-Format Code)

Format your code automatically:

**Exercise:**
1. Create messy code:
```python
def test(  x,y  ):
    return x+y
```
2. Press `<leader>lf` (LSP format) or `<leader>cf` (format buffer)
3. **Code is automatically formatted!**

**Auto-format on save:**
- Already configured! Just save with `:w`
- Uses black/isort/ruff if installed

**Practice:**
1. Write intentionally messy code
2. Save it (`:w`)
3. Watch it auto-format!

---

## Step 11: Type Checking (Mypy Integration)

Get type checking if you have mypy installed:

**Exercise:**
1. Create code with type issues:
```python
def add(a: int, b: int) -> int:
    return a + b

result = add("hello", "world")  # Type error!
```
2. LSP/mypy will show type errors
3. Fix by passing correct types

**Type hints make code more maintainable!**

---

## Step 12: Debugging with DAP (Debug Adapter Protocol)

Debug Python code directly in Neovim:

**Exercise:**
1. Create `debug_test.py`:
```python
def calculate_sum(numbers):
    total = 0
    for num in numbers:
        total += num
    return total

result = calculate_sum([1, 2, 3, 4, 5])
print(f"Sum: {result}")
```

2. **Set a breakpoint:**
   - Put cursor on line `total = 0`
   - Press `<leader>db` (toggle breakpoint)
   - See `●` appear in the gutter

3. **Start debugging:**
   - Press `<F5>` (continue/start)
   - Execution stops at breakpoint!

4. **Debug controls:**
   - `<F5>` - Continue
   - `<F10>` - Step over
   - `<F11>` - Step into
   - `<F12>` - Step out
   - `<leader>dr` - Open REPL
   - `<leader>dq` - Terminate

**Practice:**
1. Set breakpoint in the loop
2. Step through with `<F10>`
3. Check variable values in REPL (`<leader>dr`)

---

## Step 13: Debugging Configurations

Use different debug configurations:

**Exercise:**
1. Create a Django project structure
2. Use "Django" configuration from DAP setup
3. Or create custom launch.json for your project

**Available configurations:**
- Launch file (current file)
- Attach to process
- Django
- Flask
- Pytest

**To use:**
1. Press `<F5>`
2. Select configuration from list
3. Debug starts!

---

## Step 14: Testing with Pytest

Run and debug tests:

**Exercise:**
1. Create `test_math.py`:
```python
import pytest

def add(a, b):
    return a + b

def test_add():
    assert add(1, 2) == 3
    assert add(0, 0) == 0
```

2. **Run tests:**
   - Terminal: `pytest test_math.py`
   - Or use DAP "Pytest" configuration

3. **Debug tests:**
   - Set breakpoint in test
   - Use "Pytest" DAP config
   - Step through test execution

---

## Step 15: Virtual Environment Support

Work with Python virtual environments:

**Exercise:**
1. Create venv: `python3 -m venv venv`
2. Activate: `source venv/bin/activate` (in terminal)
3. Install packages: `pip install requests`
4. LSP automatically detects venv!

**Pro tip:** Pyright detects virtual environments automatically.

---

## Step 16: Import Management

Organize and manage imports:

**Exercise:**
1. Create file with messy imports:
```python
import os
import sys
from pathlib import Path
import json
```

2. **Organize imports:**
   - Press `<leader>ca` on imports
   - Select "Organize imports" (if available)
   - Or use isort: `<leader>cf`

**Auto-format on save** will organize imports if isort is installed.

---

## Step 17: Project Navigation

Navigate large Python projects:

**Exercise:**
1. **Find files:** `<Space>ff` → type filename
2. **Search code:** `<Space>fg` → type function/class name
3. **Find symbols:** `<Space>ft` → see all functions/classes
4. **Go to definition:** `gd` on any symbol
5. **Find references:** `gr` on any symbol

**Workflow:**
```
<Space>fg       → Search for "calculate"
<Enter>         → Jump to definition
gd              → Go to implementation
gr              → Find all usages
```

---

## Step 18: Code Completion with Snippets

Use luasnip snippets for Python:

**Exercise:**
1. Type `def` and press `<Tab>`
2. Snippet expands with function template
3. Fill in the placeholders

**Available snippets:**
- `def` - Function definition
- `class` - Class definition
- `if` - If statement
- `for` - For loop
- `try` - Try/except block

---

## Step 19: Linting (Code Quality)

Get code quality suggestions:

**Exercise:**
1. Install linters: `pip install flake8 pylint ruff`
2. Create code with issues:
```python
def test(x,y):  # Missing spaces
    unused_var = 10  # Unused variable
    return x+y  # Missing space
```
3. LSP/linters show warnings
4. Fix with code actions or manually

**Common linters:**
- **flake8** - Style guide enforcement
- **pylint** - Comprehensive analysis
- **ruff** - Fast, modern linter
- **mypy** - Type checking

---

## Step 20: Real-World Workflow

Complete a feature from start to finish:

**Challenge: Create a Calculator Module**

1. **Create module:**
   ```
   :e calculator.py
   ```
   ```python
   def add(a, b):
       return a + b
   
   def subtract(a, b):
       return a - b
   ```

2. **Add tests:**
   ```
   :e test_calculator.py
   ```
   ```python
   from calculator import add, subtract
   
   def test_add():
       assert add(2, 3) == 5
   
   def test_subtract():
       assert subtract(5, 2) == 3
   ```

3. **Debug:**
   - Set breakpoint in `add` function
   - Press `<F5>` → Select "Launch file"
   - Step through execution

4. **Refactor:**
   - Rename `add` to `calculate_add` using `<leader>rn`
   - All references update automatically!

5. **Format:**
   - Press `<leader>lf` to format
   - Save and auto-format

6. **Commit:**
   - Use Gitsigns to stage changes
   - Commit with Neogit

---

## Python Development Cheat Sheet

### LSP Navigation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `K` - Hover documentation
- `gr` - Find references
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>lf` - Format code

### Diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>de` - Open diagnostics float
- `<leader>fd` - Find all diagnostics

### Debugging (DAP)
- `<F5>` - Continue/Start
- `<F10>` - Step over
- `<F11>` - Step into
- `<F12>` - Step out
- `<leader>db` - Toggle breakpoint
- `<leader>dB` - Conditional breakpoint
- `<leader>dr` - Open REPL
- `<leader>dq` - Terminate

### Code Navigation
- `<Space>ft` - Functions/classes (treesitter)
- `<Space>fg` - Search code (grep)
- `<Space>ff` - Find files
- `<Space>fw` - Find word under cursor

### Formatting & Linting
- `<leader>cf` - Format buffer
- `<leader>lf` - LSP format
- Auto-format on save (configured)

---

## Practice Challenges

### Challenge 1: Code Navigation (5 minutes)
1. Create a project with 3 files
2. Use `gd` to jump between functions
3. Use `gr` to find all usages
4. Use `<Space>ft` to browse symbols

### Challenge 2: Debugging (10 minutes)
1. Write a function with a bug
2. Set breakpoints
3. Step through execution
4. Fix the bug
5. Verify with tests

### Challenge 3: Refactoring (10 minutes)
1. Create code with repeated patterns
2. Extract to function using code actions
3. Rename variables using `<leader>rn`
4. Format code
5. Run tests

### Challenge 4: Full Workflow (20 minutes)
1. Create a new feature branch
2. Write code with LSP assistance
3. Debug any issues
4. Write tests
5. Format and lint
6. Commit changes

---

## Real-World Workflows

### Workflow 1: Understanding New Codebase
```
<Space>fg       → Search for main functions
<Enter>         → Jump to definition
gd              → See implementation
gr              → Find all usages
K               → Read documentation
```

### Workflow 2: Debugging a Bug
```
<Space>fd       → Find all errors
<Enter>         → Jump to error
<leader>db      → Set breakpoint
<F5>            → Start debugging
<F10>           → Step through
<leader>dr      → Check variables in REPL
```

### Workflow 3: Adding a Feature
```
<Space>ff       → Find relevant files
gd              → Understand existing code
<leader>rn      → Rename if needed
Write code      → With LSP autocomplete
<leader>lf      → Format
<F5>            → Debug if needed
```

### Workflow 4: Refactoring
```
gr              → Find all usages
<leader>rn      → Rename safely
<leader>ca      → Extract function/variable
<leader>lf      → Format
Run tests       → Verify nothing broke
```

---

## Pro Tips

1. **Use type hints** - Better autocomplete and error detection
2. **Enable mypy** - Catch type errors early
3. **Format on save** - Consistent code style
4. **Use virtual environments** - Isolate dependencies
5. **Write tests** - Debug with DAP
6. **Learn keyboard shortcuts** - Faster than mouse
7. **Use Telescope** - Find anything instantly
8. **Leverage LSP** - Let it do the heavy lifting

---

## Troubleshooting

### "LSP not working"
```vim
:checkhealth    " Check LSP status
:Mason          " Open Mason to install/check servers
```

### "Autocomplete not showing"
- Ensure Pyright is installed: `:Mason`
- Check LSP is attached: `:LspInfo`
- Restart LSP: `:LspRestart`

### "Debugging not working"
- Install debugpy: `pip install debugpy`
- Or use Mason: `:Mason` → install debugpy
- Check DAP adapter: `:lua require('dap').configurations.python`

### "Formatting not working"
- Install formatter: `pip install black isort ruff`
- Check none-ls: `:NullLsInfo`
- Manual format: `<leader>cf`

---

## Next Steps

1. **Practice daily** - Use these features in real projects
2. **Explore LSP features** - There's more than covered here
3. **Customize** - Adjust settings in `lua/plugins/lspconfig.lua`
4. **Learn Python best practices** - LSP helps enforce them
5. **Try advanced DAP** - Conditional breakpoints, watch expressions

---

**You're now ready to develop Python efficiently in Neovim!** 🐍

The key is practice - use these features daily until they become muscle memory.

**Next:** Complete the C# development guide (`09-csharp-development.md`) to master both languages!

