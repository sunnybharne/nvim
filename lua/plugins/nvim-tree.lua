return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle Nvim-tree" },
      { "<leader>o", ":NvimTreeFocus<CR>", desc = "Focus Nvim-tree" },
    },
    config = function()
      require("nvim-tree").setup({
        disable_netrw = true, -- Disables netrw completely
        hijack_netrw = true, -- Hijacks netrw on startup
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = true,
        diagnostics = {
          enable = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        git = {
          enable = true,
          ignore = true,
          timeout = 500,
        },
        view = {
          width = 30,
          side = "left",
          number = false,
          relativenumber = false,
          signcolumn = "yes",
        },
        renderer = {
          indent_markers = {
            enable = false,
            icons = {
              corner = "└ ",
              edge = "│ ",
              none = "  ",
            },
          },
          icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })
      
      -- Auto-open nvim-tree when opening a directory
      vim.api.nvim_create_autocmd("VimEnter", {
        desc = "Open Nvim-tree on startup",
        group = vim.api.nvim_create_augroup("nvimtree_start", { clear = true }),
        callback = function()
          local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
          if stats and stats.type == "directory" then
            vim.api.nvim_del_augroup_by_name("nvimtree_start")
            require("nvim-tree.api").tree.open()
          end
        end,
      })
    end,
  }
}
