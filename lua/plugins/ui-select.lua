return {
  -- UI Select integration for better picker experience
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
  
  -- FZF Lua for alternative picker
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            default = "bat",
            horizontal = "right:60%",
            vertical = "down:60%",
            wrap = "nowrap",
            hidden = "nohidden",
            border = "border",
            title = true,
          },
        },
        keymap = {
          builtin = {
            ["<C-f>"] = "toggle-fullscreen",
            ["<C-r>"] = "toggle-preview-wrap",
            ["<C-y>"] = "preview-page-down",
            ["<C-e>"] = "preview-page-up",
            ["<S-up>"] = "preview-page-up",
            ["<S-down>"] = "preview-page-down",
          },
          fzf = {
            ["esc"] = "abort",
            ["ctrl-h"] = "toggle-help",
            ["ctrl-b"] = "toggle-preview-wrap",
            ["ctrl-d"] = "preview-page-down",
            ["ctrl-f"] = "preview-page-up",
            ["ctrl-a"] = "beginning-of-line",
            ["ctrl-e"] = "end-of-line",
            ["alt-b"] = "backward-char",
            ["alt-f"] = "forward-char",
            ["alt-d"] = "forward-word",
            ["alt-w"] = "backward-kill-word",
            ["ctrl-k"] = "kill-line",
            ["ctrl-l"] = "clear-screen",
          },
        },
        files = {
          previewer = "bat",
          prompt = "Files❯ ",
          git_icons = true,
          file_icons = true,
          color_icons = true,
          git_status_cmd = "git status --porcelain",
        },
        grep = {
          prompt = "Rg❯ ",
          input_prompt = "Grep For❯ ",
          git_icons = true,
          file_icons = true,
          color_icons = true,
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096",
          rg_glob = "!.git/*",
        },
        buffers = {
          prompt = "Buffers❯ ",
          file_icons = true,
          color_icons = true,
          sort_lastused = true,
        },
        git = {
          files = {
            prompt = "GitFiles❯ ",
            cmd = "git ls-files --exclude-standard --cached --others",
            git_icons = true,
            file_icons = true,
            color_icons = true,
          },
          status = {
            prompt = "GitStatus❯ ",
            cmd = "git status --porcelain",
            file_icons = true,
            git_icons = true,
            color_icons = true,
          },
          commits = {
            prompt = "Commits❯ ",
            cmd = "git log --pretty=oneline --abbrev-commit --color",
            preview = "git show --pretty=fuller --color {1}",
            actions = {
              ["default"] = require("fzf-lua.actions").git_commits,
              ["ctrl-y"] = require("fzf-lua.actions").git_commits,
            },
          },
          bcommits = {
            prompt = "BCommits❯ ",
            cmd = "git log --pretty=oneline --abbrev-commit --color",
            preview = "git show --pretty=fuller --color {1}",
            actions = {
              ["default"] = require("fzf-lua.actions").git_bcommits,
              ["ctrl-y"] = require("fzf-lua.actions").git_bcommits,
            },
          },
          branches = {
            prompt = "Branches❯ ",
            cmd = "git branch --all --color",
            preview = "git log --oneline --graph --date=short --pretty=format:'%C(auto)%cd %h%d %s' {1}",
            actions = {
              ["default"] = require("fzf-lua.actions").git_branches,
              ["ctrl-y"] = require("fzf-lua.actions").git_branches,
            },
          },
        },
        lsp = {
          prompt_postfix = "❯ ",
          prompt = "LSP❯ ",
          file_icons = true,
          color_icons = true,
          git_icons = true,
        },
        helptags = {
          prompt = "HelpTags❯ ",
        },
        manpages = {
          prompt = "ManPages❯ ",
        },
        colorschemes = {
          prompt = "Colorschemes❯ ",
          live_preview = true,
        },
        quickfix = {
          prompt = "Quickfix❯ ",
          file_icons = true,
          color_icons = true,
        },
        loclist = {
          prompt = "LocList❯ ",
          file_icons = true,
          color_icons = true,
        },
        tags = {
          prompt = "Tags❯ ",
          file_icons = true,
          color_icons = true,
        },
        btags = {
          prompt = "BTags❯ ",
          file_icons = true,
          color_icons = true,
        },
        changes = {
          prompt = "Changes❯ ",
          file_icons = true,
          color_icons = true,
        },
        registers = {
          prompt = "Registers❯ ",
        },
        spell_suggest = {
          prompt = "SpellSuggest❯ ",
        },
        symbols = {
          prompt = "Symbols❯ ",
          file_icons = true,
          color_icons = true,
        },
        commands = {
          prompt = "Commands❯ ",
        },
        command_history = {
          prompt = "CommandHistory❯ ",
        },
        search_history = {
          prompt = "SearchHistory❯ ",
        },
      })
      
      -- Register fzf-lua as ui-select
      require("fzf-lua").register_ui_select()
    end,
    -- Disabled FzfLua keymaps to avoid conflicts with Telescope
    -- If you want to use FzfLua instead, uncomment these and disable Telescope keymaps
    --[[
    keys = {
      { "<leader>ff", ":FzfLua files<CR>", desc = "Find files" },
      { "<leader>fg", ":FzfLua live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", ":FzfLua buffers<CR>", desc = "Find buffers" },
      { "<leader>fh", ":FzfLua help_tags<CR>", desc = "Help tags" },
      { "<leader>fr", ":FzfLua oldfiles<CR>", desc = "Recent files" },
      { "<leader>fc", ":FzfLua commands<CR>", desc = "Commands" },
      { "<leader>fk", ":FzfLua keymaps<CR>", desc = "Keymaps" },
      { "<leader>gf", ":FzfLua git_files<CR>", desc = "Git files" },
      { "<leader>gs", ":FzfLua git_status<CR>", desc = "Git status" },
      { "<leader>gb", ":FzfLua git_branches<CR>", desc = "Git branches" },
      { "<leader>gc", ":FzfLua git_commits<CR>", desc = "Git commits" },
      { "<leader>gC", ":FzfLua git_bcommits<CR>", desc = "Git buffer commits" },
    },
    ]]--
  },
  
  -- Mini.pick as alternative picker
  {
    "echasnovski/mini.pick",
    version = false,
    config = function()
      require("mini.pick").setup({
        mappings = {
          choose = "<CR>",
          choose_in_split = "<C-s>",
          choose_in_tab = "<C-t>",
          choose_marked = "<C-m>",
          choose_all = "<C-a>",
          choose_all_in_split = "<C-S>",
          choose_all_in_tab = "<C-T>",
          choose_marked_all = "<C-M>",
          mark = "<C-space>",
          mark_all = "<C-A>",
          unmark = "<C-space>",
          unmark_all = "<C-A>",
          toggle_preview = "<C-p>",
          toggle_preview_auto = "<C-P>",
          toggle_focus = "<C-f>",
          toggle_anchor = "<C-a>",
          toggle_marked = "<C-m>",
          go_in = "<C-i>",
          go_in_plus = "<C-I>",
          go_out = "<C-o>",
          go_out_plus = "<C-O>",
          go_out_prev = "<C-[>",  -- Fixed: changed from <C-u> to avoid conflict
          go_out_next = "<C-]>",  -- Fixed: changed from <C-d> to avoid conflict
          go_left = "<C-h>",
          go_right = "<C-l>",
          go_start = "<C-b>",
          go_end = "<C-e>",
          scroll_up = "<C-k>",
          scroll_down = "<C-j>",
          scroll_up_half = "<C-u>",    -- Keep original
          scroll_down_half = "<C-d>",  -- Keep original
          scroll_left = "<C-h>",
          scroll_right = "<C-l>",
          scroll_start = "<C-b>",
          scroll_end = "<C-e>",
          scroll_anchor = "<C-a>",
          scroll_anchor_plus = "<C-A>",
          scroll_anchor_minus = "<C-x>",
          scroll_anchor_reset = "<C-r>",
          scroll_anchor_set = "<C-s>",
          scroll_anchor_toggle = "<C-t>",
          scroll_anchor_prev = "<C-p>",
          scroll_anchor_next = "<C-n>",
          scroll_anchor_first = "<C-f>",
          scroll_anchor_last = "<C-l>",
          scroll_anchor_mark = "<C-m>",
          scroll_anchor_unmark = "<C-u>",
          scroll_anchor_mark_all = "<C-M>",
          scroll_anchor_unmark_all = "<C-U>",
          scroll_anchor_toggle_marked = "<C-T>",
          scroll_anchor_go_in = "<C-i>",
          scroll_anchor_go_in_plus = "<C-I>",
          scroll_anchor_go_out = "<C-o>",
          scroll_anchor_go_out_plus = "<C-O>",
          scroll_anchor_go_out_prev = "<C-u>",
          scroll_anchor_go_out_next = "<C-d>",
          scroll_anchor_go_left = "<C-h>",
          scroll_anchor_go_right = "<C-l>",
          scroll_anchor_go_start = "<C-b>",
          scroll_anchor_go_end = "<C-e>",
          scroll_anchor_scroll_up = "<C-k>",
          scroll_anchor_scroll_down = "<C-j>",
          scroll_anchor_scroll_up_half = "<C-u>",
          scroll_anchor_scroll_down_half = "<C-d>",
          scroll_anchor_scroll_left = "<C-h>",
          scroll_anchor_scroll_right = "<C-l>",
          scroll_anchor_scroll_start = "<C-b>",
          scroll_anchor_scroll_end = "<C-e>",
        },
      })
      
      -- Set mini.pick as ui_select
      vim.ui.select = require("mini.pick").ui_select
    end,
  },
}
