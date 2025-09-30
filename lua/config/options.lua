-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI Enhancements
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cursorline = true -- Highlight the current line

-- Clipboard
vim.opt.clipboard = "unnamed,unnamedplus" -- Use system clipboard

-- Color
vim.opt.termguicolors = true -- Enable 24-bit color support

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