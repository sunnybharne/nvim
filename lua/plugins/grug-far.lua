return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          require("grug-far").open()
        end,
        desc = "Search and Replace (grug-far)",
      },
      {
        "<leader>sR",
        function()
          require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
        end,
        desc = "Search and Replace (current file)",
      },
      {
        "<leader>sr",
        function()
          require("grug-far").with_visual_selection()
        end,
        desc = "Search and Replace (visual)",
        mode = "v",
      },
    },
    config = function()
      require("grug-far").setup({
        -- Options, see Configuration section below
        -- leave empty to use default values

        -- Start search in insert mode by default
        startInInsertMode = true,

        -- Debounce for search
        debounceMs = 500,

        -- Minimum number of chars to trigger live search
        minSearchChars = 2,

        -- Max number of search results shown
        maxSearchCharsInTitles = 30,

        -- Whether to search hidden files/directories
        searchOnInsertLeave = false,

        -- Keybindings (uses <localleader> by default)
        keymaps = {
          replace = { n = "<localleader>r" },
          qflist = { n = "<localleader>q" },
          syncLocations = { n = "<localleader>s" },
          syncLine = { n = "<localleader>l" },
          close = { n = "<localleader>c" },
          historyOpen = { n = "<localleader>t" },
          historyAdd = { n = "<localleader>a" },
          refresh = { n = "<localleader>f" },
          openLocation = { n = "<localleader>o" },
          gotoLocation = { n = "<enter>" },
          pickHistoryEntry = { n = "<enter>" },
          abort = { n = "<localleader>b" },
          help = { n = "g?" },
        },

        -- Icons
        icons = {
          enabled = true,
        },

        -- Engine (ripgrep or astgrep)
        engines = {
          ripgrep = {
            -- ripgrep specific options
          },
        },
      })
    end,
  },
}
