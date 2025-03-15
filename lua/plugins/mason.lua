return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = ">",
          package_uninstalled = "",
        },
      }
    })

    require("mason-lspconfig").setup {
        ensure_installed = { "terraformls", "tflint" },
    }

    -- require("mason-lspconfig").setup({
    --   ensure_installed = {
    --     "autotools-language-server",
    --     "azure-pipelines-language-server",
    --     "bash-language-server",
    --     "css-lsp",
    --     "docker-compose-language-service",
    --     "dockerfile-language-server",
    --     "eslint-lsp",
    --     "grammarly-languageserver",
    --     "html-lsp",
    --     "java-language-server",
    --     "json-lsp",
    --     "lua-language-server",
    --     "marksman",
    --     "powershell-editor-services",
    --     "prettier",
    --     "pyright",
    --     "robotframework-lsp",
    --     "sonarlint-language-server",
    --     "tailwindcss-language-server",
    --     "terraform-ls",
    --     "typescript-language-server",
    --     "vim-language-server",
    --   }
    -- })
    --
    -- require("mason-null-ls").setup({
    --   ensure_installed = {
    --     "prettier",
    --     "stylua",
    --     "markdownlint",
    --     "yamllint",
    --     "textlint",
    --     "tflint",
    --     "tfsec",
    --     "eslint_d",
    --     "trivy",
    --     "typos",
    --   }
    -- })
  end
}
