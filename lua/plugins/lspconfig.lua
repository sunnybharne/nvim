return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- LSP keybindings
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostics" })
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
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", opts, { desc = "Format" }))
      end

      -- LSP capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- Use built-in LSP capabilities (nvim-cmp not required)
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" }
      }

      -- Language servers configuration
      local servers = {
        "lua_ls",
        "pyright",
        "tsserver",
        "jsonls",
        "yamlls",
        "bashls",
        "dockerls",
        "terraformls",
        "bicep",
        "omnisharp", -- C# language server
        "azure_pipelines_ls",
        "github_actions_ls",
        "powershell_es", -- PowerShell language server
      }

      -- Setup language servers
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      -- Lua LSP specific settings
      vim.lsp.config("lua_ls", {
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

      -- Python LSP specific settings
      vim.lsp.config("pyright", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- TypeScript/JavaScript LSP specific settings
      vim.lsp.config("tsserver", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      -- Terraform LSP specific settings
      vim.lsp.config("terraformls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          terraform = {
            format = {
              enable = true,
            },
            validate = {
              enable = true,
            },
          },
        },
      })

      -- Bicep LSP specific settings
      vim.lsp.config("bicep", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          bicep = {
            format = {
              enable = true,
            },
            validate = {
              enable = true,
            },
          },
        },
      })

      -- C# LSP specific settings (OmniSharp)
      vim.lsp.config("omnisharp", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          OmniSharp = {
            enableEditorConfigSupport = true,
            enableMsBuildLoadProjectsOnDemand = false,
            enableRoslynAnalyzers = true,
            organizeImportsOnFormat = true,
            enableImportCompletion = true,
            sdkPath = nil, -- Will use OmniSharp's built-in SDK
            useModernNet = true,
          },
        },
      })

      -- Azure Pipelines LSP specific settings
      vim.lsp.config("azure_pipelines_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          azurePipelines = {
            validate = true,
            format = true,
          },
        },
      })

      -- GitHub Actions LSP specific settings
      vim.lsp.config("github_actions_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          githubActions = {
            validate = true,
            format = true,
          },
        },
      })

      -- PowerShell LSP specific settings
      vim.lsp.config("powershell_es", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          powershell = {
            enableProfileLoading = true,
            scriptAnalysis = {
              enable = true,
            },
            codeFormatting = {
              Preset = "OTBS",
              openBraceOnSameLine = true,
              newLineAfterOpenBrace = true,
              newLineAfterCloseBrace = true,
              whitespaceBeforeOpenBrace = true,
              whitespaceAfterOpenBrace = true,
              whitespaceAroundOperator = true,
              whitespaceAfterSeparator = true,
              whitespaceBeforeSeparator = true,
              whitespaceInsideBrace = true,
              whitespaceAroundPipe = true,
              ignoreOneLineBlock = true,
              alignPropertyValuePairs = true,
            },
            integratedConsole = {
              showOnStartup = false,
            },
            useX86Host = false,
            promptToUpdatePowerShell = false,
            enableTelemetry = false,
          },
        },
      })

      -- Enable LSP for all configured servers
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  }
}
