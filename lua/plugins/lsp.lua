return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      -- Import LSP
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- ✅ List of LSP servers with correct `lspconfig` references
      local servers = {
        "lua_ls",
        "azure_pipelines_ls",
        "bashls",
        "bicep",
        "ts_ls",
        "terraformls",
        "sqlls",
        "robotframework_ls",
        "pyright",
        "powershell_es",
        "jsonls",
        "html",
        "yamlls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "ansiblels",
        "graphql",
        "kotlin_language_server",
        "grammarly",
        "cucumber_language_server",
        "diagnosticls",
        "nextls",
        "mutt_ls",
        "mdx_analyzer",
        "gradle_ls",
        "helm_ls",
      }

      -- Mason Setup (LSP Installer)
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = servers, -- ✅ Install only correct LSPs
      })

      -- Common LSP Keybindings
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)         -- Go to definition
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)         -- Show references
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)               -- Hover docs
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)     -- Rename symbol
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
        vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts) -- Show diagnostics
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)       -- Prev diagnostic
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)       -- Next diagnostic
      end

      -- Setup LSP Servers
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities -- ✅ Added capabilities for better autocomplete
        })
      end

      -- Lua-specific LSP settings
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" } -- ✅ Prevents "Undefined global 'vim'" warning
            }
          }
        }
      }
    end
  }
}
