local util = {}

function util.printf(...) return string.format(...) end

function util.map(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

util.allModes = { 'n', 'i', 't', 'v' }

return util
