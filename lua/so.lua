-- main module file
local module = require("so.module")

local M = {}
M.config = {
  -- default config
  prompt = " ",
  term = {
    direction = "float"
  },
}

-- setup is the public method to setup your plugin
M.setup = function(args)
  -- you can define your setup function here. Usually configurations can be merged, accepting outside params and
  -- you can also put some validation here for those.
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

-- "query" is a public method for the plugin
M.query = function()
  module.so_query(M.config)
end

return M
