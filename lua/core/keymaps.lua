local util = require('util')

vim.g.mapleader = ','

-- Navigation
util.map('n', '<C-Left>', '<cmd>tabprevious<CR>')
util.map('n', '<C-Right>', '<cmd>tabnext<CR>')
util.map('n', '<C-S-Left>', '<C-w>h') -- Move to left
util.map('n', '<C-S-Down>', '<C-w>j') -- Move Down
util.map('n', '<C-S-Up>', '<C-w>k') -- Move Up
util.map('n', '<C-S-Right>', '<C-w>l') -- Move Right

util.map('t',  '<Leader><Esc>', '<C-\\><C-N>') 

allModes = {'n', 'i', 'v', 't'}

util.map(allModes, '<C-s>', '<cmd>w<CR>', {desc = 'Save'})
util.map(allModes, '<A-w>', '<cmd>bd<CR>') -- Quit the buffer

