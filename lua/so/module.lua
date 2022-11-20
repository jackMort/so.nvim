-- module represents a lua module for the plugin
local Terminal = require("toggleterm.terminal").Terminal
local M = {}

local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, "\n")
end

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

M.so_query_selection = function(config)
  local input = get_visual_selection()
  local terminal_config = vim.tbl_deep_extend("keep", { cmd = config.terminal.cmd .. " " .. input }, config.terminal)
  local so = Terminal:new(terminal_config)
  so:toggle()
end

return M
