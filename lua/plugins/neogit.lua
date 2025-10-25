return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "sindrets/diffview.nvim",
    },
    event = "VeryLazy",
    config = function()
      local neogit = require("neogit")

      neogit.setup({
        disable_signs = false,
        disable_hint = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        -- Neogit refreshes its internal state after specific events, which can be expensive depending on repository size.
        -- Disabling unused events will improve performance, but may create race conditions.
        disable_builtin_notifications = false,
        auto_refresh = true,
        disable_insert_on_commit = true,
        kind = "tab",
        -- Change the default way of opening neogit
        commit_popup = {
          kind = "split",
        },
        popup = {
          kind = "split",
        },
        -- customize displayed signs
        signs = {
          -- { CLOSED, OPENED }
          section = { ">", "v" },
          item = { ">", "v" },
          hunk = { "", "" },
        },
        integrations = {
          -- Neogit only provides inline diffs. By default, the diffview integration is used.
          diffview = true,
        },
        -- Setting any section to `false` will make the section not render at all
        sections = {
          untracked = {
            folded = false,
            hidden = false,
          },
          unstaged = {
            folded = false,
            hidden = false,
          },
          staged = {
            folded = false,
            hidden = false,
          },
          stashes = {
            folded = true,
            hidden = false,
          },
          unpulled = {
            folded = true,
            hidden = false,
          },
          unmerged = {
            folded = false,
            hidden = false,
          },
          recent = {
            folded = true,
            hidden = false,
          },
        },
        -- override/add mappings
        mappings = {
          -- modify status buffer mappings
          status = {
            -- Use only valid Neogit commands
            ["s"] = "Stage",
            ["S"] = "StageUnstaged", 
            ["a"] = "StageAll",
            ["<C-s>"] = "StageAll",
            ["u"] = "Unstage",
            ["U"] = "UnstageStaged",
            ["X"] = "Discard",
            ["<C-r>"] = "RefreshBuffer",
            ["o"] = "GoToFile",
            ["<C-x>"] = "Close",
            ["<C-t>"] = "Toggle",
            ["<C-y>"] = "YankSelected",
            ["<C-e>"] = "GoToFile",
            ["<C-b>"] = "ShowRefs",
            ["<C-n>"] = "Command",
            ["<C-p>"] = "Command",
            ["<C-m>"] = "Command",
            ["<C-c>"] = "Command",
            ["<C-f>"] = "Command",
          },
        },
      })

      -- Keymaps for neogit
      vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
      vim.keymap.set("n", "<leader>nc", "<cmd>Neogit commit<cr>", { desc = "Neogit commit" })
      vim.keymap.set("n", "<leader>np", "<cmd>Neogit push<cr>", { desc = "Neogit push" })
      vim.keymap.set("n", "<leader>nP", "<cmd>Neogit pull<cr>", { desc = "Neogit pull" })
      vim.keymap.set("n", "<leader>nb", "<cmd>Neogit branch<cr>", { desc = "Neogit branch" })
      vim.keymap.set("n", "<leader>nr", "<cmd>Neogit rebase<cr>", { desc = "Neogit rebase" })
      vim.keymap.set("n", "<leader>nm", "<cmd>Neogit merge<cr>", { desc = "Neogit merge" })
      vim.keymap.set("n", "<leader>ns", "<cmd>Neogit stash<cr>", { desc = "Neogit stash" })
      vim.keymap.set("n", "<leader>nR", "<cmd>Neogit reset<cr>", { desc = "Neogit reset" })
    end,
  },
}
