-- Leader Key
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key

-- UI Enhancements
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cursorline = true -- Highlight the current line
-- vim.opt.cursorcolumn = true         -- Highlight the current column (vertical)
vim.opt.cursorlineopt = "both" -- Highlight both line and number
vim.opt.termguicolors = true -- Enable 24-bit color support
vim.opt.wrap = true -- Enable line wrapping

-- Clipboard
vim.opt.clipboard = "unnamed,unnamedplus" -- Use system clipboard

-- Disable Netrw (If using nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation
vim.opt.tabstop = 2 -- Tab width = 2 spaces
vim.opt.shiftwidth = 2 -- Auto-indent width = 2 spaces
vim.opt.softtabstop = 2 -- Consistent backspacing
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- Maintain indentation from previous line
vim.opt.smartindent = true -- Smart indenting based on syntax

-- Azure Subscription Function
local function get_azure_subscription()
  local handle = io.popen("az account show --query name -o tsv 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:gsub("^%s*(.-)%s*$", "%1") -- trim whitespace
  end
  return nil
end

local function get_azure_subscription_id()
  local handle = io.popen("az account show --query id -o tsv 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:gsub("^%s*(.-)%s*$", "%1") -- trim whitespace
  end
  return nil
end

local function show_azure_subscription()
  local subscription_name = get_azure_subscription()
  local subscription_id = get_azure_subscription_id()
  
  if not subscription_name or subscription_name == "" then
    vim.notify("Not logged into Azure CLI or no subscription found", vim.log.levels.WARN)
    return
  end

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Prepare content
  local content = {
    "Azure Subscription Info",
    "======================",
    "",
    "Subscription Name: " .. subscription_name,
    "Subscription ID: " .. (subscription_id or "N/A"),
    "",
    "Press 'q' to close this window"
  }
  
  -- Set buffer content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  
  -- Make buffer readonly
  vim.api.nvim_buf_set_option(buf, "readonly", true)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  
  -- Calculate window dimensions
  local width = 50
  local height = #content
  local row = (vim.o.lines - height) / 2
  local col = (vim.o.columns - width) / 2
  
  -- Create floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    border = "rounded",
    title = "Azure Subscription",
    title_pos = "center",
    style = "minimal",
  })
  
  -- Set window options
  vim.api.nvim_win_set_option(win, "number", false)
  vim.api.nvim_win_set_option(win, "relativenumber", false)
  vim.api.nvim_win_set_option(win, "wrap", false)
  
  -- Add keymap to close window
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<cr>", { noremap = true, silent = true })
  
  -- Auto close after 10 seconds (optional)
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 10000)
end

-- Create user command
vim.api.nvim_create_user_command("AzureSubscription", show_azure_subscription, {
  desc = "Show current Azure subscription information"
})


