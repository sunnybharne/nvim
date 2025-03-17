return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
  },
  keys = {
  },
  config = function ()
    local wk = require("which-key")

      -- 🔹 Which-Key Mappings
      wk.add({
        -- 🏷️ Windows and Splits
        { "<leader>w",  proxy = "<c-w>",                                      group = "Windows" },
        { "<leader>|",  "<cmd>vsplit<CR>",                                    desc = "Vertical Split",      mode = "n" },
        { "<leader>-",  "<cmd>split<CR>",                                     desc = "Horizontal Split",    mode = "n" },
        { "<leader>wc", "<cmd>close<cr>",                                     desc = "Close Window",        mode = "n" },

        -- 📂 Buffers
        { "<leader>b",  group = "Buffers" },
        { "<leader>bn", "<cmd>bnext<CR>",                                     desc = "Next Buffer",         mode = "n" },
        { "<leader>bp", "<cmd>bprevious<CR>",                                 desc = "Previous Buffer",     mode = "n" },
        { "<leader>bk", "<cmd>bd<CR>",                                        desc = "Close Buffer",        mode = "n" },

        -- 🔍 Search (Telescope)
        { "<leader>f",  group = "Find" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>",                      desc = "Find Files",          mode = "n" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",                       desc = "Live Grep",           mode = "n" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",                         desc = "Find Buffers",        mode = "n" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",                       desc = "Find Help",           mode = "n" },
        { "<leader>pp", "<cmd>Telescope neovim-project discover<CR>",         desc = "Find Project",        mode = "n" },

        -- 🤖 AI: Copilot Chat
        { "<leader>c",  group = "Copilot" },
        { "<leader>cc", "<cmd>CopilotChatToggle<CR>",                         desc = "Toggle Copilot Chat", mode = "n" },

        -- 🔀 Git (LazyGit & Git Signs)
        { "<leader>g",  group = "Git" },
        { "<leader>gg", "<cmd>LazyGit<cr>",                                   desc = "Open LazyGit",        mode = "n" },
        { "<leader>gs", function() require("gitsigns").stage_hunk() end,      desc = "Stage Hunk" },
        { "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo Stage" },
        { "<leader>gd", function() require("gitsigns").diffthis() end,        desc = "Git Diff" },

        -- 🏷️ LSP, Lint & Format Keybindings
        { "<leader>l",  group = "LSP" },
        { "<leader>ld", function() vim.diagnostic.open_float() end,           desc = "Show Diagnostics" },
        { "<leader>lr", function() vim.lsp.buf.rename() end,                  desc = "Rename Symbol" },
        { "<leader>la", function() vim.lsp.buf.code_action() end,             desc = "Code Action" },
        { "<leader>ll", function() require("lint").try_lint() end,            desc = "Run Linter" },
        { "<leader>lf", function() require("conform").format() end,           desc = "Format Code" }, -- ✅ Added Formatter Keybinding
        { "gd",         function() vim.lsp.buf.definition() end,              desc = "Go to Definition" },
        { "gr",         function() vim.lsp.buf.references() end,              desc = "Find References" },
        { "K",          function() vim.lsp.buf.hover() end,                   desc = "Hover Documentation" },

        -- 📂 File Manager (`mini.files`)
        { "<leader>e",  function() require("mini.files").open() end,          desc = "Open File Manager" },

        -- 🐞 Debugging (`nvim-dap`)
        { "<leader>d",  group = "Debug" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end,    desc = "Toggle Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end,             desc = "Start Debugging" },
        { "<leader>do", function() require("dap").step_over() end,            desc = "Step Over" },
        { "<leader>di", function() require("dap").step_into() end,            desc = "Step Into" },
        { "<leader>du", function() require("dap").step_out() end,             desc = "Step Out" },

        -- ⚡ Flash.nvim (Fast Navigation)
        { "s",          function() require("flash").jump() end,               desc = "Flash Jump" },
        { "S",          function() require("flash").treesitter() end,         desc = "Flash Treesitter" },

        -- 📜 Help Menu
        { "<leader>?",  "<cmd>Cheatsheet<cr>",                                desc = "Show Keymaps" },

        -- Example of a hidden keymap
        { "<leader>f1", hidden = true },

        -- Example of a dynamically expanding mapping
        {
          "<leader>b",
          group = "Buffers",
          expand = function()
            return require("which-key.extras").expand.buf()
          end
        },

        -- Example of Nested Mappings
        {
          mode = { "n", "v" },                          -- NORMAL and VISUAL mode
          { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- No need to specify mode since it's inherited
          { "<leader>w", "<cmd>w<cr>", desc = "Write" },
        }
    })
  end
}
