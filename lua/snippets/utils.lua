-- Global snippets utilities and shared functions
-- This file contains the basic function used across all snippet directories

local function fn( args, parent, user_args )
   return '' .. args[1][1] .. ''
end

-- Export the basic function for use in any snippet file
return {
  fn = fn,
  is_github_workflow = function()
    local path = vim.api.nvim_buf_get_name(0):gsub("\\", "/")
    return path:match("/%.github/workflows/[^/]+%.ya?ml$") ~= nil
  end,
}
