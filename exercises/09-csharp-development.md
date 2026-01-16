# C# Development in Neovim - Complete Guide

Master C# development using Neovim's powerful LSP, debugging, formatting, and navigation features.

---

## Prerequisites

Before starting, ensure you have:
- .NET SDK installed (`dotnet --version`)
- Neovim with Mason installed (auto-installs OmniSharp LSP)
- Optional: CSharpier for formatting (already configured)

---

## Step 1: Understanding C# LSP (OmniSharp)

OmniSharp provides comprehensive C# language support:

**What LSP gives you:**
- ✅ IntelliSense (autocomplete)
- ✅ Go to definition/implementation
- ✅ Hover documentation
- ✅ Error detection (diagnostics)
- ✅ Code actions (quick fixes)
- ✅ Symbol navigation
- ✅ Find references
- ✅ Roslyn analyzers

**Exercise:**
1. Create a test file: `:e Program.cs`
2. Type this code:
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}
```
3. Notice any **red underlines** - these are LSP diagnostics!

---

## Step 2: Autocomplete (IntelliSense)

Get intelligent code suggestions as you type:

**Exercise:**
1. In `Program.cs`, type: `Console.`
2. **Autocomplete menu appears!** Press `<C-n>` to navigate, `<Enter>` to select
3. Try: `string.` - see string methods
4. Try: `List<int>.` - see generic list methods

**Pro tip:** Autocomplete works for:
- Class members
- Method parameters
- Namespace imports
- Variable names
- LINQ methods

**Practice:**
```csharp
using System.Collections.Generic;

var list = new List<int>();
// Type: list.
// See all List methods

// Type: list.Where(
// See method signature
```

---

## Step 3: Go to Definition (Navigate Code)

Jump to where classes/methods are defined:

**Exercise:**
1. Create `Utils.cs`:
```csharp
namespace MyApp
{
    public static class Utils
    {
        public static int Add(int a, int b)
        {
            return a + b;
        }
    }
}
```

2. In `Program.cs`:
```csharp
using MyApp;

var result = Utils.Add(1, 2);
```

3. Put cursor on `Add`
4. Press `gd` (go to definition)
5. **Jumps to Utils.cs!**
6. Press `<C-o>` to jump back

**Also try:**
- `gD` - Go to declaration
- `gi` - Go to implementation
- `K` - Hover (see docs without jumping)

---

## Step 4: Hover Documentation (Quick Help)

See XML documentation comments:

**Exercise:**
1. Add XML docs to a method:
```csharp
/// <summary>
/// Adds two numbers together.
/// </summary>
/// <param name="a">First number</param>
/// <param name="b">Second number</param>
/// <returns>Sum of a and b</returns>
public static int Add(int a, int b)
{
    return a + b;
}
```

2. Put cursor on `Add` where it's called
3. Press `K` (hover)
4. **See documentation in floating window!**

**Try hovering on:**
- .NET built-in types: `string`, `List<T>`, `Console`
- Your own methods with XML docs
- NuGet package types

---

## Step 5: Diagnostics (Error Detection)

LSP shows errors and warnings in real-time:

**Exercise:**
1. Create code with errors:
```csharp
class Test
{
    public void Method()
    {
        int x = undefined;  // Error!
        string s = null;
        int len = s.Length;  // Warning: possible null reference
    }
}
```

2. Notice **red underlines** on errors
3. Press `<leader>de` (diagnostics open float)
4. See error messages!

**Navigation:**
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>fd` - Find all diagnostics (Telescope)

---

## Step 6: Code Actions (Quick Fixes)

OmniSharp provides powerful code actions:

**Exercise:**
1. Create code needing fixes:
```csharp
using System;

class Program
{
    static void Main()
    {
        var x = 10;  // Unused variable
        Console.WriteLine("Hello");
    }
}
```

2. Put cursor on `x`
3. Press `<leader>ca` (code action)
4. See options:
   - Remove unused variable
   - Extract to method
   - Generate constructor
   - Implement interface

**Common code actions:**
- Remove unused usings
- Generate constructor/property
- Extract method/class
- Implement interface
- Add null checks
- Organize usings

---

## Step 7: Find References

Find all usages of a method/class:

**Exercise:**
1. Create `Calculator.cs`:
```csharp
public class Calculator
{
    public int Add(int a, int b) => a + b;
}
```

2. Use it in multiple places:
```csharp
var calc = new Calculator();
var result1 = calc.Add(1, 2);
var result2 = calc.Add(3, 4);
```

3. Put cursor on `Add` method name
4. Press `gr` (find references)
5. **See all usages!**
6. Press `<Enter>` to jump to any

**Use case:** "Where is this method called?"

---

## Step 8: Symbol Navigation

Navigate classes, methods, properties:

**Exercise:**
1. Create a file with multiple classes:
```csharp
namespace MyApp
{
    public class ClassA
    {
        public void MethodA() { }
    }
    
    public class ClassB
    {
        public void MethodB() { }
    }
}
```

2. Press `<Space>ft` (Telescope treesitter)
3. **See all classes and methods!**
4. Type to filter, press `<Enter>` to jump

**Also try:**
- `:Telescope lsp_document_symbols` - LSP symbols
- `:Telescope lsp_workspace_symbols` - All symbols in project

---

## Step 9: Rename Symbol (Refactor)

Rename safely across entire solution:

**Exercise:**
1. Create a class:
```csharp
public class OldName
{
    public void Method() { }
}

var obj = new OldName();
```

2. Put cursor on `OldName`
3. Press `<leader>rn` (rename)
4. Type: `NewName`
5. Press `<Enter>`
6. **All occurrences renamed!**

**This works across:**
- Multiple files
- Different namespaces
- Projects in solution

---

## Step 10: Formatting (Auto-Format Code)

Format C# code automatically:

**Exercise:**
1. Create messy code:
```csharp
class Test{
public void Method(  int x,int y  ){
return x+y;
}
}
```

2. Press `<leader>lf` (LSP format) or `<leader>cf` (format buffer)
3. **Code is automatically formatted!**

**Formatters available:**
- **CSharpier** (configured in none-ls)
- Built-in OmniSharp formatter
- Auto-format on save (if configured)

---

## Step 11: Solution/Project Management

Work with .NET solutions and projects:

**Exercise:**
1. **Create a project:**
   ```bash
   dotnet new console -n MyApp
   cd MyApp
   ```

2. **Open in Neovim:**
   ```
   :e Program.cs
   ```

3. **LSP automatically detects:**
   - `.csproj` file
   - Project structure
   - Dependencies
   - References

**Pro tip:** LSP finds `.sln` and `.csproj` files automatically!

---

## Step 12: NuGet Package Support

LSP understands NuGet packages:

**Exercise:**
1. Add a NuGet package:
   ```bash
   dotnet add package Newtonsoft.Json
   ```

2. In code:
   ```csharp
   using Newtonsoft.Json;
   
   var obj = JsonConvert.
   // Autocomplete shows JsonConvert methods!
   ```

3. LSP provides IntelliSense for package types!

---

## Step 13: Debugging with DAP

Debug C# code directly in Neovim:

**Exercise:**
1. Create `Program.cs`:
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        int sum = 0;
        for (int i = 1; i <= 5; i++)
        {
            sum += i;
        }
        Console.WriteLine($"Sum: {sum}");
    }
}
```

2. **Set a breakpoint:**
   - Put cursor on `sum += i;`
   - Press `<leader>db` (toggle breakpoint)
   - See `●` in gutter

3. **Start debugging:**
   - Press `<F5>` (continue/start)
   - Select "Launch .NET Core" configuration
   - Execution stops at breakpoint!

4. **Debug controls:**
   - `<F5>` - Continue
   - `<F10>` - Step over
   - `<F11>` - Step into
   - `<F12>` - Step out
   - `<leader>dr` - Open REPL
   - `<leader>dq` - Terminate

**Practice:**
1. Set breakpoint in loop
2. Step through with `<F10>`
3. Check variable values

---

## Step 14: Debugging Configurations

Use different debug configurations:

**Available configurations:**
- Launch .NET Core (runs executable)
- Attach to .NET Core (attach to running process)

**To use:**
1. Build your project: `dotnet build`
2. Press `<F5>`
3. Select configuration
4. Enter path to executable (or use default)
5. Debug starts!

**Custom configuration:**
Edit DAP config in `lua/plugins/dap.lua` for project-specific settings.

---

## Step 15: Testing with xUnit/NUnit

Run and debug tests:

**Exercise:**
1. Create test project:
   ```bash
   dotnet new xunit -n MyApp.Tests
   ```

2. Create test:
   ```csharp
   using Xunit;
   
   public class CalculatorTests
   {
       [Fact]
       public void Add_ShouldReturnSum()
       {
           var result = Calculator.Add(2, 3);
           Assert.Equal(5, result);
       }
   }
   ```

3. **Run tests:**
   ```bash
   dotnet test
   ```

4. **Debug tests:**
   - Set breakpoint in test
   - Use DAP "Launch .NET Core" with test executable
   - Step through test execution

---

## Step 16: Async/Await Support

LSP understands async code:

**Exercise:**
1. Create async method:
   ```csharp
   using System.Threading.Tasks;
   
   public async Task<string> FetchDataAsync()
   {
       await Task.Delay(1000);
       return "Data";
   }
   ```

2. **LSP provides:**
   - Autocomplete for async methods
   - Error detection for missing `await`
   - Type checking for `Task<T>`

3. Use it:
   ```csharp
   var data = await FetchDataAsync();
   // LSP shows correct return type!
   ```

---

## Step 17: LINQ Support

Get IntelliSense for LINQ:

**Exercise:**
1. Create LINQ query:
   ```csharp
   using System.Linq;
   
   var numbers = new[] { 1, 2, 3, 4, 5 };
   var evens = numbers.Where(n => n % 2 == 0)
                      .Select(n => n * 2)
                      .ToList();
   ```

2. **LSP provides:**
   - Autocomplete for LINQ methods
   - Type inference
   - Lambda parameter hints

3. Try typing: `numbers.` - see all LINQ methods!

---

## Step 18: Generics Support

LSP understands generic types:

**Exercise:**
1. Create generic class:
   ```csharp
   public class Repository<T>
   {
       public T GetById(int id) { }
       public void Save(T entity) { }
   }
   ```

2. Use it:
   ```csharp
   var repo = new Repository<User>();
   var user = repo.GetById(1);
   // LSP knows user is of type User!
   repo.Save(user);
   // Type checking works!
   ```

---

## Step 19: Code Navigation in Large Projects

Navigate complex C# solutions:

**Exercise:**
1. **Find files:** `<Space>ff` → type filename
2. **Search code:** `<Space>fg` → type class/method name
3. **Find symbols:** `<Space>ft` → see all classes/methods
4. **Go to definition:** `gd` on any symbol
5. **Find references:** `gr` on any symbol

**Workflow:**
```
<Space>fg       → Search for "Repository"
<Enter>         → Jump to definition
gd              → Go to implementation
gr              → Find all usages
K               → Read XML docs
```

---

## Step 20: Real-World Workflow

Complete a feature from start to finish:

**Challenge: Create a User Service**

1. **Create service:**
   ```
   :e Services/UserService.cs
   ```
   ```csharp
   namespace MyApp.Services
   {
       public class UserService
       {
           public User GetUser(int id)
           {
               // Implementation
           }
       }
   }
   ```

2. **Add interface:**
   ```
   :e Services/IUserService.cs
   ```
   ```csharp
   public interface IUserService
   {
       User GetUser(int id);
   }
   ```

3. **Implement interface:**
   - Put cursor on `UserService`
   - Press `<leader>ca` → "Implement interface"
   - Auto-generates implementation!

4. **Debug:**
   - Set breakpoint in `GetUser`
   - Press `<F5>` → Launch
   - Step through execution

5. **Refactor:**
   - Rename `GetUser` to `GetUserById` using `<leader>rn`
   - All references update!

6. **Format:**
   - Press `<leader>lf` to format
   - Save and auto-format

7. **Commit:**
   - Use Gitsigns to stage
   - Commit with Neogit

---

## C# Development Cheat Sheet

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
- `<Space>ft` - Classes/methods (treesitter)
- `<Space>fg` - Search code (grep)
- `<Space>ff` - Find files
- `<Space>fw` - Find word under cursor

### Formatting
- `<leader>cf` - Format buffer (CSharpier)
- `<leader>lf` - LSP format
- Auto-format on save (if configured)

---

## Practice Challenges

### Challenge 1: Code Navigation (5 minutes)
1. Create a solution with 3 projects
2. Use `gd` to jump between classes
3. Use `gr` to find all usages
4. Use `<Space>ft` to browse symbols

### Challenge 2: Debugging (10 minutes)
1. Write a method with a bug
2. Set breakpoints
3. Step through execution
4. Fix the bug
5. Verify with tests

### Challenge 3: Refactoring (10 minutes)
1. Create code with repeated patterns
2. Extract to method using code actions
3. Rename classes using `<leader>rn`
4. Implement interface
5. Format code

### Challenge 4: Full Workflow (20 minutes)
1. Create a new feature branch
2. Write code with LSP assistance
3. Debug any issues
4. Write unit tests
5. Format and commit

---

## Real-World Workflows

### Workflow 1: Understanding New Codebase
```
<Space>fg       → Search for main classes
<Enter>         → Jump to definition
gd              → See implementation
gr              → Find all usages
K               → Read XML documentation
```

### Workflow 2: Debugging a Bug
```
<Space>fd       → Find all errors
<Enter>         → Jump to error
<leader>db      → Set breakpoint
<F5>            → Start debugging
<F10>           → Step through
<leader>dr      → Check variables
```

### Workflow 3: Adding a Feature
```
<Space>ff       → Find relevant files
gd              → Understand existing code
<leader>rn      → Rename if needed
Write code      → With LSP autocomplete
<leader>ca      → Generate code (constructor, etc.)
<leader>lf      → Format
<F5>            → Debug if needed
```

### Workflow 4: Refactoring
```
gr              → Find all usages
<leader>rn      → Rename safely
<leader>ca      → Extract method/class
<leader>ca      → Implement interface
<leader>lf      → Format
Run tests       → Verify nothing broke
```

---

## Pro Tips

1. **Use XML documentation** - Better hover help
2. **Enable Roslyn analyzers** - Catch issues early
3. **Format on save** - Consistent code style
4. **Use async/await properly** - LSP helps detect issues
5. **Write unit tests** - Debug with DAP
6. **Learn keyboard shortcuts** - Faster development
7. **Use Telescope** - Find anything instantly
8. **Leverage code actions** - Generate boilerplate

---

## Troubleshooting

### "LSP not working"
```vim
:checkhealth    " Check LSP status
:Mason          " Open Mason to install/check servers
:LspInfo        " Check attached LSP clients
```

### "OmniSharp not starting"
- Install OmniSharp: `dotnet tool install -g OmniSharp`
- Or use Mason: `:Mason` → install omnisharp
- Check solution file: Ensure `.sln` or `.csproj` exists

### "Autocomplete not showing"
- Ensure OmniSharp is installed
- Check LSP is attached: `:LspInfo`
- Restart LSP: `:LspRestart`
- Check project builds: `dotnet build`

### "Debugging not working"
- Install netcoredbg: Use Mason or download from GitHub
- Build project first: `dotnet build`
- Check DAP adapter: `:lua require('dap').configurations.cs`

### "Formatting not working"
- Install CSharpier: `dotnet tool install -g csharpier`
- Check none-ls: `:NullLsInfo`
- Manual format: `<leader>cf`

---

## Advanced Features

### Code Generation
- **Generate constructor:** `<leader>ca` → "Generate constructor"
- **Generate property:** `<leader>ca` → "Generate property"
- **Implement interface:** `<leader>ca` → "Implement interface"
- **Override method:** `<leader>ca` → "Override method"

### Organize Usings
- Remove unused usings: `<leader>ca` → "Remove unused usings"
- Sort usings: Format code (CSharpier does this)

### Null Safety
- Add null checks: `<leader>ca` → "Add null check"
- Use nullable reference types for better diagnostics

---

## Next Steps

1. **Practice daily** - Use these features in real projects
2. **Explore OmniSharp** - Many features not covered here
3. **Customize** - Adjust settings in `lua/plugins/lspconfig.lua`
4. **Learn C# best practices** - LSP helps enforce them
5. **Try advanced DAP** - Conditional breakpoints, watch expressions
6. **Explore Roslyn analyzers** - Code quality rules

---

**You're now ready to develop C# efficiently in Neovim!** 🎯

The key is practice - use these features daily until they become muscle memory.

**Combined with Python:** You now have full-stack development capabilities in Neovim!

---

## Combined Python + C# Workflow

When working with both languages:

1. **Python backend:** Use Pyright LSP
2. **C# frontend/API:** Use OmniSharp LSP
3. **Switch contexts:** `<Space>fb` to switch buffers
4. **Search across both:** `<Space>fg` searches all files
5. **Debug both:** Different DAP configurations

**You're a polyglot Neovim developer!** 🚀

