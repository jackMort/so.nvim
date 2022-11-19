-- module represents a lua module for the plugin
local Terminal = require("toggleterm.terminal").Terminal
local M = {}

M.so_query = function(config)
  vim.ui.input({
    prompt = config.prompt,
  }, function(input)
    if input then
      local terminal_config =
        vim.tbl_deep_extend("keep", { cmd = config.terminal.cmd .. " " .. input }, config.terminal)
      local so = Terminal:new(terminal_config)
      so:toggle()
    else
      print("You cancelled")
    end
  end)
end

return M
