-- Reload configuration
vim.keymap.set("n", "<Leader>rr", function()
  -- Clear and reload the options module to ensure clean state
  package.loaded["config.options"] = nil
  require("config.options")
  -- Reload the rest of the configuration
  vim.cmd("source ~/.config/nvim/init.lua")
  vim.notify("Configuration reloaded!", vim.log.levels.INFO)
end, { desc = "Reload configuration" })

-- Markdown preview keymaps
vim.keymap.set("n", "<Leader>mp", ":MarkdownPreview<CR>", { desc = "Start markdown preview" })
vim.keymap.set("n", "<Leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })
vim.keymap.set("n", "<Leader>mt", ":MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })

vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true }) -- Indent left and reselect
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true }) -- Indent right and reselect

-- Enhanced Clipboard Operations
-- Copy to system clipboard explicitly
vim.keymap.set("v", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<Leader>Y", '"+Y', { desc = "Copy line to system clipboard" })

-- Paste from system clipboard
vim.keymap.set("n", "<Leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<Leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- Copy entire file to clipboard
vim.keymap.set("n", "<Leader>ca", ":%y+<CR>", { desc = "Copy entire file to clipboard" })

-- Paste in insert mode from system clipboard
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { desc = "Paste from system clipboard in insert mode" })

-- Window navigation is handled by vim-tmux-navigator plugin
-- See lua/plugins/tmux-navigator.lua for configuration

-- Window splitting keymaps
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window resizing
vim.keymap.set("n", "<leader>w>", "<C-w>5>", { desc = "Increase width" })
vim.keymap.set("n", "<leader>w<", "<C-w>5<", { desc = "Decrease width" })
vim.keymap.set("n", "<leader>w+", "<C-w>5+", { desc = "Increase height" })
vim.keymap.set("n", "<leader>w-", "<C-w>5-", { desc = "Decrease height" })

-- Smart quit keybindings for Neo-tree scenarios
vim.keymap.set("n", "<Leader>q", function()
  -- Check if Neo-tree is open
  local neo_tree_open = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if string.find(buf_name, "neo%-tree") then
      neo_tree_open = true
      break
    end
  end

  if neo_tree_open then
    -- Close Neo-tree first, then quit the current buffer
    vim.cmd("Neotree close")
    vim.cmd("q")
  else
    -- Just quit the current buffer
    vim.cmd("q")
  end
end, { desc = "Smart quit (handles Neo-tree)" })

vim.keymap.set("n", "<Leader>Q", function()
  -- Force quit everything including Neo-tree
  vim.cmd("Neotree close")
  vim.cmd("q!")
end, { desc = "Force quit everything" })

-- Reserve <Leader>e for NvimTree (set in plugin config)

-- Project management keymaps
vim.keymap.set("n", "<Leader>p", ":Telescope projects<CR>", { desc = "Open project picker" })
vim.keymap.set("n", "<Leader>P", ":ProjectRoot<CR>", { desc = "Change to project root" })
-- Removed <Leader>f mapping - conflicts with telescope <leader>ff, <leader>fg, etc.
-- Telescope keymaps are defined in telescope.lua plugin config
--
-- neogit key maps
vim.keymap.set("n", "<leader>ga", function()
  vim.system({ "git", "add", "." }, { text = true })
  vim.system({ "git", "commit", "--amend", "--no-edit" }, { text = true })
  vim.system({ "git", "push" }, { text = true })
  vim.notify("Staged, amended last commit, and pushed!", vim.log.levels.INFO)
end, { desc = "Stage all + Amend last commit + Push" })

vim.keymap.set("n", "<leader>gp", function()
  vim.system({ "git", "add", "." }, { text = true }, function(add_out)
    vim.system({ "git", "commit", "-m", "auto" }, { text = true }, function(commit_out)
      if commit_out.code == 0 then
        vim.system({ "git", "push" }, { text = true }, function(push_out)
          if push_out.code == 0 then
            vim.notify("Staged, committed, and pushed!", vim.log.levels.INFO)
          else
            vim.notify("Push failed: " .. (push_out.stderr or ""), vim.log.levels.ERROR)
          end
        end)
      else
        vim.notify("Nothing to commit or commit failed: " .. (commit_out.stderr or ""), vim.log.levels.WARN)
      end
    end)
  end)
end, { desc = "Stage + Commit + Push (sequential)" })
