return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      local null_ls = require("null-ls")
      local builtins = null_ls.builtins
      local utils = require("null-ls.utils")

      local function has_exe(exe)
        return vim.fn.executable(exe) == 1
      end

      local sources = {
        -- Always safe formatters
        builtins.formatting.stylua,
        builtins.formatting.shfmt,
        builtins.formatting.terraform_fmt,
        builtins.formatting.csharpier,

        -- Always safe diagnostics
        builtins.diagnostics.hadolint,
        builtins.diagnostics.yamllint,
      }

      -- Python formatters and linters (optional - only add if executable exists)
      if has_exe("black") then
        table.insert(sources, builtins.formatting.black)
      end
      if has_exe("isort") then
        table.insert(sources, builtins.formatting.isort)
      end
      if has_exe("autopep8") then
        table.insert(sources, builtins.formatting.autopep8)
      end
      if has_exe("flake8") then
        table.insert(sources, builtins.diagnostics.flake8)
      end
      if has_exe("pylint") then
        table.insert(sources, builtins.diagnostics.pylint)
      end
      if has_exe("mypy") then
        table.insert(sources, builtins.diagnostics.mypy)
      end
      if has_exe("ruff") then
        table.insert(sources, builtins.formatting.ruff)
        table.insert(sources, builtins.diagnostics.ruff)
      end

      -- Optional: only add if executable exists
      if has_exe("prettier") then
        table.insert(sources, builtins.formatting.prettier)
      end
      if has_exe("eslint_d") then
        table.insert(sources, builtins.diagnostics.eslint_d)
        -- If you prefer eslint over eslint_d, swap to builtins.diagnostics.eslint
      end
      -- Note: tflint diagnostics are handled by the tflint LSP server, not none-ls

      null_ls.setup({
        sources = sources,
      })

      -- Keymap: format current buffer using LSP (will use none-ls when attached)
      vim.keymap.set("n", "<leader>cf", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "Format buffer" })

      -- Auto-format on save for supported filetypes
      local format_group = vim.api.nvim_create_augroup("NoneLSFormat", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = format_group,
        callback = function(args)
          -- Only attempt if a client that supports formatting is attached
          local clients = vim.lsp.get_clients({ bufnr = args.buf })
          for _, c in ipairs(clients) do
            if c.server_capabilities and c.server_capabilities.documentFormattingProvider then
              vim.lsp.buf.format({ bufnr = args.buf })
              return
            end
          end
        end,
      })
    end,
  },
}


