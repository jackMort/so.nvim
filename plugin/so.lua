local so = require("so")

vim.api.nvim_create_user_command("SoQuery", so.query, {})
vim.api.nvim_create_user_command("SoQuerySelection", so.query_selection, { range = true })
