-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw (required for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI Enhancements
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cursorline = true     -- Highlight the current line

-- Clipboard (Enhanced for macOS)
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
-- Ensure clipboard works on macOS
if vim.fn.has('macunix') == 1 then
  vim.g.clipboard = {
    name = 'macOS-clipboard',
    copy = {
      ['+'] = 'pbcopy',
      ['*'] = 'pbcopy',
    },
    paste = {
      ['+'] = 'pbpaste',
      ['*'] = 'pbpaste',
    },
    cache_enabled = 0,
  }
end

-- Color
vim.opt.termguicolors = true -- Enable 24-bit color support

-- Indentation (2-space soft tabs)
vim.opt.expandtab = true -- Insert spaces instead of tabs
vim.opt.shiftwidth = 2   -- Indent by 2 spaces
vim.opt.softtabstop = 2  -- A <Tab> feels like 2 spaces when editing
vim.opt.tabstop = 2      -- Display tabs as 2 spaces

-- Temporary shims for deprecated LSP APIs used by some plugins
if vim.lsp and vim.lsp.get_clients then
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.lsp.buf_get_clients = function(bufnr)
    bufnr = bufnr or 0
    return vim.lsp.get_clients({ buf = bufnr })
  end

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.lsp.get_active_clients = function(filter)
    return vim.lsp.get_clients(filter)
  end
end

