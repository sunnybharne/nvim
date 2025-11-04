return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    keys = {
      -- File pickers
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files (fzf)" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files (fzf)" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers (fzf)" },

      -- Search
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep (fzf)" },
      { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word under cursor (fzf)" },
      { "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", desc = "Grep WORD under cursor (fzf)" },
      { "<leader>fv", "<cmd>FzfLua grep_visual<cr>", desc = "Grep visual selection (fzf)", mode = "v" },

      -- Git
      { "<leader>fgc", "<cmd>FzfLua git_commits<cr>", desc = "Git commits (fzf)" },
      { "<leader>fgb", "<cmd>FzfLua git_branches<cr>", desc = "Git branches (fzf)" },
      { "<leader>fgs", "<cmd>FzfLua git_status<cr>", desc = "Git status (fzf)" },

      -- LSP
      { "<leader>fld", "<cmd>FzfLua lsp_definitions<cr>", desc = "LSP definitions (fzf)" },
      { "<leader>flr", "<cmd>FzfLua lsp_references<cr>", desc = "LSP references (fzf)" },
      { "<leader>fli", "<cmd>FzfLua lsp_implementations<cr>", desc = "LSP implementations (fzf)" },
      { "<leader>fls", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "LSP symbols (fzf)" },
      { "<leader>flw", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "LSP workspace symbols (fzf)" },
      { "<leader>fla", "<cmd>FzfLua lsp_code_actions<cr>", desc = "LSP code actions (fzf)" },

      -- Misc
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags (fzf)" },
      { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps (fzf)" },
      { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Commands (fzf)" },
      { "<leader>fC", "<cmd>FzfLua colorschemes<cr>", desc = "Colorschemes (fzf)" },
      { "<leader>f:", "<cmd>FzfLua command_history<cr>", desc = "Command history (fzf)" },
      { "<leader>f/", "<cmd>FzfLua search_history<cr>", desc = "Search history (fzf)" },
      { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Marks (fzf)" },
      { "<leader>fj", "<cmd>FzfLua jumps<cr>", desc = "Jumps (fzf)" },

      -- Resume
      { "<leader>f.", "<cmd>FzfLua resume<cr>", desc = "Resume last picker (fzf)" },
    },
    opts = function()
      return {
        -- Use telescope-like configuration
        defaults = {
          -- file_icons = true,
          -- git_icons = true,
          color_icons = true,
        },
        winopts = {
          height = 0.85,
          width = 0.80,
          row = 0.35,
          col = 0.50,
          border = "rounded",
          preview = {
            default = "bat",
            border = "border",
            wrap = "nowrap",
            hidden = "nohidden",
            vertical = "down:45%",
            horizontal = "right:60%",
            layout = "flex",
            flip_columns = 120,
          },
        },
        fzf_opts = {
          ["--layout"] = "reverse",
          ["--info"] = "inline",
        },
      }
    end,
  },
}
