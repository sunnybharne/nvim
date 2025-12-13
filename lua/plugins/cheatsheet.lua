return {
  "doctorfree/cheatsheet.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("cheatsheet").setup({
      -- Show bundled cheatsheets
      bundled_cheatsheets = false,
      
      -- Show plugin-specific cheatsheets
      bundled_plugin_cheatsheets = false,
      
      -- Telescope mappings
      telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
        ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
      }
    })

    -- Custom function to show only user cheatsheet
    local function show_user_cheatsheet()
      local cheatsheet_path = vim.fn.stdpath("config") .. "/cheatsheet.txt"
      local lines = {}
      
      if vim.fn.filereadable(cheatsheet_path) == 1 then
        for line in io.lines(cheatsheet_path) do
          -- Skip comments and empty lines, but keep section headers
          if line:match("^##") or (line:match("|") and not line:match("^#")) then
            table.insert(lines, line)
          end
        end
      end
      
      -- Create a custom picker with just the user cheatsheet content
      require("telescope.pickers").new({}, {
        prompt_title = "My Cheatsheet",
        finder = require("telescope.finders").new_table({
          results = lines,
          entry_maker = function(line)
            return {
              value = line,
              display = line,
              ordinal = line,
            }
          end,
        }),
        sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
        previewer = nil,
        attach_mappings = function(prompt_bufnr, map)
          local actions = require("telescope.actions")
          actions.select_default:replace(function()
            local selection = require("telescope.actions.state").get_selected_entry()
            if selection then
              -- Extract command/key from the line (format: "Description | key")
              local parts = vim.split(selection.value, "|")
              if #parts == 2 then
                local key = vim.trim(parts[2])
                actions.close(prompt_bufnr)
                vim.api.nvim_feedkeys(key, "t", false)
              else
                actions.close(prompt_bufnr)
              end
            end
          end)
          return true
        end,
      }):find()
    end

    -- Keymaps for cheatsheet
    vim.keymap.set("n", "<leader>?", show_user_cheatsheet, { desc = "Open user cheatsheet" })
    vim.keymap.set("n", "<leader>?!", ":CheatsheetEdit<CR>", { desc = "Edit user cheatsheet" })
  end,
}

