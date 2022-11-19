-- module represents a lua module for the plugin
local Terminal = require('toggleterm.terminal').Terminal
local M = {}

M.so_query = function(config)
  vim.ui.input({
    prompt = config.prompt
  }, function(input)
    if input then
      local so = Terminal:new({ cmd = "so " .. input,
        direction = config.term.direction,
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })
      so:toggle()
    else
      print "You cancelled"
    end
  end)
end

return M
