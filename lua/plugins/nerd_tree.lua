local map = require('util').map
local allModes = require('util').allModes

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = {'node_modules', '.git'}
vim.g.NERDTreeStatusline = ''


map(allModes, '<C-b>', '<cmd>NERDTreeToggle<CR>')
map(allModes, '<A-b>', '<cmd>NERDTreeFind<CR>')
