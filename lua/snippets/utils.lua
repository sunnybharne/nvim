local M = {}

function M.fn(args, parent, user_args)
  return '' .. args[1][1] .. user_args .. ''
end

return M
