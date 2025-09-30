return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
      { "<leader>ff", ":Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", ":Telescope buffers<CR>", desc = "Find buffers" },
      { "<leader>fh", ":Telescope help_tags<CR>", desc = "Help tags" },
      { "<leader>fr", ":Telescope oldfiles<CR>", desc = "Recent files" },
      { "<leader>fc", ":Telescope commands<CR>", desc = "Commands" },
      { "<leader>fk", ":Telescope keymaps<CR>", desc = "Keymaps" },
      -- Git keymaps (changed to avoid conflict with LazyGit)
      { "<leader>tf", ":Telescope git_files<CR>", desc = "Git files" },
      { "<leader>ts", ":Telescope git_status<CR>", desc = "Git status" },
      { "<leader>tb", ":Telescope git_branches<CR>", desc = "Git branches" },
      { "<leader>tgc", ":Telescope git_commits<CR>", desc = "Git commits" },
      { "<leader>tC", ":Telescope git_bcommits<CR>", desc = "Git buffer commits" },
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
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
}
