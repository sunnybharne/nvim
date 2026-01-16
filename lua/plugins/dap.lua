return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")

      -- UI signs
      vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn",  linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DiagnosticInfo",  linehl = "Visual", numhl = "" })
      vim.fn.sign_define("DapLogPoint",            { text = "◆", texthl = "DiagnosticHint",  linehl = "", numhl = "" })

      -- Core keymaps (language-agnostic)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
      end

      map("n", "<F5>", function() dap.continue() end, "DAP Continue")
      map("n", "<F10>", function() dap.step_over() end, "DAP Step Over")
      map("n", "<F11>", function() dap.step_into() end, "DAP Step Into")
      map("n", "<F12>", function() dap.step_out() end, "DAP Step Out")
      map("n", "<leader>db", function() dap.toggle_breakpoint() end, "DAP Toggle Breakpoint")
      map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, "DAP Conditional Breakpoint")
      map("n", "<leader>dl", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, "DAP Log Point")
      map("n", "<leader>dr", function() dap.repl.toggle() end, "DAP REPL Toggle")
      map("n", "<leader>dq", function() dap.terminate() end, "DAP Terminate")
      map("n", "<leader>dc", function() dap.run_to_cursor() end, "DAP Run to Cursor")

      -- Python DAP adapter (debugpy)
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
          end,
          console = "integratedTerminal",
          justMyCode = false,
        },
        {
          type = "python",
          request = "attach",
          name = "Attach to process",
          processId = "${command:pickProcess}",
          justMyCode = false,
        },
        {
          type = "python",
          request = "launch",
          name = "Django",
          program = "${workspaceFolder}/manage.py",
          args = { "runserver" },
          django = true,
          justMyCode = false,
        },
        {
          type = "python",
          request = "launch",
          name = "Flask",
          module = "flask",
          args = { "run", "--no-debugger", "--no-reload" },
          jinja = true,
          justMyCode = false,
        },
        {
          type = "python",
          request = "launch",
          name = "Pytest",
          module = "pytest",
          args = { "${file}" },
          console = "integratedTerminal",
          justMyCode = false,
        },
      }

      -- C# DAP adapter (netcoredbg)
      dap.adapters.coreclr = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch .NET Core",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          console = "internalConsole",
        },
        {
          type = "coreclr",
          name = "Attach to .NET Core",
          request = "attach",
          processId = "${command:pickProcess}",
        },
      }
    end,
  },
}


