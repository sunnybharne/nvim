return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      -- Tab management keymaps
      { "<leader>tn", ":tabnew<CR>", desc = "New tab" },
      { "<leader>tc", ":tabclose<CR>", desc = "Close current tab" },
      { "<leader>to", ":tabonly<CR>", desc = "Close other tabs" },
      { "<leader>tt", function()
          -- Define the module inline to avoid require issues
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")
          local pickers = require("telescope.pickers")
          local finders = require("telescope.finders")
          local sorters = require("telescope.sorters")
          local previewers = require("telescope.previewers")

          local entries = {}
          for i = 1, vim.fn.tabpagenr("$") do
            local buflist = vim.fn.tabpagebuflist(i)
            local current_buf = buflist[1]
            local buf_name = vim.fn.bufname(current_buf)
            local cwd = vim.fn.getcwd(-1, i)
            local root = cwd ~= nil and cwd ~= "" and vim.fn.fnamemodify(cwd, ":t") or nil
            local label = root or (buf_name ~= "" and vim.fn.fnamemodify(buf_name, ":t") or "[No Name]")
            local display = string.format("Tab %d: %s", i, label)
            table.insert(entries, { tabnr = i, bufnr = current_buf, filename = buf_name, cwd = cwd, label = label, display = display })
          end

          pickers.new({}, {
            prompt_title = "Tabs",
            finder = finders.new_table({
              results = entries,
              entry_maker = function(entry)
                return {
                  value = entry,
                  display = entry.display,
                  ordinal = entry.display,
                  filename = entry.filename,
                  tabnr = entry.tabnr,
                  bufnr = entry.bufnr,
                }
              end,
            }),
            sorter = sorters.get_generic_fuzzy_sorter(),
            previewer = previewers.new_buffer_previewer({
              define_preview = function(self, entry, status)
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, {
                  "Tab " .. entry.tabnr,
                  "Project: " .. (entry.label or ""),
                  "CWD: " .. (entry.cwd or ""),
                  "Buffer: " .. entry.bufnr,
                  "File: " .. (entry.filename or ""),
                })
              end,
            }),
            attach_mappings = function(prompt_bufnr, map)
              actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                if selection then
                  actions.close(prompt_bufnr)
                  vim.cmd("tabnext " .. selection.tabnr)
                end
              end)
              return true
            end,
          }):find()
        end, desc = "Switch tabs" },
      -- Go to specific tabs
      { "<leader>t1", "1gt", desc = "Go to tab 1" },
      { "<leader>t2", "2gt", desc = "Go to tab 2" },
      { "<leader>t3", "3gt", desc = "Go to tab 3" },
      { "<leader>t4", "4gt", desc = "Go to tab 4" },
      { "<leader>t5", "5gt", desc = "Go to tab 5" },
      { "<leader>t6", "6gt", desc = "Go to tab 6" },
      { "<leader>t7", "7gt", desc = "Go to tab 7" },
      { "<leader>t8", "8gt", desc = "Go to tab 8" },
      { "<leader>t9", "9gt", desc = "Go to tab 9" },
    },
    config = function()
      -- Configuration is handled inline in the keymap
    end,
  },
}
