return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
      local bufferline = require("bufferline")

      bufferline.setup({
        options = {
          mode = "buffers", -- set to "tabs" to only show tabpages instead
          style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
          themable = true, -- allows highlight groups to be overridden
          numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
          close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
          right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
          left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
          middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
          -- NOTE: this plugin is designed with this icon in mind,
          -- and so changing this is NOT recommended, this is intended
          -- as an "escape hatch" for people who cannot bear it for whatever reason
          indicator = {
            icon = "▎", -- this should be omitted if indicator style is not 'icon'
            style = "icon", -- | 'underline' | 'none',
          },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "󰅖",
          left_trunc_marker = "󰅂",
          right_trunc_marker = "󰅃",
          --- name_formatter can be used to change the buffer's label in the bufferline.
          --- Please note some names can/will break the
          --- bufferline so use this at your own risk giving no guarantee
          --- about how well it will work in each context.
          name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match("%.md") then
              return vim.fn.fnamemodify(buf.name, ":t:r")
            end
          end,
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          truncate_names = true, -- whether or not tab names should be truncated
          tab_size = 18,
          diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
          diagnostics_update_in_insert = false,
          -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          -- NOTE: this will be called a lot so don't do any heavy processing here
          custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
              return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
              return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.fn.bufname(buf_number) == "wiki" then
              return false
            end
            -- filter out by it's index number in list (don't show first buffer)
            if buf_numbers[1] ~= buf_number then
              return true
            end
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
          color_icons = true, -- whether or not to add the filetype icon highlights
          get_element_icon = function(element)
            -- element consists of {filetype: string, path: string, extension: string, directory: string}
            -- This can be used to change how bufferline fetches the icon
            -- for an element for example fetching a icon from a external file
            -- based on the filetype and/or path
            return ""
          end,
          show_buffer_icons = true, -- disable filetype icons for buffers
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          -- can also be a table containing 2 custom separators
          -- [focused and unfocused]. eg: { '|', '|' }
          separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
          sort_by = "insert_after_current", -- | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
          -- add custom logic
          -- return buffer_a.modified > buffer_b.modified
          -- end
        },
      })

      -- Keymaps for bufferline
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Buffer navigation
      keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", opts)
      keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", opts)
      keymap("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", opts)
      keymap("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", opts)
      keymap("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", opts)
      keymap("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", opts)
      keymap("n", "<leader>bx", "<cmd>BufferLinePickClose<cr>", opts)
      keymap("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
      keymap("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
      keymap("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
      keymap("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
      keymap("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", opts)
      keymap("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", opts)
      keymap("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", opts)
      keymap("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", opts)
      keymap("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", opts)
    end,
  },
}
