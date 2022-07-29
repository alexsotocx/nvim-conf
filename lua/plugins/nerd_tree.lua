local function map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = {'node_modules', '.git'}
vim.g.NERDTreeStatusline = ''


map(allModes, '<C-b>', '<cmd>NERDTreeToggle<CR>')
