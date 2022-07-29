local function map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

vim.g.mapleader = ' '

-- Navigation
map('n', '<C-Left>', '<cmd>tabprevious<CR>')
map('n', '<C-Right>', '<cmd>tabnext<CR>')
map('n', '<C-S-Left>', '<C-w>h') -- Move to left
map('n', '<C-S-Down>', '<C-w>j') -- Move Down
map('n', '<C-S-Up>', '<C-w>k') -- Move Up
map('n', '<C-S-Right>', '<C-w>l') -- Move Right

map('t',  '<Leader><Esc>', '<C-\\><C-N>') 

allModes = {'n', 'i', 'v', 't'}


map(allModes, '<C-b>', '<cmd>NERDTreeToggle<CR>')

map(allModes, '<C-s>', '<cmd>w<CR>') -- Save
map(allModes, '<A-w>', '<cmd>bd<CR>') -- Quit the buffer

