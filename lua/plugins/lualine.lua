return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
      local lualine = require("lualine")

      -- Get the colors from the tokyonight theme
      local colors = {
        bg = "#1a1b26",
        fg = "#a9b1d6",
        yellow = "#e0af68",
        cyan = "#7dcfff",
        darkblue = "#081633",
        green = "#9ece6a",
        orange = "#ff9e64",
        violet = "#9d7cd8",
        magenta = "#bb9af7",
        blue = "#7aa2f7",
        red = "#f7768e",
      }

      lualine.setup({
        options = {
          icons_enabled = true,
          theme = "tokyonight",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { 
            function()
              local current_tab = vim.fn.tabpagenr()
              local total_tabs = vim.fn.tabpagenr("$")
              if total_tabs > 1 then
                return string.format("Tab %d/%d", current_tab, total_tabs)
              end
              return ""
            end,
            "location" 
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        -- Remove unsupported extensions to avoid :LualineNotices warnings
        extensions = { "nvim-tree", "lazy" },
      })
    end,
  },
}
