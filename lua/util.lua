local utilF = {}

function utilF.map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

utilF.allModes = {'n', 'i', 't', 'v'}

return utilF
