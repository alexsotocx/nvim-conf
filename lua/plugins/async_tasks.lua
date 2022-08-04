local map = require('util').map

-- Allow copen to work
vim.g.asyncrun_open = 6

vim.g.asynctasks_extra_config = {
  '~/.config/nvim/global_task.ini',
}

-- key maps
map('n', '<Leader>r', '<cmd>AsyncTask file-run<cr>', {desc="Run file"})
map('n', '<Leader>op', '<cmd>AsyncTask file-gedit<cr>', {desc="Open in gedit"})
