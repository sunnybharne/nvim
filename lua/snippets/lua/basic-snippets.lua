local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Lua configuration snippets
-- Version: 1.0.0
-- Last Updated: 2024-12-19
-- Author: sunnybharne

local lua_snippets = {
  -- Basic function
  s("function", {
    t("function "), i(1, "functionName"), t("("), i(2, "params"), t(")"),
    t({ "", "  " }), i(3, "-- function body"), t({ "", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Local function
  s("lfunction", {
    t("local function "), i(1, "functionName"), t("("), i(2, "params"), t(")"),
    t({ "", "  " }), i(3, "-- function body"), t({ "", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- If statement
  s("if", {
    t("if "), i(1, "condition"), t(" then"),
    t({ "", "  " }), i(2, "-- if body"), t({ "", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- If-else statement
  s("ifelse", {
    t("if "), i(1, "condition"), t(" then"),
    t({ "", "  " }), i(2, "-- if body"),
    t({ "", "else" }),
    t({ "", "  " }), i(3, "-- else body"), t({ "", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- For loop
  s("for", {
    t("for "), i(1, "i"), t(" = "), i(2, "1"), t(", "), i(3, "10"), t(" do"),
    t({ "", "  " }), i(4, "-- loop body"), t({ "", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- For-in loop
  s("forin", {
    t("for "), i(1, "key"), t(", "), i(2, "value"), t(" in "), i(3, "pairs(table)"), t(" do"),
    t({ "", "  " }), i(4, "-- loop body"), t({ "", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- While loop
  s("while", {
    t("while "), i(1, "condition"), t(" do"),
    t({ "", "  " }), i(2, "-- loop body"), t({ "", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Table creation
  s("table", {
    t("local "), i(1, "tableName"), t(" = {"),
    t({ "", "  " }), i(2, "-- table contents"), t({ "", "}" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Module require
  s("require", {
    t("local "), i(1, "moduleName"), t(" = require(\""), i(2, "module.path"), t("\")"),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Local variable
  s("local", {
    t("local "), i(1, "variableName"), t(" = "), i(2, "value"),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Return statement
  s("return", {
    t("return "), i(1, "value"),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Error handling with pcall
  s("pcall", {
    t("local "), i(1, "success"), t(", "), i(2, "result"), t(" = pcall("), i(3, "function"), t(")"),
    t({ "", "if not " }), f(function(args) return args[1][1] end, {1}), t(" then"),
    t({ "", "  error(\"" }), i(4, "error message"), t({ "\")", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Neovim keymap
  s("keymap", {
    t("vim.keymap.set(\""), i(1, "n"), t("\", \""), i(2, "<leader>key"), t("\", "), i(3, "function"), t(", { desc = \""), i(4, "description"), t("\" })"),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Neovim autocmd
  s("autocmd", {
    t("vim.api.nvim_create_autocmd(\""), i(1, "BufEnter"), t("\", {"),
    t({ "", "  desc = \"" }), i(2, "description"), t({ "\"," }),
    t({ "", "  group = vim.api.nvim_create_augroup(\"" }), i(3, "groupName"), t({ "\", { clear = true })," }),
    t({ "", "  callback = function()" }),
    t({ "", "    " }), i(4, "-- autocmd body"), t({ "", "  end" }),
    t({ "", "})" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Plugin configuration
  s("plugin", {
    t("return {"),
    t({ "", "  {" }),
    t({ "", "    \"" }), i(1, "plugin.name"), t({ "\"," }),
    t({ "", "    config = function()" }),
    t({ "", "      " }), i(2, "-- plugin configuration"), t({ "", "    end" }),
    t({ "", "  }" }),
    t({ "", "}" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Lazy.nvim plugin
  s("lazy", {
    t("{" }),
    t({ "", "  \"" }), i(1, "plugin.name"), t({ "\"," }),
    t({ "", "  event = \"" }), i(2, "InsertEnter"), t({ "\"," }),
    t({ "", "  dependencies = {" }),
    t({ "", "    " }), i(3, "-- dependencies"), t({ "", "  }," }),
    t({ "", "  config = function()" }),
    t({ "", "    " }), i(4, "-- plugin configuration"), t({ "", "  end" }),
    t({ "", "}" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Comment block
  s("comment", {
    t("-- "), i(1, "comment text"),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Multi-line comment
  s("mcomment", {
    t("--[[ "), i(1, "comment text"), t({ " ]]" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Print statement
  s("print", {
    t("print(\"" }), i(1, "message"), t({ "\")" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Error handling
  s("error", {
    t("error(\"" }), i(1, "error message"), t({ "\")" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Assert statement
  s("assert", {
    t("assert(" }), i(1, "condition"), t(", \"" }), i(2, "error message"), t({ "\")" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Type annotation (for Lua with type checking)
  s("type", {
    t("---@type " }), i(1, "string"), t({ "" }),
    t("local " }), i(2, "variableName"), t(" = " }), i(3, "value"),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  }),

  -- Function type annotation
  s("ftype", {
    t("---@param " }), i(1, "param"), t(" " }), i(2, "string"), t({ "" }),
    t("---@return " }), i(3, "string"), t({ "" }),
    t("local function " }), i(4, "functionName"), t("(" }), i(5, "param"), t(")"),
    t({ "", "  " }), i(6, "-- function body"), t({ "", "end" }),
    t({ "", "" }),
    i(0, ""), -- Final insert node
  })
}

-- Version metadata
local version_info = {
  version = "1.0.0",
  last_updated = "2024-12-19",
  author = "sunnybharne",
  description = "Lua programming snippets for Neovim configuration and general Lua development",
  changelog = {
    ["1.0.0"] = "Initial Lua snippets with basic programming constructs and Neovim-specific snippets"
  }
}

-- Register snippets with version info
ls.add_snippets('lua', lua_snippets)

-- Export version info for debugging/info
return {
  snippets = lua_snippets,
  version = version_info
}
