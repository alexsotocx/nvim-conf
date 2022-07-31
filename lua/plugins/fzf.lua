local map = require('util').map
local allModes = require('util').allModes

-- keymaps
map(allModes, '<C-p>', '<cmd>Files<CR>', {desc = 'Open the files finder'})
map(allModes, '<leader>p', '<cmd>Buffers<CR>', {desc = 'Open the buffers explorer'})

-- Ignore
vim.env.FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules --ignore .git -g ""'
vim.env.FZF_DEFAULT_OPTS='--reverse'

vim.g.fzf_actions = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-i'] = 'split',
  ['ctrl-v'] = 'vsplit',
  ['ctrl-q'] =  'wall |  bdelete'
}

