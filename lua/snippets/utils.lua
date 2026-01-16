-- Global snippets utilities and shared functions
-- This file contains the basic function used across all snippet directories

local function fn( args, parent, user_args )
   return '' .. args[1][1] .. ''
end

-- Export the basic function for use in any snippet file
return {
  fn = fn
}
