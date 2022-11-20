-- main module file
local module = require("so.module")

local M = {}
M.config = {
  -- default config
  prompt = " ",
  terminal = {
    direction = "float",
    cmd = "so",
    float_opts = {
      border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
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

M.query_selection = function()
  module.so_query_selection(M.config)
end

return M
