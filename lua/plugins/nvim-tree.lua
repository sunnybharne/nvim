return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle Nvim-tree" },
      { "<leader>o", ":NvimTreeFocus<CR>",  desc = "Focus Nvim-tree" },
      { "<leader>E", ":NvimTreeClose<CR>",  desc = "Close Nvim-tree" },
    },
    config = function()
      -- Disable netrw at the very start of init.lua (BEFORE nvim-tree setup)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local define = vim.fn.sign_define
      define("NvimTreeDiagnosticInfoIcon", { text = "", texthl = "DiagnosticInfo" })
      define("NvimTreeDiagnosticHintIcon", { text = "", texthl = "DiagnosticHint" })
      define("NvimTreeDiagnosticWarnIcon", { text = "", texthl = "DiagnosticWarn" })
      define("NvimTreeDiagnosticErrorIcon", { text = "", texthl = "DiagnosticError" })

      require("nvim-tree").setup({
        disable_netrw = true, -- Disables netrw completely
        hijack_netrw = true,  -- Hijacks netrw on startup
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = true,
        diagnostics = {
          enable = false,
          show_on_dirs = false, -- Disable on directories to prevent conflicts
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
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

      -- Auto-close nvim-tree when closing the last buffer
      vim.api.nvim_create_autocmd("BufEnter", {
        desc = "Auto-close Nvim-tree when closing last buffer",
        group = vim.api.nvim_create_augroup("nvimtree_auto_close", { clear = true }),
        callback = function()
          local tree_view = require("nvim-tree.view")

          -- Only proceed if nvim-tree is visible
          if not tree_view.is_visible() then
            return
          end

          -- Get all valid buffers (excluding nvim-tree and other special buffers)
          local valid_buffers = vim.tbl_filter(function(buf)
            return vim.api.nvim_buf_is_valid(buf)
                and vim.bo[buf].buftype == ""
                and vim.bo[buf].filetype ~= "NvimTree"
          end, vim.api.nvim_list_bufs())

          -- If no valid buffers left, close nvim-tree
          if #valid_buffers == 0 then
            require("nvim-tree.api").tree.close()
          end
        end,
      })

      -- Auto-close nvim-tree when the last file buffer is deleted
      vim.api.nvim_create_autocmd("BufDelete", {
        desc = "Auto-close Nvim-tree when last file buffer is deleted",
        group = vim.api.nvim_create_augroup("nvimtree_auto_close_delete", { clear = true }),
        callback = function()
          local tree_view = require("nvim-tree.view")

          -- Only proceed if nvim-tree is visible
          if not tree_view.is_visible() then
            return
          end

          -- Get all valid buffers (excluding nvim-tree and other special buffers)
          local valid_buffers = vim.tbl_filter(function(buf)
            return vim.api.nvim_buf_is_valid(buf)
                and vim.bo[buf].buftype == ""
                and vim.bo[buf].filetype ~= "NvimTree"
          end, vim.api.nvim_list_bufs())

          -- If no valid buffers left, close nvim-tree
          if #valid_buffers == 0 then
            require("nvim-tree.api").tree.close()
          end
        end,
      })

      -- Auto-close nvim-tree when quitting
      vim.api.nvim_create_autocmd("QuitPre", {
        desc = "Auto-close Nvim-tree on quit",
        group = vim.api.nvim_create_augroup("nvimtree_quit", { clear = true }),
        callback = function()
          local tree_view = require("nvim-tree.view")
          if tree_view.is_visible() then
            require("nvim-tree.api").tree.close()
          end
        end,
      })

      -- Auto-close nvim-tree when all windows are closed
      vim.api.nvim_create_autocmd("WinClosed", {
        desc = "Auto-close Nvim-tree when all windows are closed",
        group = vim.api.nvim_create_augroup("nvimtree_win_closed", { clear = true }),
        callback = function()
          local tree_view = require("nvim-tree.view")

          -- Only proceed if nvim-tree is visible
          if not tree_view.is_visible() then
            return
          end

          -- Get all valid buffers (excluding nvim-tree and other special buffers)
          local valid_buffers = vim.tbl_filter(function(buf)
            return vim.api.nvim_buf_is_valid(buf)
                and vim.bo[buf].buftype == ""
                and vim.bo[buf].filetype ~= "NvimTree"
          end, vim.api.nvim_list_bufs())

          -- If no valid buffers left, close nvim-tree
          if #valid_buffers == 0 then
            require("nvim-tree.api").tree.close()
          end
        end,
      })
    end,
  }
}
