return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Suppress lspconfig deprecation warning for nvim 0.11+
      vim.deprecate = function() end
      -- LSP keybindings
      vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set location list" })

      -- LSP attach function
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Type definition" }))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
        vim.keymap.set("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", opts, { desc = "LSP Format" }))
      end

      -- LSP capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- Use built-in LSP capabilities (nvim-cmp not required)
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" }
      }

      -- Setup LSP servers using lspconfig
      local lspconfig = require("lspconfig")
      
      -- Lua LSP specific settings
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Bicep LSP specific settings with comprehensive features
      lspconfig.bicep.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          bicep = {
            -- Enable all Bicep language features
            format = {
              enable = true,
            },
            validate = {
              enable = true,
            },
            -- Enable IntelliSense and autocompletion
            completions = {
              getAllAccessibleAzureContainerRegistries = true,
            },
            -- Enable decompilation features
            decompileOnPaste = true,
            -- Enable output timestamps for better debugging
            enableOutputTimestamps = true,
            -- Enable surveys for feedback (optional)
            enableSurveys = false,
            -- Configure tracing for debugging
            trace = {
              server = "off", -- Can be "off", "messages", "verbose"
            },
            -- Enable all Bicep language features
            language = {
              enable = true,
            },
            -- Enable semantic highlighting
            semanticHighlighting = {
              enable = true,
            },
            -- Enable hover information
            hover = {
              enable = true,
            },
            -- Enable signature help
            signatureHelp = {
              enable = true,
            },
            -- Enable code actions
            codeActions = {
              enable = true,
            },
            -- Enable document symbols
            documentSymbols = {
              enable = true,
            },
            -- Enable workspace symbols
            workspaceSymbols = {
              enable = true,
            },
            -- Enable references
            references = {
              enable = true,
            },
            -- Enable rename
            rename = {
              enable = true,
            },
            -- Enable diagnostics
            diagnostics = {
              enable = true,
            },
            -- Enable folding
            folding = {
              enable = true,
            },
            -- Enable breadcrumbs
            breadcrumbs = {
              enable = true,
            },
            -- Enable inlay hints
            inlayHints = {
              enable = true,
            },
          },
        },
        -- Additional Bicep-specific configuration
        filetypes = { "bicep" },
        root_dir = function(fname)
          return vim.fn.getcwd()
        end,
        -- Enable all LSP features for Bicep
        flags = {
          debounce_text_changes = 150,
        },
      })

      -- Enable filetype detection for Bicep
      vim.cmd([[autocmd BufNewFile,BufRead *.bicep set filetype=bicep]])
      
      -- Set commentstring for Bicep files
      vim.cmd([[autocmd FileType bicep setlocal commentstring=//\ %s]])
      
      -- Ensure Bicep filetype is recognized
      vim.filetype.add({
        extension = {
          bicep = "bicep",
        },
      })
      
      -- Terraform LSP specific settings
      lspconfig.terraformls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          terraform = {
            path = "terraform",
            telemetry = {
              enable = false,
            },
            experimentalFeatures = {
              validateOnSave = true,
              prefillRequiredFields = true,
            },
          },
        },
        filetypes = { "terraform", "terraform-vars" },
        root_dir = function(fname)
          return vim.fn.getcwd()
        end,
        flags = {
          debounce_text_changes = 150,
        },
      })

      -- TFLint LSP settings
      lspconfig.tflint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "terraform", "terraform-vars" },
        root_dir = function(fname)
          return vim.fn.getcwd()
        end,
      })

      -- Enable filetype detection for Terraform
      vim.cmd([[autocmd BufNewFile,BufRead *.tf,*.tfvars set filetype=terraform]])
      vim.cmd([[autocmd BufNewFile,BufRead *.hcl set filetype=hcl]])
      
      -- Set commentstring for Terraform files
      vim.cmd([[autocmd FileType terraform setlocal commentstring=#\ %s]])
      vim.cmd([[autocmd FileType hcl setlocal commentstring=#\ %s]])
      
      -- Ensure Terraform filetype is recognized
      vim.filetype.add({
        extension = {
          tf = "terraform",
          tfvars = "terraform-vars",
          hcl = "hcl",
        },
      })

      -- Python LSP (Pyright)
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic", -- "off", "basic", "strict"
              autoImportCompletions = true,
              autoSearchPaths = true,
              diagnosticMode = "workspace", -- "openFilesOnly", "workspace"
              useLibraryCodeForTypes = true,
            },
          },
        },
        filetypes = { "python" },
        root_dir = function(fname)
          return lspconfig.util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git")(fname) or vim.fn.getcwd()
        end,
      })

      -- C# LSP (OmniSharp)
      lspconfig.omnisharp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "omnisharp", "--lsp" },
        settings = {
          omnisharp = {
            enableRoslynAnalyzers = true,
            enableEditorConfigSupport = true,
            enableImportCompletion = true,
            enableDecompilationSupport = true,
            organizeImportsOnFormat = true,
            enableAsyncCompletion = true,
            enableMsBuildLoadProjectsOnDemand = false,
            sdkIncludePrereleases = false,
            analyzeOpenDocumentsOnly = false,
          },
        },
        filetypes = { "cs", "csx" },
        root_dir = function(fname)
          return lspconfig.util.root_pattern("*.sln", "*.csproj", ".git")(fname) or vim.fn.getcwd()
        end,
      })

      -- Alternative: C# LSP using csharp_ls (uncomment if you prefer this over OmniSharp)
      -- lspconfig.csharp_ls.setup({
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   filetypes = { "cs", "csx" },
      --   root_dir = function(fname)
      --     return lspconfig.util.root_pattern("*.sln", "*.csproj", ".git")(fname) or vim.fn.getcwd()
      --   end,
      -- })

      -- LSP servers are automatically enabled when setup() is called above
      -- Copilot LSP is handled by copilot.vim plugin
    end,
  }
}
