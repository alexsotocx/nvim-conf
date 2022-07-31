local lsp = require('lspconfig')
local lformat = require("lsp-format")

local map = require('util').map

-- Intialize format
lformat.setup {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  lformat.on_attach(client)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end


local cmp = require('plugins/lsp/autocomplete')

-- Python
lsp.pyright.setup { on_attach = on_attach, capabilities = cmp.capabilities }
-- golang
lsp.gopls.setup { on_attach = on_attach, capabilities = cmp.capabilities }
