return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    lazy = false,
    keys = {
      -- File finding
      { "<leader>ff", ":Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", ":Telescope buffers<CR>", desc = "Find buffers" },
      { "<leader>fr", ":Telescope oldfiles<CR>", desc = "Recent files" },
      
      -- Help & Discovery
      { "<leader>fh", ":Telescope help_tags<CR>", desc = "Help tags" },
      { "<leader>fc", ":Telescope commands<CR>", desc = "Commands" },
      { "<leader>fk", ":Telescope keymaps<CR>", desc = "Keymaps" },
      { "<leader>fm", ":Telescope marks<CR>", desc = "Marks" },
      { "<leader>fj", ":Telescope jumplist<CR>", desc = "Jump list" },
      { "<leader>fo", ":Telescope vim_options<CR>", desc = "Vim options" },
      
      -- Search
      { "<leader>fw", ":Telescope grep_string<CR>", desc = "Grep word under cursor" },
      { "<leader>f/", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy find in buffer" },
      { "<leader>fs", ":Telescope spell_suggest<CR>", desc = "Spelling suggestions" },
      
      -- Code & LSP
      { "<leader>fd", ":Telescope diagnostics<CR>", desc = "Diagnostics" },
      { "<leader>fq", ":Telescope quickfix<CR>", desc = "Quickfix list" },
      { "<leader>fl", ":Telescope loclist<CR>", desc = "Location list" },
      { "<leader>ft", ":Telescope treesitter<CR>", desc = "Treesitter symbols" },
      
      -- Git keymaps
      { "<leader>tf", ":Telescope git_files<CR>", desc = "Git files" },
      { "<leader>ts", ":Telescope git_status<CR>", desc = "Git status" },
      { "<leader>tb", ":Telescope git_branches<CR>", desc = "Git branches" },
      { "<leader>tgc", ":Telescope git_commits<CR>", desc = "Git commits" },
      { "<leader>tC", ":Telescope git_bcommits<CR>", desc = "Git buffer commits" },
      { "<leader>tS", ":Telescope git_stash<CR>", desc = "Git stash" },
      
      -- Resume & History
      { "<leader>f.", ":Telescope resume<CR>", desc = "Resume last picker" },
      { "<leader>f;", ":Telescope command_history<CR>", desc = "Command history" },
      { "<leader>f'", ":Telescope search_history<CR>", desc = "Search history" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-x>"] = actions.delete_buffer,
            },
            n = {
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
          },
          file_ignore_patterns = {
            "node_modules/",
            ".git/",
            "target/",
            "dist/",
            "build/",
            ".next/",
            ".nuxt/",
            "coverage/",
            ".nyc_output/",
            "*.min.js",
            "*.min.css",
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = false,
            no_ignore_parent = false,
          },
          live_grep = {
            additional_args = function(opts)
              return { "--hidden" }
            end,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
}
